package com.studybuddy.auth;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studybuddy.dao.moodEntryDAO;
import com.studybuddy.model.MoodEntry;


public class MoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private moodEntryDAO moodDAO = new moodEntryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Processing GET request...");

        HttpSession session = request.getSession();
        String currentUserId = (String) session.getAttribute("currentUserId");
        if (currentUserId == null) {
            currentUserId = "user-12345"; 
            session.setAttribute("currentUserId", currentUserId);
        }
        request.setAttribute("currentUserId", currentUserId);

        List<MoodEntry> moodEntries = moodDAO.getAllMoodEntries();
        request.setAttribute("moodEntries", moodEntries);

        request.getRequestDispatcher("/Dailymood.jsp").forward(request, response);
    }

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Processing POST request...");

        String mood = request.getParameter("mood");
        String note = request.getParameter("note");

        if (mood != null && !mood.trim().isEmpty()) {
            MoodEntry newMoodEntry = new MoodEntry(mood, note, new Date(System.currentTimeMillis()));

            moodDAO.saveMood(newMoodEntry);

            request.setAttribute("message", "Your mood has been logged successfully!");
        } else {
            request.setAttribute("message", "Error: Mood cannot be empty.");
        }
        

        doGet(request, response);
    }
}
