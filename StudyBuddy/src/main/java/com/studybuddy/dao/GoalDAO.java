package com.studybuddy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.studybuddy.model.Goal;

public class GoalDAO {
    private Connection conn;

    public GoalDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Goal> getGoalsByUserId(int userId) throws SQLException {
        List<Goal> goals = new ArrayList<>();
        String sql = "SELECT id, user_id, text, completed, created_at FROM goals WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Goal goal = new Goal(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("text"),
                        rs.getBoolean("completed"),
                        rs.getTimestamp("created_at")
                    );
                    goals.add(goal);
                }
            }
        }
        return goals;
    }

    public boolean addGoal(Goal goal) throws SQLException {
        String sql = "INSERT INTO goals (user_id, text) VALUES (?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, goal.getUserId());
            stmt.setString(2, goal.getText());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean toggleGoal(int goalId, boolean completed, int userId) throws SQLException {
        String sql = "UPDATE goals SET completed = ? WHERE id = ? AND user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setBoolean(1, completed);
            stmt.setInt(2, goalId);
            stmt.setInt(3, userId);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteGoal(int goalId, int userId) throws SQLException {
        String sql = "DELETE FROM goals WHERE id = ? AND user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, goalId);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean editGoal(int goalId, String newText, int userId) throws SQLException {
        String sql = "UPDATE goals SET text = ? WHERE id = ? AND user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newText);
            stmt.setInt(2, goalId);
            stmt.setInt(3, userId);
            return stmt.executeUpdate() > 0;
        }
    }
    public int countCompletedGoals(int userId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM goals WHERE userId=? AND completed=1";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

}
