<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.studybuddy.model.User" %>
<%@ page import="java.sql.*" %> <!-- Only if needed -->
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Virtual Study Buddy</title>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      font-family: 'Inter', sans-serif;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(to bottom, #f8faff, #e6f0ff);
      color: #333;
    }

    header {
      background: #1e88e5;
      color: white;
      padding: 20px 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
    }
    .register button{
      text-decoration: none;
      border:none;
      outline:none;
      background: #1565c0;
      padding: 10px 30px;
      margin-left: 5px;
      border-radius: 8px;
      color:white;
      font-weight: bold;
      font-size:18px;
      
    }
    .register button:hover{
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }


    .popup {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: none;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.popup-box {
  background: #fff;
  padding: 50px 50px;
  border-radius: 10px;
  width: 350px;
  height: 350px;
  position: relative;
  text-align: center;
}

.popup-box h2 {
  margin-bottom: 20px;
  color: #333;
}

.popup-box input {
  width: 100%;
  margin-bottom: 15px;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.popup-box button {
  background: #6c63ff;
  color: white;
  border: none;
  padding: 10px;
  width: 100%;
  border-radius: 5px;
  font-weight: bold;
  cursor: pointer;
}

.popup-box .toggle-text {
  margin-top: 10px;
  font-size: 14px;
  color:#333;
}

.popup-box a {
  color: #6c63ff;
  text-decoration: none;
}
.popup-box a:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(167, 165, 165, 0.3);
    
}


.popup-box .close-btn {
  position: absolute;
  right: 15px;
  top: 10px;
  font-size: 24px;
  cursor: pointer;
  color: #333;
}

.hidden {
  display: none;
}

.forgot-password {
  text-align: center;
  margin: 5px 0 10px;
}

.forgot-password a {
  color: black;
  text-decoration: none;
  font-size: 14px;
}

.forgot-password a:hover {
  text-decoration: underline;
}

    .hero {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      background: url('images/home.jpg') no-repeat center center/cover;
      padding: 120px 20px;
      position: relative;
      color: white;
      }

.hero::before {
  content: "";
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.55); 
  z-index: 1;
}

.hero h1,
.hero p,
.hero .cta {
  position: relative;
  z-index: 2;
}

.hero h1 {
  font-size: 42px;
  margin-bottom: 20px;
}

.hero p {
  font-size: 18px;
  max-width: 600px;
  margin: auto;
  margin-bottom: 30px;
}

.hero .cta {
  padding: 12px 24px;
  font-size: 16px;
  background: #43a047;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
}
.cta:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }


    .hero h1 {
      font-size: 42px;
      color: #1e88e5;
      margin-bottom: 20px;
    }

    .hero p {
      font-size: 18px;
      max-width: 600px;
      color: white;
      margin-bottom: 30px;
    }

    .cta {
      padding: 12px 24px;
      font-size: 16px;
      background: #43a047;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
    }

    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 60px 20px;
      background: linear-gradient(to bottom, #f8faff, #e6f0ff);
      gap:20px;
      
    }

    .feature {
      width: 300px;
      background: #a5d7fa;
      margin: 15px;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .feature:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }

    .feature h3 {
      margin-top: 10px;
      color: #1976d2;
    }

    footer {
      text-align: center;
      padding: 20px;
      background: #1e88e5;
      color: white;
      height:80px;
    }
    .footer_links{
      padding-bottom: 5px;
      color:  white;
    }
   
    #scrollToTopBtn {
  position: fixed;
  bottom:60px;
  right: 30px;
  z-index: 99;
  font-size: 22px;
  background-color: #1e88e5;
  color: white;
  border: none;
  outline: none;
  padding: 12px 16px;
  border-radius: 50%;
  cursor: pointer;
  display: none;
  transition: background-color 0.3s ease, transform 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

#scrollToTopBtn:hover {
  background-color: #1565c0;
  transform: translateY(-3px);
}

    @media (max-width: 768px) {
      .features {
        flex-direction: column;
        align-items: center;
      }

      header {
        flex-direction: column;
        text-align: center;
      }

      .nav-buttons {
        margin-top: 10px;
      }
    }
    .navbar {
  position: sticky;
  top: 0;
  background: #1e88e5;
  padding: 10px 30px;
  display: flex;
  justify-content: flex-end;
  gap: 40px;
  z-index: 999;
}

.navbar a {
  text-decoration: none;
  color: white;
  font-weight: 600;
  
}
.navbar a:hover {
    transform: translateY(-3px);
    box-shadow:  5px  rgba(121, 120, 120, 0.3);
    }

.modal {
  display: none;
  position: fixed;
  z-index: 999;
  left: 0; top: 0;
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.5);
}


.modal-content {
  background-color: white;
  margin: 10% auto;
  padding: 30px;
  border-radius: 12px;
  max-width: 400px;
  position: relative;
  box-shadow: 0 6px 20px rgba(0,0,0,0.3);
  animation: fadeIn 0.4s ease-in-out;
}

.modal-content h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

.modal-content input {
  width: 100%;
  padding: 12px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 8px;
}

.modal-content button {
  width: 100%;
  padding: 12px;
  background: #1e88e5;
  color: white;
  border: none;
  border-radius: 8px;
  font-weight: bold;
  cursor: pointer;
}

.modal-content button:hover {
  background: #1565c0;
}


.close {
  position: absolute;
  top: 10px; right: 15px;
  font-size: 24px;
  font-weight: bold;
  cursor: pointer;
  color: #999;
}

@keyframes fadeIn {
  from { transform: scale(0.9); opacity: 0; }
  to { transform: scale(1); opacity: 1; }
}

