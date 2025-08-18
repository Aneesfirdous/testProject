<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.studybuddy.model.MoodEntry" %>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Mood Tracker</title>
    <style>
        body {
            font-family: sans-serif;
            background: url('images/dailymood.jpg') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 2rem;
            color: #334e68;
        }
        .logout {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 0.9rem;
        }
        .logout a {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }
        .logout a:hover {
            text-decoration: underline;
        }
        
        .dashboard-link {
            text-align: center;
            margin-top: 20px;
        }
        .dashboard-link a {
            padding: 12px 24px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .dashboard-link a:hover {
            background-color: #27ae60;
        }
        .container {
            background: #fff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            width: 100%;
        }
        h1, h2 {
            text-align: center;
            margin-bottom: 1rem;
            color: #1a202c;
        }
        
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 2rem;
            padding: 1.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
        }
        label {
            font-weight: bold;
            color: #2d3748;
        }
        select, textarea {
            padding: 0.75rem;
            border: 1px solid #cbd5e0;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #f7fafc;
            width: 100%;
        }
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        button {
            padding: 0.75rem;
            background-color: #4c51bf;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #434190;
        }
        .message {
            text-align: center;
            color: #48bb78;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .mood-history-list {
            list-style: none;
            padding: 0;
            margin-top: 1rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        .mood-entry {
            background-color: #edf2f7;
            padding: 0.75rem;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .mood-entry span {
            font-size: 0.9rem;
        }
        .mood-entry .mood {
            font-weight: bold;
            color: #2d3748;
        }
        .mood-entry .date {
            color: #718096;
            font-size: 0.8rem;
        }
        .mood-entry .note {
            font-style: italic;
            color: #4a5568;
            max-width: 50%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<div class="logout">
        <a href="LogoutServlet">Logout</a>
    </div>
    <div class="container">
        
        <h1>How are you feeling today?</h1>

        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } %>

        <form action="MoodServlet" method="post">
            <label for="mood">Select your mood:</label>
            <select id="mood" name="mood" required>
                <option value="happy">Happy 😊</option>
                <option value="calm">Calm 😌</option>
                <option value="stressed">Stressed 😩</option>
                <option value="sad">Sad 😥</option>
                <option value="tired">Tired 😴</option>
            </select>

            <label for="note">Journal Note:</label>
            <textarea id="note" name="note" placeholder="Write a quick note about your day..."></textarea>

            <button type="submit">Log Mood</button>
        </form>

        <h2>Your Mood History</h2>
        <ul class="mood-history-list">
            <% 
            List<MoodEntry> moodEntries = (List<MoodEntry>) request.getAttribute("moodEntries");
            if (moodEntries != null && !moodEntries.isEmpty()) {
                for (MoodEntry entry : moodEntries) {
            %>
                <li class="mood-entry">
                    <span class="mood"><%= entry.getMood() %></span>
                    <span class="note"><%= entry.getNote() %></span>
                    <span class="date"><%= entry.getEntryDate() %></span>
                </li>
            <% 
                }
            } else { 
            %>
                <li class="mood-entry">
                    <span>No moods logged yet.</span>
                </li>
            <% 
            }
            %>
        </ul>
        <div class="dashboard-link">
            <a href="userdashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
