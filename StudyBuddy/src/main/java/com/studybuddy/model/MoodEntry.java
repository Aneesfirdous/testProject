package com.studybuddy.model;

import java.sql.Date;

public class MoodEntry {
    private String mood;
    private String note;
    private Date entryDate;

    public MoodEntry(String mood, String note, Date entryDate) {
        this.mood = mood;
        this.note = note;
        this.entryDate = entryDate;
    }

    public String getMood() {
        return mood;
    }

    public String getNote() {
        return note;
    }

    public Date getEntryDate() {
        return entryDate;
    }
}

