package com.studybuddy.dao;


import com.studybuddy.model.Progress;
import com.studybuddy.auth.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProgressDAO {

    public static void addProgress(int userId, String taskName, int durationMinutes) throws SQLException {
        String sql = "INSERT INTO study_progress (user_id, task_name, duration_minutes) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setString(2, taskName);
            stmt.setInt(3, durationMinutes);
            stmt.executeUpdate();
        }
    }

    public static List<Progress> getProgressByUser(int userId) throws SQLException {
        List<Progress> progressList = new ArrayList<>();
        String sql = "SELECT created_at, task_name, duration_minutes FROM study_progress WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Progress progress = new Progress();
                progress.setDate(rs.getTimestamp("created_at"));
                progress.setTaskName(rs.getString("task_name"));
                progress.setDurationMinutes(rs.getInt("duration_minutes"));
                progressList.add(progress);
            }
        }

        return progressList;
    }
}

