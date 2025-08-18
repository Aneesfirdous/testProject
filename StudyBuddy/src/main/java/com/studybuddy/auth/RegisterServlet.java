package com.studybuddy.auth;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.studybuddy.dao.UserDAO;
import com.studybuddy.model.User;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User(fullname, email, password);
        try (Connection conn = DBUtil.getConnection()) {
            UserDAO dao = new UserDAO(conn);
            if (dao.registerUser(user)) {
            	req.getSession().setAttribute("user", user.getFullname());
            	req.getSession().setAttribute("justRegistered", true); 
            	resp.sendRedirect("userdashboard.jsp");
            	} else {
                resp.sendRedirect("home.jsp?error=fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("home.jsp?error=exception");
        }
    }
}

