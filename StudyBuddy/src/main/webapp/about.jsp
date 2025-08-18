<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>About | Study Buddy</title>
  
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<style>
  body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
  background-color: #f9f9fb;
  color: #333;
}

.navbar {
  background-color: #1e88e5;
  color: white;
  padding: 10px 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.logo {
      font-size: 24px;
      font-weight: bold;
    }

.navbar ul {
  list-style: none;
  display: flex;
  gap: 30px;
}

.navbar ul li a {
text-decoration: none;
      color: white;
      
    }
    a:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 10px rgba(136, 134, 134, 0.3);
    }

.dark-overlay::before {
  content: "";
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: rgba(0, 0, 0, 0.5); 
  z-index: 1;
}

.dark-overlay .content {
  position: relative;
  z-index: 2; 
  text-align: center;
  padding: 100px 20px;
}

.content h1 {
  font-size: 3rem;
  color:white;
}

.content p {
  font-size: 1.4rem;
  margin-top: 15px;
  color:white;
}
.mission{
background: white;
}

.vision{
  background: linear-gradient(to bottom, #d8e2fc, #d1e4ff);
}
.mission, .vision, .about-features {
  padding: 60px 20px;
  text-align: center;
}

.about-features h2 {
  margin-bottom: 40px;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 30px;
  padding: 0 20px;
}

.feature-box {
  background: white;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  transition: transform 0.3s ease;
}

.feature-box:hover {
  transform: translateY(-8px);
}

.feature-box img {
  height: 60px;
  margin-bottom: 15px;
}

.cta-section {
  background-color: #e6f2ff;
  text-align: center;
  padding: 60px 20px;
}

.get-started-btn {
  padding: 12px 30px;
  background-color: #1e88e5;
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  margin-top: 20px;
  display: inline-block;
}

.about-fullscreen {
  height: 50vh;
  background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.5)),
              url('images/about_features.jpg') no-repeat center/cover;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 40px;
}

.feature-text {
  max-width: 700px;
  animation: fadeIn 1s ease-in-out;
}

.feature-text h2 {
  font-size: 2.5rem;
  margin-bottom: 20px;
}

.feature-text p {
  font-size: 1.2rem;
  line-height: 1.6;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

footer {
  background-color: #1e88e5;
  color: #fff;
  text-align: center;
  padding: 20px;
  font-size: 0.9rem;
}
</style>
</head>
<body>
  <header class="navbar">
    <div class="logo">📚 Study Buddy</div>
    <nav>
      <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="features.jsp">Features</a></li>
        <li><a href="howitworks.jsp">How It Works</a></li>
        <li><a href="faq.jsp">FAQ</a></li>
        <li><a href="contact.jsp">Contact</a></li>
      </ul>
    </nav>
  </header>
  
  
  <section class="dark-overlay" style="background: url('images/about_image\ \(2\).jpg') no-repeat center/cover; position: relative; height: 70vh;">
  <div class="content">
    <h1>About Study Buddy</h1>
    <p>Your ultimate virtual companion for smarter, focused, and productive learning.</p>
  </div>
</section>


  <section class="mission">
    <h2>Our Mission</h2>
    <p>To empower learners of all ages with the right tools and motivation to make studying enjoyable, structured, and successful.</p>
  </section>

  <section class="vision">
    <h2>Why We Built Study Buddy</h2>
    <p>We understand the struggle of staying consistent and focused while studying alone. Study Buddy was born to bring structure, support, and encouragement to every learner—just like a real-life study partner.</p>
  </section>
  

  <section class="about-fullscreen">
    <div class="feature-text" id="featureText">
      <h2>🎯 Goal Setting</h2>
      <p>Set clear academic goals and stay on track with smart reminders.</p>
    </div>
  </section>

  <script>
    const features = [
  {
    title: "🎯 Goal Setting",
    desc: "Set clear academic goals and stay on track with smart reminders."
  },
  {
    title: "⏳ Pomodoro Timer",
    desc: "Focus in short bursts and take breaks with the built-in Pomodoro technique."
  },
  {
    title: "🤖 AI Study Coach",
    desc: "Get personalized study suggestions based on your progress and habits."
  },
  {
    title: "📊 Progress Tracker",
    desc: "Visualize your daily, weekly and monthly learning milestones."
  },
  {
    title: "🔒 Focus Mode",
    desc: "Eliminate distractions and study without interruption using focus mode."
  },
  {
    title: "🏆 Achievements",
    desc: "Celebrate your progress with badges, streaks and rewards."
  }
];

let i = 0;
const featureText = document.getElementById("featureText");

function showFeature() {
  featureText.innerHTML = `
    <h2>${features[i].title}</h2>
    <p>${features[i].desc}</p>
  `;
  i = (i + 1) % features.length;
}

setInterval(showFeature, 3000); // Change every 3 seconds

  </script>

  <section class="cta-section">
    <h2>Ready to Study Smarter?</h2>
    <a href="home.jsp" class="get-started-btn">Get Started with Study Buddy</a>
  </section>

  <footer>
    <p>&copy; 2025 Study Buddy. All rights reserved.</p>
  </footer>
</body>
</html>
