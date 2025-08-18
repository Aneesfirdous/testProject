<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Pomodoro Timer</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
  .pomodoro-grid {
    display: grid;
    grid-template-columns: 1fr 1fr ;
    grid-template-rows: auto auto;
    gap: 30px;
    padding: 20px;
    
    
  }

  .timer-box {
    grid-column: 1 / 2;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    text-align: center;
    background-color:rgb(255, 244, 240);

  }

  .chart-box {
    grid-column: 2 / 3;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    text-align: center;
    background-color: aliceblue;
  }

  .history-box {
    grid-column: 1 / 3;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    text-align: center;
    background-color:rgb(247, 252, 224);
    
  }
  .controls button {
      background-color:#9dd0fd;
      color: white;
      border: none;
      padding: 5px 10px;
      margin: 0 10px;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      
      
    }
    .mode-toggle {
      margin-top: 15px;
    }

    .mode-toggle button {
      background-color: #9dd0fd;
      color: white;
      margin: 0 5px;
      padding: 6px 14px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      margin-top: 20px;
      
    }
    p{
    font-size:30px;
    }

  .back-button {
    margin-top: 20px;
    display: inline-block;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 5px;
  }
</style>

<div class="pomodoro-grid">

  <!-- Timer Box -->
  <div class="timer-box">
    <h1>🍅 Pomodoro Timer</h1>
    <p>Boost your productivity with 25-minute focus sessions followed by 5-minute breaks.</p>
    <div class="timer" id="timer" style="font-size: 40px; margin-bottom: 15px;">25:00</div>

    <div class="controls">
      <button onclick="startTimer()">▶️ Start</button>
      <button onclick="pauseTimer()">⏸️ Pause</button>
      <button onclick="resetTimer()">🔁 Reset</button>
    </div>

    <div class="mode-toggle" style="margin-top: 10px;">
      <button onclick="setMode('focus')">Focus</button>
      <button onclick="setMode('break')">Break</button>
    </div>

    <div id="message"></div>
  </div>

  <!-- Chart Box -->
  <div class="chart-box">
    <h2>📊 Session Chart</h2>
    <canvas id="pomodoroChart" width="300" height="200"></canvas>
  </div>

  <!-- History Box -->
  <div class="history-box">
    <h2>📜 Pomodoro History</h2>
    <table border="1" cellpadding="10" style="width: 100%; border-collapse: collapse; text-align: center;">
      <tr style="background-color: #f2f2f2;">
        <th>Date</th>
        <th>Mode</th>
        <th>Duration (min)</th>
        <th>Status</th>
      </tr>
      <tr>
        <td>2025-08-06</td>
        <td>Focus</td>
        <td>25</td>
        <td>✅ Completed</td>
      </tr>
      <tr>
        <td>2025-08-06</td>
        <td>Break</td>
        <td>5</td>
        <td>✅ Completed</td>
      </tr>
    </table>

    <a href="userdashboard.jsp" class="back-button">⬅️ Back to Dashboard</a>
  </div>
</div>

<script>
  window.onload = function () {
    let timer;
    let isRunning = false;
    let mode = "focus"; // or "break"
    let timeLeft = 25 * 60;

    const timerDisplay = document.getElementById("timer");
    const message = document.getElementById("message");

    function updateDisplay() {
      const minutes = Math.floor(timeLeft / 60).toString().padStart(2, '0');
      const seconds = (timeLeft % 60).toString().padStart(2, '0');
      timerDisplay.textContent = minutes + ":" + seconds;
    }

   window.startTimer = function () {
    	  if (!isRunning) {
    	    isRunning = true;
    	    timer = setInterval(() => {
    	      if (timeLeft > 0) {
    	        timeLeft--;
    	        updateDisplay();
    	      } else {
    	        clearInterval(timer);
    	        isRunning = false;
    	        
    	        // ✅ Save session to DB
    	        const duration = mode === "focus" ? 25 : 5;
    	        savePomodoroSession(mode, duration);

    	        // Show a message to the user
    	        alert(mode === "focus"
    	          ? "Focus session completed! Take a break."
    	          : "Break over! Ready to focus again?");
    	      }
    	    }, 1000);
    	  }
    	};

    window.pauseTimer = function () {
      clearInterval(timer);
      isRunning = false;
    };

    window.resetTimer = function () {
      clearInterval(timer);
      isRunning = false;
      timeLeft = mode === "focus" ? 25 * 60 : 5 * 60;
      updateDisplay();
      message.textContent = "";
    };

    window.setMode = function (newMode) {
      clearInterval(timer);
      isRunning = false;
      mode = newMode;
      timeLeft = mode === "focus" ? 25 * 60 : 5 * 60;
      updateDisplay();
      message.textContent = mode === "focus"
        ? "💪 Let's focus!"
        : "☕ Time to take a break!";
    };

    updateDisplay(); // Initial display

    function PomodoroServlet(mode, duration) {
    	  fetch("PomodoroServlet", {
    	    method: "POST",
    	    headers: {
    	      "Content-Type": "application/x-www-form-urlencoded"
    	    },
    	    body: `mode=${mode}&duration=${duration}`
    	  })
    	  .then(response => response.text())
    	  .then(data => {
    	    console.log("Server response:", data);
    	    // You can show success alert if needed
    	    // alert("Session saved successfully!");
    	  })
    	  .catch(error => {
    	    console.error("Error saving session:", error);
    	  });
    	}
    updateDisplay();
  };
</script>

<script>
  const ctx = document.getElementById('pomodoroChart').getContext('2d');
  const pomodoroChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Aug 4', 'Aug 5', 'Aug 6'],
      datasets: [{
        label: 'Focus Sessions',
        data: [3, 4, 2],
        backgroundColor: 'rgba(75, 192, 192, 0.7)'
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
          stepSize: 1
        }
      }
    }
  });
</script>


	</body>
	</html>