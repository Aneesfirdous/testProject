package com.studybuddy.dao;

import com.studybuddy.model.CoachInteraction;
import com.studybuddy.auth.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CoachInteractionDAO {
    public static void saveInteraction(int userId, String userMsg, String aiReply) throws Exception {
        String sql = "INSERT INTO coach_interactions (user_id, user_message, ai_reply) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setString(2, userMsg);
            stmt.setString(3, aiReply);
            stmt.executeUpdate();
        }
        
    }

    public static List<CoachInteraction> getInteractionsByUser(int userId) throws Exception {
        List<CoachInteraction> list = new ArrayList<>();
        String sql = "SELECT * FROM coach_interactions WHERE user_id = ? ORDER BY timestamp DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CoachInteraction ci = new CoachInteraction();
                ci.setId(rs.getInt("id"));
                ci.setUserId(rs.getInt("user_id"));
                ci.setUserMessage(rs.getString("user_message"));
                ci.setAiReply(rs.getString("ai_reply"));
                ci.setTimestamp(rs.getTimestamp("timestamp"));
                list.add(ci);
            }
        }

        return list;
    }
    public static void deleteInteractionsByUser(int userId) throws Exception {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM coach_interactions WHERE user_id = ?")) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }
    }

}

