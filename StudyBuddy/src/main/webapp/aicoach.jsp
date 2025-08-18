<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>AI Study Coach</title>
    <style>
        body { 
        
		  background-image: url("images/ai_bg.jpg"); /* relative path */
		  background-size: cover;
		  background-position: center;
		  background-repeat: no-repeat;
		  background-attachment: fixed; /* keeps background fixed on scroll */
		  font-family: Arial, sans-serif;
		}
        .container { 
        max-width: 600px; 
        margin: auto; 
        background: white; 
        padding: 20px; 
        border-radius: 10px; 
        }
        .chat-box { 
        border: 1px solid #ccc; 
        height: 300px; 
        overflow-y: auto; 
        padding: 10px; 
        margin-bottom: 15px; 
        background: #fafafa; 
        }
        .chat-entry { 
        margin: 10px 0; 
        }
        .user { 
        text-align: right; 
        font-weight: bold; 
        }
        .coach { 
        text-align: left; 
        color: green; 
        }
        input[type=text] { 
        width: 80%; 
        padding: 8px; 
        }
        button { 
        padding: 8px 16px; 
        }
        
        .chat-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  width: 100%;
}

.chat-buttons form {
  flex: 1;
}

.reset-button, .dashboard-button {
  width: 90%;
  padding: 10px 20px;
  font-size: 14px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.reset-button {
  background-color: #ff4d4f;
  color: white;
  margin-right: 10px;
}

.reset-button:hover {
  background-color: #d9363e;
}

.dashboard-button {
  background-color: #4CAF50;
  color: white;
  margin-left: 10px;
}

.dashboard-button:hover {
  background-color: #388e3c;
}
</style>
        
</head>
<body>
<div class="container">
    <h2>🤖 AI Study Coach</h2>

    <div class="chat-box" id="chatBox">
        <c:forEach var="entry" items="${chatHistory}">
        <div class="chat-entry user">You: ${entry.userMessage}</div>
        <div class="chat-entry coach">Coach: ${entry.aiReply}</div>
    </c:forEach>
    </div>

    <form method="post" action="AIStudyCoachServlet">
        <input type="text" name="message" placeholder="Ask your coach..." required />
        <button type="submit">Ask</button>
    </form>
    
    <div class="chat-buttons">
  <form method="post" action="AIStudyCoachServlet">
    <input type="hidden" name="action" value="reset" />
    <button type="submit" class="reset-button">🗑️ Reset Conversation</button>
  </form>

  <form method="get" action="userdashboard.jsp">
    <button type="submit" class="dashboard-button">🏠 Back to Dashboard</button>
  </form>
</div>

    
</div>
</body>
</html>
