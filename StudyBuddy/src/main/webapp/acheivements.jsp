<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Buddy Achievements</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
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
        .achievement-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .card {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-left: 5px solid #2ecc71; /* Achievement-themed color */
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            margin-top: 0;
            color: #333;
            font-size: 1.2rem;
        }
        .card p {
            margin: 8px 0 0;
            color: #666;
            font-size: 0.9rem;
        }
        .back-btn {
            text-align: center;
            margin-top: 30px;
        }
        .back-btn a {
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .back-btn a:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>
<%= session.getAttribute("userId") %>

    <%
        // Check if the user is logged in
	String fullName = (String) session.getAttribute("fullName");
        if (fullName == null) {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <div class="logout">
        <a href="LogoutServlet">Logout</a>
    </div>
    <div class="container">
        <h1>Your Achievements 🎖️</h1>
        <c:choose>
            <c:when test="${not empty achievementList}">
                <div class="achievement-grid">
                    <c:forEach var="achievement" items="${achievementList}">
                        <div class="card">
                            <h3><c:out value="${achievement.title}"/></h3>
                            <p><c:out value="${achievement.description}"/></p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; margin-top: 20px;">
                    <p>No achievements yet. Keep up the good work and complete your goals!</p>
                </div>
            </c:otherwise>
        </c:choose>
        
        <div class="back-btn">
            <a href="userdashboard.jsp">Return to Dashboard</a>
        </div>
    </div>
</body>
</html>
