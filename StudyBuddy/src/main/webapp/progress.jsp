<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Progress Tracker - Study Buddy</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 40px;
            background: #f4f8fb;
        }
        .progress-form, .progress-table {
            background: white;
            padding: 30px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center mb-4">📈 Track Your Study Progress</h2>

        <!-- Progress Input Form -->
        <div class="progress-form">
            <h4>Add New Study Session</h4>
            <form action="ProgressServlet" method="post">
                <div class="form-group">
                    <label>Task Name</label>
                    <input type="text" name="taskName" class="form-control" placeholder="e.g. Math Revision" required>
                </div>
                <div class="form-group">
                    <label>Duration (minutes)</label>
                    <input type="number" name="duration" class="form-control" placeholder="e.g. 45" required>
                </div>
                <button type="submit" class="btn btn-submit">Add Progress</button>
            </form>
        </div>

        <!-- Progress Table -->
        <div class="progress-table">
            <h4>My Study Sessions</h4>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Task</th>
                        <th>Time Spent (min)</th>
                    </tr>
                </thead>
                <tbody>
					<%
					    List<com.studybuddy.model.Progress> progressList = (List<com.studybuddy.model.Progress>) request.getAttribute("progressList");
					    if (progressList != null && !progressList.isEmpty()) {
					        for (com.studybuddy.model.Progress record : progressList) {
					%>
					    <tr>
					        <td><%= record.getDate() %></td>
					        <td><%= record.getTaskName() %></td>
					        <td><%= record.getDurationMinutes() %></td>
					    </tr>
					<%
					        }
					    } else {
					%>
					    <tr><td colspan="3" class="text-center">No progress yet.</td></tr>
					<%
					    }
					%>
					</tbody>
            </table>
        </div>
    </div>
    <div style="text-align: center; margin-top: 30px;">
<a href="userdashboard.jsp">
    <button style="background-color: #4CAF50; color: white; border: none; padding: 10px 20px; border-radius: 6px; font-size: 16px; cursor: pointer;">
      ⬅️ Back to Dashboard
    </button>
  </a>
</div>

</body>
</html>

