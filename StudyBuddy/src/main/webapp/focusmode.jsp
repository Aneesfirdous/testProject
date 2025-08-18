<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page session="true" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Focus Mode</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            color: white;
        }

        .focus-container {
            width: 90%;
            max-width: 600px;
            margin: 80px auto;
            padding: 30px;
            background-color: rgba(44, 41, 41, 0.7);
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 0 10px rgba(255,255,255,0.2);
        }

        select, button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
        }

        #timerDisplay {
            font-size: 48px;
            margin: 20px 0;
        }

        #quote {
            margin: 20px 0;
            font-style: italic;
        }

        .buttons {
            margin-top: 20px;
        }

        .buttons button {
            margin: 10px 10px;
        }
        .dashboard-btn {
		  position: absolute;
		  top: 20px;
		  right: 30px;
		  background-color: #008CBA;
		  color: white;
		  padding: 10px 15px;
		  text-decoration: none;
		  border-radius: 8px;
		  font-weight: bold;
		  transition: background-color 0.3s;
		}
		.dashboard-btn:hover {
		  background-color: #005f73;
		}
        .toggle-container {
  position: absolute;
  top: 20px;
  left: 30px;
  display: flex;
  align-items: center;
  gap: 10px;
  color: #333;
  font-weight: bold;
}

.switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 24px;
}

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0; left: 0;
  right: 0; bottom: 0;
  background-color: #ccc;
  transition: 0.4s;
  border-radius: 24px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 18px;
  width: 18px;
  left: 4px;
  bottom: 3px;
  background-color: white;
  transition: 0.4s;
  border-radius: 50%;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:checked + .slider:before {
  transform: translateX(26px);
}

/* Dark Mode Styling */
body.dark-mode {
  background-color: #121212;
  color: #f5f5f5;
}

body.dark-mode .dashboard-btn {
  background-color: #444;
  color: white;
}
        

        
    </style>
</head>
<body>

<div class="focus-container">
    <h2>Distraction-Free Focus Mode</h2>

    <!-- 1. Focus Duration Selector -->
    <label for="duration">Select Focus Duration:</label>
    <select id="duration">
        <option value="15">15 minutes</option>
        <option value="25">25 minutes</option>
        <option value="45">45 minutes</option>
        <option value="60">60 minutes</option>
    </select>

    <!-- 2. Live Timer -->
    <div id="timerDisplay">00:00</div>

    <!-- 3. Play/Pause Buttons -->
    <div class="buttons">
        <button onclick="startTimer()">Start</button>
        <button onclick="pauseTimer()">Pause</button>
        <button onclick="resetTimer()">Reset</button>
        <button onclick="toggleFullscreen()">Fullscreen</button>
    </div>

    <!-- 4. Motivational Quotes -->
    <div id="quote">"Stay focused and never give up!"</div>

    
</div>
<a href="userdashboard.jsp" class="dashboard-btn">Return to Dashboard</a>
<div class="toggle-container">
  <label class="switch">
    <input type="checkbox" id="modeToggle" onchange="toggleMode()">
    <span class="slider round"></span>
  </label>
  <span id="modeLabel">Light Mode</span>
</div>

<script>
    let timer;
    let totalSeconds = 0;
    let remainingSeconds = 0;
    let isRunning = false;

    const timerDisplay = document.getElementById("timerDisplay");

    function startTimer() {
        if (!isRunning) {
            const selectedMinutes = parseInt(document.getElementById("duration").value);
            if (remainingSeconds === 0) {
                totalSeconds = selectedMinutes * 60;
                remainingSeconds = totalSeconds;
            }

            timer = setInterval(() => {
                if (remainingSeconds <= 0) {
                    clearInterval(timer);
                    isRunning = false;
                    alert("Focus session complete!");
                    return;
                }

                remainingSeconds--;
                updateTimerDisplay();
            }, 1000);

            isRunning = true;
        }
    }

    function pauseTimer() {
        clearInterval(timer);
        isRunning = false;
    }

    function resetTimer() {
        clearInterval(timer);
        isRunning = false;
        remainingSeconds = 0;
        updateTimerDisplay();
    }

    function updateTimerDisplay() {
        const mins = Math.floor(remainingSeconds / 60);
        const secs = remainingSeconds % 60;
        timerDisplay.textContent = String(mins).padStart(2, '0') + ':' + String(secs).padStart(2, '0');
    }

    function toggleFullscreen() {
        if (!document.fullscreenElement) {
            document.documentElement.requestFullscreen();
        } else {
            document.exitFullscreen();
        }
    }

    // 6. Quote Rotator
    
        const quotes = [
        "Stay focused and never give up!",
        "Discipline is choosing between what you want now and what you want most.",
        "Push yourself, because no one else is going to do it for you.",
        "Don’t watch the clock; do what it does. Keep going.",
        "Success doesn’t come from what you do occasionally, it comes from what you do consistently."
    ];

    setInterval(() => {
        const quoteDiv = document.getElementById("quote");
        const randomIndex = Math.floor(Math.random() * quotes.length);
        quoteDiv.textContent = quotes[randomIndex];
    }, 10000); // change every 10 seconds
</script>
<script>
  function toggleMode() {
    const body = document.body;
    const label = document.getElementById("modeLabel");
    body.classList.toggle("dark-mode");
    label.textContent = body.classList.contains("dark-mode") ? "Dark Mode" : "Light Mode";
  }
</script>


</body>
</html>
