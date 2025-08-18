package com.studybuddy.auth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/myproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "AliyaZ@240793";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver.", e);
        }
    }
    public static Connection getConnection() {
        Connection conn = null;
        try {
            System.out.println("Attempting to connect to the database...");
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connection successful!");
        } catch (SQLException e) {
            System.err.println("SQLException: Failed to connect to the database.");
            e.printStackTrace();
            conn = null;
        }
        return conn;
    }

    public static int getUserIdByUsername(Connection conn, String username) throws SQLException {
        String sql = "SELECT id FROM users WHERE fullname = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        }
        return -1;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Connection closed successfully.");
            } catch (SQLException se) {
                System.err.println("Failed to close connection.");
                se.printStackTrace();
            }
        }
    }
}
