package com.studybuddy.dao;

import com.studybuddy.model.Achievement;

import java.sql.*;
import java.util.*;

public class AchievementDAO {
    private Connection conn;

    public AchievementDAO(Connection conn) {
        this.conn = conn;
    }

    public void addAchievement(int userId, String title, String description) throws SQLException {
        String sql = "INSERT INTO achievements (userId, title, description, createdAt) VALUES (?, ?, ?, NOW())";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.executeUpdate();
            System.out.println("DEBUG: Achievement inserted for user " + userId + " = " + title);
        }
    }

    public boolean hasAchievement(int userId, String title) throws SQLException {
        String sql = "SELECT COUNT(*) FROM achievements WHERE user_id = ? AND title = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, title);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    public List<Achievement> getAchievementsByUserId(int userId) throws SQLException {
        List<Achievement> achievements = new ArrayList<>();
        String sql = "SELECT * FROM achievements WHERE user_id = ? ";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Achievement achievement = new Achievement();
                    achievement.setId(rs.getInt("id"));
                    achievement.setUserId(rs.getInt("user_id"));
                    achievement.setTitle(rs.getString("title"));
                    achievement.setDescription(rs.getString("description"));
                    achievement.setDateEarned(rs.getTimestamp("date_earned"));
                    achievements.add(achievement);
                }
            }
        }
        return achievements;
    }

    public void checkAndAssignGoalAchievement(int userId) throws SQLException {
        GoalDAO goalDAO = new GoalDAO(conn);
        int completedGoals = goalDAO.countCompletedGoals(userId);
        System.out.println("DEBUG: Completed goals for user " + userId + " = " + completedGoals);


        if (completedGoals == 1) {
            addAchievement(userId, "Completed First Goal", "You completed your first goal!");
        } else if (completedGoals == 3) {
            addAchievement(userId, "Completed 3 Goals", "Awesome! You completed 3 goals!");
        } else if (completedGoals == 5) {
            addAchievement(userId, "Goal Master", "Fantastic! You completed 5 goals!");
        }
    }
}
