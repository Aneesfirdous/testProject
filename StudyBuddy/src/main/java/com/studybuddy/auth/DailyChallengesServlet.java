package com.studybuddy.auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DailyChallengesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private class Challenge {
        public int id;
        public String title;
        public String description;
        public boolean completed;
        public String createdAt;

        public Challenge(int id, String title, String description, boolean completed, String createdAt) {
            this.id = id;
            this.title = title;
            this.description = description;
            this.completed = completed;
            this.createdAt = createdAt;
        }
    }

    private class ChallengeHistoryEntry {
        public String title;
        public boolean completed;
        public String createdAt;

        public ChallengeHistoryEntry(String title, boolean completed, String createdAt) {
            this.title = title;
            this.completed = completed;
            this.createdAt = createdAt;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int currentStreak = 5;
        Challenge dailyChallenge = new Challenge(101, "Review 3 Chapters", "Spend at least 30 minutes reviewing chapters you've already studied to reinforce your knowledge.", false, "2025-08-08");

        List<ChallengeHistoryEntry> challengeHistory = new ArrayList<>();
        challengeHistory.add(new ChallengeHistoryEntry("Complete 20 Flashcards", true, "2025-08-07"));
        challengeHistory.add(new ChallengeHistoryEntry("Write a Summary", false, "2025-08-06"));
        challengeHistory.add(new ChallengeHistoryEntry("Solve 5 Practice Problems", true, "2025-08-05"));
        
        Boolean isCompleted = (Boolean) session.getAttribute("isDailyChallengeCompleted");
        boolean todayChallengeCompleted = (isCompleted != null && isCompleted);
        
        if (todayChallengeCompleted) {
            dailyChallenge.completed = true;
        } else {
            dailyChallenge.completed = false;
        }

        request.setAttribute("currentStreak", currentStreak);
        request.setAttribute("dailyChallenge", dailyChallenge);
        request.setAttribute("challengeHistory", challengeHistory);

        request.getRequestDispatcher("/dailychallenges.jsp").forward(request, response);
    }
}

