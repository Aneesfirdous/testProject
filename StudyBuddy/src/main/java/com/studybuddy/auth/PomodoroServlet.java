package com.studybuddy.auth;

import com.studybuddy.dao.PomodoroDAO;
import com.studybuddy.model.PomodoroSession;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class PomodoroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int duration = Integer.parseInt(request.getParameter("duration")); 
        String mode = request.getParameter("mode"); 
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.getWriter().write("User not logged in.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            PomodoroSession pomodoroSession = new PomodoroSession();
            pomodoroSession.setUserId(userId);
            pomodoroSession.setMode(mode);
            pomodoroSession.setDurationMinutes(duration);

            PomodoroDAO dao = new PomodoroDAO(conn);
            boolean success = dao.saveSession(pomodoroSession);

            if (success) {
                response.getWriter().write("Session saved");
            } else {
                response.getWriter().write("Failed to save session");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error saving session");
        }
    }
}
