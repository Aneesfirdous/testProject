package com.studybuddy.dao;

import java.sql.*;

import com.studybuddy.model.User;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    
    public boolean registerUser(User user) throws SQLException {
        
        String query = "INSERT INTO users (fullname, email, password, username, profileImage) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getUsername());
            ps.setString(5, user.getProfileImage()); 
            return ps.executeUpdate() > 0;
        }
    }

    
    public User validateUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        }
        return null;
    }

   
    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        }
        return null;
    }

   
    public boolean updateProfile(User user) throws SQLException {
        String sql = "UPDATE users SET fullname = ?, email = ?, username = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsername());
            ps.setInt(4, user.getId());
            return ps.executeUpdate() > 0;
        }
    }

    
    public boolean updateProfileImage(int userId, String profileImage) throws SQLException {
        String sql = "UPDATE users SET profileImage = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, profileImage);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        }
    }

   
    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFullname(rs.getString("fullname"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setUsername(rs.getString("username"));
        user.setProfileImage(rs.getString("profileImage")); 
        return user;
    }
}




