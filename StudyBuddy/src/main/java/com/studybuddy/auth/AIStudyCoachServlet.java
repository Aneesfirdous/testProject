package com.studybuddy.auth;

import com.studybuddy.dao.CoachInteractionDAO;
import com.studybuddy.model.CoachInteraction;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AIStudyCoachServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("reset".equals(action)) {
            try {
                CoachInteractionDAO.deleteInteractionsByUser(userId);
                request.setAttribute("chatHistory", new ArrayList<CoachInteraction>());
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("aicoach.jsp").forward(request, response);
            return;
        }

        String userMsg = request.getParameter("message");
        String aiReply = generateReply(userMsg);

        try {
            CoachInteractionDAO.saveInteraction(userId, userMsg, aiReply);
            List<CoachInteraction> history = CoachInteractionDAO.getInteractionsByUser(userId);
            request.setAttribute("chatHistory", history);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("userMessage", userMsg);
        request.setAttribute("aiReply", aiReply);
        request.getRequestDispatcher("aicoach.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        try {
            List<CoachInteraction> history = CoachInteractionDAO.getInteractionsByUser(userId);
            request.setAttribute("chatHistory", history);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("aicoach.jsp").forward(request, response);
    }

    private String generateReply(String message) {
        message = message.toLowerCase();

        if (message.contains("focus")) {
            return "Try the Pomodoro technique: 25 min focus, 5 min break.";
        } else if (message.contains("motivation")) {
            return "Remember your goal. Small wins lead to big results.";
        } else if (message.contains("tired")) {
            return "Take a break, stretch, and hydrate!";
        } else if (message.contains("study tips")) {
            return "Use spaced repetition and active recall for better retention.";
        } else {
            return "I'm here to support you! Ask me about focus, study tips, or motivation.";
        }
    }
}
