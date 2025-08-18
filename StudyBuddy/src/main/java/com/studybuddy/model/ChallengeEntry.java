package com.studybuddy.model;

import java.time.LocalDate;

public class ChallengeEntry {

    private LocalDate date;
    private String challengeTitle;
    private boolean isCompleted;

    public ChallengeEntry(LocalDate date, String challengeTitle, boolean isCompleted) {
        this.date = date;
        this.challengeTitle = challengeTitle;
        this.isCompleted = isCompleted;
    }


    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getChallengeTitle() {
        return challengeTitle;
    }

    public void setChallengeTitle(String challengeTitle) {
        this.challengeTitle = challengeTitle;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }
}
