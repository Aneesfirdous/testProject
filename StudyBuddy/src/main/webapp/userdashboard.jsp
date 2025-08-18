<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Study Buddy | Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<style>
  body {
  margin: 0;
  font-family: 'Segoe UI', sans-serif;
  background-color: #eeeefd;
  color: #333;
}

.dashboard-header {
  background-color: #1e88e5;
  color: #fff;
  padding: 20px 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.dashboard-nav a {
  margin-left: 20px;
  text-decoration: none;
  color: #fff;
  font-weight: 500;
}

.dashboard-nav a:hover {
  text-decoration: underline;
}

.welcome-box {
  text-align: center;
  padding: 40px 20px;
  background: #fff;
  margin: 20px auto;
  max-width: 900px;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  color:black;
}

.dashboard-cards {
      display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    padding: 20px;
}

.card {
  background: #ffffff;
  padding: 25px;
  border-radius: 12px;
  text-align: center;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 14px rgba(0,0,0,0.2);
}

.card i {
  font-size: 2rem;
  color: #6c63ff;
  margin-bottom: 10px;
}

.card h3 {
  margin: 10px 0;
}

.card a {
  color: #6c63ff;
  font-weight: bold;
  text-decoration: none;
}
</style>

</head>
<body>

  <header class="dashboard-header">
    <h1>📚 Study Buddy</h1>
    <nav class="dashboard-nav">
      <a href="userdashboard.jsp">Dashboard</a>
      <a href="goaltracker.jsp">My Goals</a>
      <a href="pomodoro.jsp">Timer</a>
      <a href="Profile.jsp">Profile</a>
      <a href="LogoutServlet">Logout</a> 
    </nav>
  </header>
  
<%
Integer userId = (Integer) session.getAttribute("userId");
	String fullName = (String) session.getAttribute("fullName");

	if (userId == null) {
	    response.sendRedirect("home.jsp?error=sessionExpired");
	    return;
	}
	%>




  <section class="welcome-box">
	<h2>Welcome, <%= fullName %>!</h2>
    <p>Ready to conquer your study goals today?</p>
  </section>

  <section class="dashboard-cards">
    <div class="card">
      <i class="fas fa-bullseye"></i>
      <h3>Set Goals</h3>
      <p>Create and manage your study targets.</p>
      <a href="goaltracker.jsp">Start Now →</a>
    </div>
    <div class="card">
      <i class="fas fa-stopwatch"></i>
      <h3>Pomodoro Timer</h3>
      <p>Focus using the 25-minute rule.</p>
      <a href="pomodoro.jsp">Start Timer →</a>
    </div>
    <div class="card">
      <i class="fas fa-chart-line"></i>
      <h3>Progress Tracker</h3>
      <p>Visualize your study stats.</p>
      <a href="progress.jsp">View Report →</a>
    </div>
    <div class="card">
      <i class="fas fa-brain"></i>
      <h3>AI Study Coach</h3>
      <p>Get smart recommendations.</p>
      <a href="aicoach.jsp">Ask Coach →</a>
    </div>
    <div class="card">
      <i class="fas fa-bolt"></i>
      <h3>Focus Mode</h3>
      <p>Minimize distractions during study.</p>
      <a href="focusmode.jsp">Start Focus Mode →</a>
    </div>
    <div class="card">
      <i class="fas fa-trophy"></i>
      <h3>Achievements</h3>
      <p>Track your earned badges.</p>
      <a href="acheivements.jsp">View Trophies →</a>
    </div>
    <div class="card">
      <i class="fas fa-memory"></i>
      <h3>Memory Booster Tools</h3>
      <p>Sharpen your recall with quick challenges.</p>
      <a href="memorybooster.jsp">Try Memory Boosters →</a>
    </div>
    <div class="card">
      <i class="fas fa-coffee"></i>
      <h3>Daily Mood Tracker</h3>
      <p>"How are you feeling today?"</p>
      <a href="Dailymood.jsp">Log Mood →</a>
    </div>
    
    
    <div class="card">
      <i class="fas fa-thumbs-up"></i>
      <h3>Daily Challenges and Streaks</h3>
      <p>Build habits and keep the momentum going.</p>
      <a href="dailychallenges.jsp">Start Today’s Challenge →</a>
    </div>
    
  </section>

</body>
</html>
