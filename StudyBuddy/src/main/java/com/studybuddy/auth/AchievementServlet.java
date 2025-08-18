package com.studybuddy.auth;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.studybuddy.dao.AchievementDAO;
import com.studybuddy.model.Achievement;
import com.studybuddy.auth.DBUtil;

public class AchievementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            System.out.println("DEBUG: No session or userId — redirecting to login.");
            resp.sendRedirect("home.jsp?error=notloggedin");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId"); // ✅ Correct type
        System.out.println("DEBUG: Fetching achievements for userId=" + userId);

        try (Connection conn = DBUtil.getConnection()) {
            AchievementDAO dao = new AchievementDAO(conn);
            dao.checkAndAssignGoalAchievement(userId);
            List<Achievement> achievements = dao.getAchievementsByUserId(userId);

            req.setAttribute("achievementList", achievements);

            req.getRequestDispatcher("achievements.jsp").forward(req, resp);

        } catch (Exception e) {
            System.out.println("DEBUG: Error fetching achievements");
            e.printStackTrace();
            resp.sendRedirect("userdashboard.jsp?error=achievements");
        }
    }
}
