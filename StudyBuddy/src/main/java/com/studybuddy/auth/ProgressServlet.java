package com.studybuddy.auth;

import com.studybuddy.dao.ProgressDAO;
import com.studybuddy.model.Progress;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProgressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String taskName = request.getParameter("taskName");
        int duration = Integer.parseInt(request.getParameter("duration"));

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        try {
            
            ProgressDAO.addProgress(userId, taskName, duration);

            
            List<Progress> progressList = ProgressDAO.getProgressByUser(userId);
            request.setAttribute("progressList", progressList);
            request.getRequestDispatcher("progress.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        try {
            List<Progress> progressList = ProgressDAO.getProgressByUser(userId);
            request.setAttribute("progressList", progressList);
            request.getRequestDispatcher("progress.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

