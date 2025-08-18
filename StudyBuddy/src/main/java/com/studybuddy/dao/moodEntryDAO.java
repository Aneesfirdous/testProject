package com.studybuddy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.studybuddy.auth.DBUtil;
import com.studybuddy.model.MoodEntry;

public class moodEntryDAO {

    public void saveMood(MoodEntry moodEntry) {
     
        String sql = "INSERT INTO mood_entries (mood, note, entry_date) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, moodEntry.getMood());
            pstmt.setString(2, moodEntry.getNote());
            pstmt.setDate(3, moodEntry.getEntryDate());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Saved new mood entry to the database.");
            } else {
                System.err.println("Failed to save mood entry. No rows were affected.");
            }
        } catch (SQLException e) {
            System.err.println("SQLException: Error saving mood entry to the database.");
            e.printStackTrace();
        }
    }


    public List<MoodEntry> getAllMoodEntries() {
        List<MoodEntry> moodEntries = new ArrayList<>();
        String sql = "SELECT mood, note, entry_date FROM mood_entries ORDER BY entry_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String mood = rs.getString("mood");
                String note = rs.getString("note");
                Date date = rs.getDate("entry_date");
                moodEntries.add(new MoodEntry(mood, note, date));
            }
        } catch (SQLException e) {
            System.err.println("SQLException: Error retrieving mood entries from the database.");
            e.printStackTrace();
        }
        return moodEntries;
    }
}
