package com.studybuddy.auth;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.studybuddy.dao.UserDAO;
import com.studybuddy.model.User;
import com.studybuddy.auth.DBUtil; // ✅ Make sure you have this import

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       
        String email = req.getParameter("email") != null ? req.getParameter("email").trim() : "";
        String password = req.getParameter("password") != null ? req.getParameter("password").trim() : "";

        
        if (email.isEmpty() || password.isEmpty()) {
            System.out.println("DEBUG: Email or password is empty.");
            resp.sendRedirect("home.jsp?error=empty");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            System.out.println("DEBUG: DB Connection established in LoginServlet.");

            UserDAO dao = new UserDAO(conn);
            User user = dao.validateUser(email, password);

            if (user != null && user.getId() > 0) {
                HttpSession session = req.getSession();
                session.setAttribute("fullName", user.getFullname()); 
                session.setAttribute("userId", user.getId());     

                System.out.println("DEBUG: Login success for userId=" + user.getId() +
                                   ", fullName=" + user.getFullname());

                resp.sendRedirect("userdashboard.jsp");
            } else {
                System.out.println("DEBUG: Invalid credentials for email=" + email);
                resp.sendRedirect("home.jsp?error=invalid");
            }
        } catch (Exception e) {
            System.out.println("DEBUG: Exception during login");
            e.printStackTrace();
            resp.sendRedirect("home.jsp?error=exception");
        }
    }
}