.section-title{
  text-align: center;
  padding: 50px 0px ;
  font-size: xx-large;
  background: linear-gradient(to bottom, #f8faff, #f7f9fd);
}
.motivational-box {
  margin-top: 10px;
  margin-bottom: 30px;
  padding: 30px 20px;
  text-align: center;
  background-color: #74c997;
  border-radius: 8px;
  font-size: 1.1rem;
  font-weight: bold;
  color: white;
  max-width:500px;
  margin-left: auto;
  margin-right: auto;
  transition: opacity 0.5s ease-in-out;
}
</style>
</head>
<body>
    
<header >
    <div class="logo">📚 Study Buddy</div>
    <nav class="navbar" data-aos="fade-down">
    <a href="home.jsp">Home</a>
    <a href="howitworks.jsp">How It Works</a>
    <a href="features.jsp">Features</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
    <a href="faq.jsp">FAQ</a>
    </nav>

 <div class="register">
  <button onclick="openPopup()">Register</button>
</div>

<div class="popup" id="authPopup">
  <div class="popup-box">
    <span class="close-btn" onclick="closePopup()">&times;</span>

    <form id="registerForm" class="form-section" action="RegisterServlet" method="post">
      <h2>Register</h2>
      <input type="text" name="fullname" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Sign Up</button>
      <p class="toggle-text">Already a member? <a href="javascript:void(0)" onclick="toggleForms('login')">Login here</a></p>
    </form>

    <form id="loginForm" class="form-section hidden" action="LoginServlet" method="post">
      <h2>Login</h2>
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Login</button>
      <p class="toggle-text">New user? <a href="javascript:void(0)" onclick="toggleForms('register')">Register here</a></p>
      <div class="forgot-password">
        <a href="#">Forgot Password?</a>
      </div>
    </form>
  </div>
</div>
</header>

  <section class="hero">
    <h1>Your Virtual Study Companion</h1>
    <p>Track your study time, stay consistent, and crush your academic goals with your own AI-powered study buddy.</p>
    <button class="cta" onclick="openPopup()">Get Started</button>
  </section>

  
  <h2 class="section-title">Study smart. Stay on track</h2>

  <section class="features">
  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://img.icons8.com/ios/100/000000/timer.png" width="50" />
    <h3>Pomodoro Timer</h3>
    <p>Boost focus with 25-minute study bursts and breaks.</p>
  </div>

  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://img.icons8.com/ios/100/000000/goal.png" width="50" />
    <h3>Goal Setting</h3>
    <p>Set daily, weekly, and long-term academic goals.</p>
  </div>

  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://img.icons8.com/ios/100/000000/artificial-intelligence.png" width="50" />
    <h3>AI Study Coach</h3>
    <p>Get smart tips, reminders, and performance insights.</p>
  </div>

  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://img.icons8.com/ios/100/000000/bar-chart.png" width="50" />
    <h3>Progress Tracker</h3>
    <p>Visualize your study trends and subject strengths.</p>
  </div>

  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://cdn-icons-png.freepik.com/512/2397/2397313.png?fd=1&filename=midnight_2397313.png" width="50" />
    <h3>Focus Mode</h3>
    <p>Distraction-free mode with night support for late sessions.</p>
  </div>

  <div class="feature" data-aos="fade-up" data-aos-duration="1000">
    <img src="https://img.icons8.com/ios/100/000000/medal2--v1.png" width="50" />
    <h3>Achievements</h3>
    <p>Earn badges and points for consistent study habits.</p>
  </div>
</section>
<div class="motivation-container">
<div class="motivational-box">
  <p id="motivation-text">"Push yourself, because no one else is going to do it for you."</p>
</div>
</div>


<button id="scrollToTopBtn" title="Go to top">↑</button>


  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>

<script>
  
  const scrollBtn = document.getElementById("scrollToTopBtn");

  window.onscroll = function () {
    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
      scrollBtn.style.display = "block";
    } else {
      scrollBtn.style.display = "none";
    }
  };
  scrollBtn.addEventListener("click", function () {
    window.scrollTo({ top: 0, behavior: "smooth" });
  });
</script>

<script>
  const quotes = [
    "Push yourself, because no one else do it for you.",
    "Don’t watch the clock; do what it does. Keep going.",
    "Small progress is still progress.",
    "Study now, shine later.",
    "Focus on the process, not the outcome."
  ];

  let currentQuote = 0;
  const textElement = document.getElementById("motivation-text");

  setInterval(() => {
    currentQuote = (currentQuote + 1) % quotes.length;
    textElement.style.opacity = 0;
    setTimeout(() => {
      textElement.textContent = quotes[currentQuote];
      textElement.style.opacity = 1;
    }, 500);
  }, 5000); // Change every 4 seconds
</script>
<script>
  function openPopup() {
    document.getElementById("authPopup").style.display = "flex";
    showForm("register");
  }

  function closePopup() {
    document.getElementById("authPopup").style.display = "none";
  }

  function toggleForms(form) {
    showForm(form);
  }

  function showForm(type) {
    const login = document.getElementById("loginForm");
    const register = document.getElementById("registerForm");

    if (type === "login") {
      login.classList.remove("hidden");
      register.classList.add("hidden");
    } else {
      register.classList.remove("hidden");
      login.classList.add("hidden");
    }
  }
</script>

<footer>
  <div class="footer_links">
    <a href="about.jsp">About</a> |
    <a href="contact.jsp">Contact</a> |
    <a href="privacy.jsp">Privacy Policy</a>
  </div>
&copy; 2025 Virtual Study Buddy. All rights reserved.
  </footer>
</body>
</html>

