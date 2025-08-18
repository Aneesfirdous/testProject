package com.studybuddy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.studybuddy.auth.DBUtil;
import com.studybuddy.model.Challenge;

public class ChallengeDAO {

    public void addChallenge(Challenge challenge) {
        String sql = "INSERT INTO daily_challenges (title, description, is_completed) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, challenge.getTitle());
            stmt.setString(2, challenge.getDescription());
            stmt.setBoolean(3, challenge.isCompleted());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error adding challenge: " + e.getMessage());
        }
    }

    
    public List<Challenge> getAllChallenges() {
        List<Challenge> challenges = new ArrayList<>();
        String sql = "SELECT id, title, description, is_completed, created_at FROM daily_challenges ORDER BY created_at ASC";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Challenge challenge = new Challenge();
                challenge.setId(rs.getInt("id"));
                challenge.setTitle(rs.getString("title"));
                challenge.setDescription(rs.getString("description"));
                challenge.setCompleted(rs.getBoolean("is_completed"));
                challenge.setCreatedAt(rs.getTimestamp("created_at"));
                challenges.add(challenge);
            }
        } catch (SQLException e) {
            System.err.println("Error getting all challenges: " + e.getMessage());
        }
        return challenges;
    }

    public void updateChallenge(Challenge challenge) {
        String sql = "UPDATE daily_challenges SET is_completed = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setBoolean(1, challenge.isCompleted());
            stmt.setInt(2, challenge.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error updating challenge: " + e.getMessage());
        }
    }
}

