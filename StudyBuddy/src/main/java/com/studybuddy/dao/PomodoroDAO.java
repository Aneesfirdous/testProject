package com.studybuddy.dao;

import com.studybuddy.model.PomodoroSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PomodoroDAO {
    private Connection conn;

    public PomodoroDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean saveSession(PomodoroSession session) throws SQLException {
        String sql = "INSERT INTO pomodoro_sessions (user_id, mode, duration_minutes) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, session.getUserId());
            stmt.setString(2, session.getMode());
            stmt.setInt(3, session.getDurationMinutes());
            return stmt.executeUpdate() > 0;
        }
    }
}

