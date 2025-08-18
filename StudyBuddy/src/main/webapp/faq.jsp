<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FAQ - Study Buddy</title>
  
  <style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', sans-serif;
}

body, html {
  height: 100%;
}

.faq-section {
  background: url('images/faq.jpg') no-repeat center/cover;
  height: 100vh;
  position: relative;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 50px;
}

.overlay {
  position: absolute;
  top: 0; left: 0;
  width: 100%;
  height: 100%;
  background: rgba(172, 223, 252, 0.75);
  z-index: 1;
}

.faq-container {
  position: relative;
  z-index: 2;
  max-width: 900px;
  width: 100%;
  background: rgba(15, 1, 1, 0.05);
  padding: 40px;
  border-radius: 10px;
  backdrop-filter: blur(5px);
}

.faq-container h2 {
  text-align: center;
  margin-bottom: 30px;
  font-size: 2.5rem;
}

.accordion .faq-item {
  margin-bottom: 15px;
}

.accordion .question {
  width: 100%;
  text-align: left;
  padding: 15px;
  font-size: 1.2rem;
  background-color: #222;
  border: none;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

.accordion .question:hover {
  background-color: #444;
}

.accordion .answer {
  display: none;
  background: #111;
  padding: 15px;
  color: #ccc;
  border-radius: 0 0 5px 5px;
  margin-top: -5px;
  font-size: 1rem;
}

  </style>
</head>
<body>

  <section class="faq-section">
    <div class="overlay"></div>

    <div class="faq-container">
      <h2>🙋 Frequently Asked Questions</h2>

      <div class="accordion">
        <div class="faq-item">
          <button class="question">What is Study Buddy?</button>
          <div class="answer">
            <p>Study Buddy is a personalized study tracking app designed to help students manage their goals, focus sessions, and progress efficiently.</p>
          </div>
        </div>

        <div class="faq-item">
          <button class="question">How do I use the Pomodoro Timer?</button>
          <div class="answer">
            <p>Go to the Timer section and click "Start". The timer runs for 25 minutes followed by a 5-minute break. Customize durations in Settings.</p>
          </div>
        </div>

        <div class="faq-item">
          <button class="question">Is the app free to use?</button>
          <div class="answer">
            <p>Yes! Most features are free. We also offer premium upgrades for advanced features like AI study coach and detailed reports.</p>
          </div>
        </div>

        <div class="faq-item">
          <button class="question">How do I track my progress?</button>
          <div class="answer">
            <p>Progress Tracker displays your completed goals, time spent, focus streaks, and achievements over time.</p>
          </div>
        </div>

        <div class="faq-item">
          <button class="question">Can I access Study Buddy on my phone?</button>
          <div class="answer">
            <p>Yes, our web app is mobile-responsive. Native mobile apps are coming soon on iOS and Android!</p>
          </div>
        </div>
      </div>
    </div>

  </section>

  
</body>
</html>