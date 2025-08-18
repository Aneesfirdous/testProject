package com.studybuddy.model;

import java.sql.Timestamp;

public class Goal {
    private int id;
    private int userId;
    private String text; 
    private boolean completed;
    private Timestamp createdAt;

    public Goal() {}


    public Goal(int userId, String text) {
        this.userId = userId;
        this.text = text;
        this.completed = false; 
    }


    public Goal(int id, int userId, String text, boolean completed, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.text = text;
        this.completed = completed;
        this.createdAt = createdAt;
    }


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getText() { return text; } 
    public void setText(String text) { this.text = text; } 

    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
