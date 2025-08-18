<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>How Study Buddy Works</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      background: url('images/how_it_works_background\ \(2\).jpg') no-repeat center center fixed;
      background-size: cover;
      color: #333;
      backdrop-filter: brightness(1);
      
    }

    .features-title-section {
  text-align: center;
  margin-top: 60px;
  margin-bottom: 20px;
  padding: 0 5px;
}

.page-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: #1976d2;
}

.page-subtitle {
  font-size: 2rem;
  color: black; 
  font-weight: bold;
  max-width: 700px;
  margin: 0 auto;
}

body.dark-mode .page-title {
  color: #bbbbbb;

}

body.dark-mode .page-subtitle {
  color: #bbbbbb;
}

.simple-navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #1e88e5;
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


    .container {
      max-width: 1000px;
      margin: 50px auto;
      padding: 20px;
    }

    .step {
      display: flex;
      align-items: center;
      margin: 40px 0;
      gap: 30px;
      flex-wrap: wrap;
    }

    .step:nth-child(even) {
      flex-direction: row-reverse;
    }

    .step img {
      width: 300px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .step-content {
      flex: 1;
    }

    .step-content h2 {
      font-size: 24px;
      color: #1976d2;
    }

    .step-content p {
      font-size: 16px;
      color: black;
      font-weight: bold;
      margin-top: 10px;
    }

    .cta-section {
      background: linear-gradient(135deg, #1e88e5, #42a5f5);
      color: white;
      padding: 60px 20px;
      text-align: center;
      border-radius: 10px;
      margin-top: 60px;
    }

    .cta-section h2 {
      font-size: 30px;
      margin-bottom: 20px;
    }

    .cta-section p {
      font-size: 18px;
      margin-bottom: 30px;
    }

    .cta-section a {
      background: white;
      color: #1976d2;
      padding: 12px 30px;
      border-radius: 8px;
      font-weight: bold;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .cta-section a:hover {
      background: #e3f2fd;
    }

    footer {
      text-align: center;
      background: #1e88e5;
      padding: 20px;
      margin-top: 40px;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .step {
        flex-direction: column;
        text-align: center;
      }

      .step img {
        width: 90%;
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
  <h2 class="page-title">How Study Buddy Works</h2>
  <p class="page-subtitle">Your smart companion to plan, focus, and track every study session.</p>
</section>


<div class="container">

  <div class="step" data-aos="fade-right">
    <img src="images/howitworks1.jpg" alt="Sign Up">
    <div class="step-content">
      <h2>1. Sign Up or Login</h2>
      <p>Create your account using your email. Existing users can log in with their credentials.</p>
      <p>Signing up takes less than a minute and gives you access to your personalized dashboard.</p>
    </div>
  </div>

  <div class="step" data-aos="fade-left">
    <img src="images/howitworks2.jpg" alt="Set Study Goals">
    <div class="step-content">
      <h2>2. Set Your Study Goals</h2>
      <p>Choose your subjects, topics, and how many hours you want to study daily or weekly.</p>
      <p>Set short-term and long-term academic goals tailored to your learning style.</p>
    </div>
  </div>

  <div class="step" data-aos="fade-right">
    <img src="images/howitworks3.jpg" alt="Track Progress">
    <div class="step-content">
      <h2>3. Track and Monitor</h2>
      <p>Use the tracker to log study hours, view your stats, and analyze performance.</p>
      <p>Visual progress charts help you stay motivated and make smart adjustments.</p>
    </div>
  </div>

  <div class="step" data-aos="fade-left">
    <img src="images/howitworks4.jpg" alt="Stay Focused">
    <div class="step-content">
      <h2>4. Stay Focused and Motivated</h2>
      <p>Use focus mode, motivational quotes, and study buddies to stay consistent!</p>
      <p>Enable Pomodoro timers and ambient sound playlists to avoid distractions.</p>
    </div>
  </div>

  <div class="cta-section" data-aos="zoom-in">
    <h2>Ready to Boost Your Study Game?</h2>
    <p>Join thousands of learners using Study Buddy to stay on track and crush their goals.</p>
    <a href="home.jsp">Get Started</a>
  </div>

</div>

<footer>
  &copy; 2025 Study Buddy. All rights reserved.
</footer>

<!-- AOS JS -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init({
    duration: 1000,
    once: true
  });
</script>

</body>
</html>
