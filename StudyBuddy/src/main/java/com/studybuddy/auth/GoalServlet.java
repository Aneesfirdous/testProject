package com.studybuddy.auth;

import com.google.gson.Gson;
import com.studybuddy.dao.AchievementDAO;
import com.studybuddy.dao.GoalDAO;
import com.studybuddy.model.Goal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class GoalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            listGoals(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No action specified.");
            return;
        }

        switch (action) {
            case "add":    addGoal(request, response); break;
            case "toggle": toggleGoal(request, response); break;
            case "delete": deleteGoal(request, response); break;
            case "edit":   editGoal(request, response); break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    private Integer getUserIdFromSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
            return null;
        }
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User ID not found in session.");
            return null;
        }
        return userId;
    }

    private void listGoals(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getUserIdFromSession(request, response);
        if (userId == null) return;

        try (Connection conn = DBUtil.getConnection()) {
            GoalDAO goalDAO = new GoalDAO(conn);
            List<Goal> goals = goalDAO.getGoalsByUserId(userId);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(goals));
            out.flush();

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void addGoal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getUserIdFromSession(request, response);
        if (userId == null) return;

        String goalText = request.getParameter("goal");
        if (goalText == null || goalText.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Goal text is required.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            GoalDAO goalDAO = new GoalDAO(conn);
            Goal newGoal = new Goal();
            newGoal.setText(goalText);
            newGoal.setCompleted(false);
            newGoal.setUserId(userId);
            goalDAO.addGoal(newGoal);

            response.setStatus(HttpServletResponse.SC_OK);

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void toggleGoal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getUserIdFromSession(request, response);
        if (userId == null) return;

        String goalIdStr = request.getParameter("id");
        String completedStr = request.getParameter("completed");

        if (goalIdStr == null || completedStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing goal ID or completed status.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            int goalId = Integer.parseInt(goalIdStr);
            boolean completed = Boolean.parseBoolean(completedStr);

            GoalDAO goalDAO = new GoalDAO(conn);
            boolean success = goalDAO.toggleGoal(goalId, completed, userId);

            if (success) {
                if (completed) {
                    AchievementDAO achievementDAO = new AchievementDAO(conn);
                    achievementDAO.checkAndAssignGoalAchievement(userId);
                }
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Failed to update goal. It may not belong to the user.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid goal ID.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void deleteGoal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getUserIdFromSession(request, response);
        if (userId == null) return;

        String goalIdStr = request.getParameter("id");
        if (goalIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing goal ID.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            int goalId = Integer.parseInt(goalIdStr);
            GoalDAO goalDAO = new GoalDAO(conn);
            boolean success = goalDAO.deleteGoal(goalId, userId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Failed to delete goal. It may not belong to the user.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid goal ID.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void editGoal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = getUserIdFromSession(request, response);
        if (userId == null) return;

        String goalIdStr = request.getParameter("id");
        String newText = request.getParameter("text");

        if (goalIdStr == null || newText == null || newText.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing goal ID or text.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            int goalId = Integer.parseInt(goalIdStr);
            GoalDAO goalDAO = new GoalDAO(conn);
            boolean success = goalDAO.editGoal(goalId, newText, userId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Failed to edit goal. It may not belong to the user.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid goal ID.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
