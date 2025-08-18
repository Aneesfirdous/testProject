package com.studybuddy.auth;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class CompleteChallengeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        
        try {
            String challengeIdStr = request.getParameter("challengeId");
            int challengeId = Integer.parseInt(challengeIdStr);

            
            System.out.println("User completed challenge with ID: " + challengeId);
            session.setAttribute("isDailyChallengeCompleted", true);

            response.sendRedirect(request.getContextPath() + "/dailychallenges");
        } catch (NumberFormatException e) {
            System.err.println("Invalid challengeId received: " + request.getParameter("challengeId"));
            response.sendRedirect(request.getContextPath() + "/dailychallenges?error=invalid_challenge_id");
        }
    }
}

