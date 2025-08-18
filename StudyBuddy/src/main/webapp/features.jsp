<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Study Buddy Features</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to bottom, #e3f2fd, #ffffff);
      color: #333;
    }

    .features-title-section {
  text-align: center;
  margin-top: 60px;
  margin-bottom: 20px;
  padding: 0 20px;
}

.page-title {
  font-size: 2.5rem;
  font-weight: 700;
  color:#1e88e5;
}

.page-subtitle {
  font-size: 1.1rem;
  color: #666;
  max-width: 700px;
  margin: 0 auto;
}

body.dark-mode .page-title {
  color: #f0f0f0;
}

body.dark-mode .page-subtitle {
  color: #bbbbbb;
}

.simple-navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background:#1e88e5;
  padding: 20px 30px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  position: sticky;
  top: 0;
  z-index: 999;
}

.simple-navbar .nav-left {
  font-weight: bold;
  font-size: 1.2rem;
  color: white;
}

.simple-navbar .back-home-btn {
  background-color: #4CAF50;
  color: white;
  padding: 6px 14px;
  border-radius: 4px;
  text-decoration: none;
  transition: background 0.3s ease;
}

.simple-navbar .back-home-btn:hover {
  background-color: #388e3c;
}


    .features-section {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 40px;
      padding: 60px 40px;
      max-width: 1200px;
      margin: auto;
    }

    .feature-box {
      background: white;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
      text-align: center;
      transition: transform 0.3s ease;
    }

    .feature-box:hover {
      transform: translateY(-10px);
    }

    .feature-box img {
      width: 100px;
      height: 100px;
      margin-bottom: 20px;
    }

    .feature-box h3 {
      color: #1976d2;
      font-size: 20px;
      margin-bottom: 10px;
    }

    .feature-box p {
      font-size: 15px;
      color: #555;
    }
    

    footer {
      background-color: #1e88e5;
      padding: 20px;
      text-align: center;
      margin-top: 50px;
      font-size: 14px;
    }

    @media (max-width: 600px) {
      .feature-box img {
        width: 80px;
        height: 80px;
      }
    }
  </style>
</head>
<body>
  <nav class="simple-navbar">
  <div class="nav-left">📚 Study Buddy</div>
  <div class="nav-right">
    <a href="home.jsp" class="back-home-btn">← Back to Home</a>
  </div>
</nav>

<section class="features-title-section">
  <h2 class="page-title">Smarter Study Starts Here</h2>
  <p class="page-subtitle">Explore the powerful tools that help you stay focused, track your progress, and achieve your academic goals.</p>
</section>


<section class="features-section">

  <div class="feature-box" data-aos="fade-up">
    <img src="images/pomodoro-technique.png" alt="Pomodoro Timer" />
    <h3>Pomodoro Timer</h3>
    <p>Work in focused intervals with short breaks. Boost productivity using the classic Pomodoro method.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="100">
    <img src="https://cdn-icons-png.flaticon.com/512/3771/3771532.png" alt="Goal Setting" />
    <h3>Goal Setting</h3>
    <p>Define your daily, weekly, and monthly study goals. Stay aligned with your academic journey.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="200">
    <img src="https://cdn-icons-png.flaticon.com/512/4712/4712035.png" alt="AI Study Coach" />
    <h3>AI Study Coach</h3>
    <p>Get personalized guidance and tips from our smart AI coach trained to improve your study habits.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="300">
    <img src="images/successful.png" alt="Progress Tracker" />
    <h3>Progress Tracker</h3>
    <p>Visualize your learning progress with weekly charts, time stats, and subject-wise tracking.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="400">
    <img src="images/focus.png" alt="Focus Mode" />
    <h3>Focus Mode</h3>
    <p>Minimize distractions with a calm interface, ambient sounds, and a dedicated focus screen.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="500">
    <img src="images/acheivement.png" alt="Achievements" />
    <h3>Achievements</h3>
    <p>Earn badges for consistency, milestones, and dedication. Celebrate every win in your journey!</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="500">
    <img src="images/memory.png" alt="Memory Booster Tools" />
    <h3>Memory Booster Tools</h3>
    <p>Use flashcards and spaced repetition techniques to improve long-term retention and fast recall of key topics.</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="500">
    <img src="images/wellness_breaks.png" alt="Wellness Breaks" />
    <h3>Daily Mood Tracker</h3>
    <p>"Track your daily mood to understand your emotional patterns and boost self-awareness."</p>
  </div>

  <div class="feature-box" data-aos="fade-up" data-aos-delay="500">
    <img src="images/daily_challenges.png" alt="Daily Challenges & Streaks" />
    <h3>Daily Challenges and Streaks</h3>
    <p>Stay inspired with daily goals, streak milestones and challenges. Turn study into a fun, gamified experience.</p>
  </div>

  

</section>


<footer>
  &copy; 2025 Study Buddy. Empowering learners with smart features 💙
</footer>

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
  AOS.init({ duration: 1000 });
</script>

</body>
</html>
