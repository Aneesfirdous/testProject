package com.studybuddy.dao;

import com.studybuddy.model.Flashcard;
import com.studybuddy.auth.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlashcardDAO {

    public List<Flashcard> getAllFlashcards() throws SQLException {
        List<Flashcard> flashcards = new ArrayList<>();
        String sql = "SELECT * FROM flashcards";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String term = rs.getString("term");
                String definition = rs.getString("definition");
                flashcards.add(new Flashcard(id, term, definition));
            }
        }
        return flashcards;
    }
    

    public void addFlashcard(Flashcard card) throws SQLException {
        String sql = "INSERT INTO flashcards (term, definition) VALUES (?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, card.getTerm());
            pstmt.setString(2, card.getDefinition());
            pstmt.executeUpdate();
        }
    }


    public void updateFlashcard(Flashcard card) throws SQLException {
        String sql = "UPDATE flashcards SET term = ?, definition = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, card.getTerm());
            pstmt.setString(2, card.getDefinition());
            pstmt.setInt(3, card.getId());
            pstmt.executeUpdate();
        }
    }


    public void deleteFlashcard(int id) throws SQLException {
        String sql = "DELETE FROM flashcards WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}
