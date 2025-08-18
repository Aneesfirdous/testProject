<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact - Study Buddy</title>
  
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

.contact-section {
  position: relative;
  background:linear-gradient(to bottom, #f8faff, #e6f0ff);
  height: 100vh;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 60px 20px;
}

.overlay {
  position: absolute;
  top: 0; left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.7);
  z-index: 1;
}

.contact-container {
  position: relative;
  z-index: 2;
  max-width: 1000px;
  width: 100%;
  background: rgba(255,255,255,0.05);
  padding: 40px;
  border-radius: 10px;
  backdrop-filter: blur(5px);
  text-align: center;
}

.contact-container h2 {
  font-size: 2.5rem;
  margin-bottom: 10px;
}

.contact-boxes {
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
  margin-top: 30px;
  justify-content: space-between;
}

.contact-info, .contact-form {
  flex: 1 1 45%;
  text-align: left;
}

.contact-info h3 {
  font-size: 1.4rem;
  margin-bottom: 15px;
}

.contact-info p {
  margin: 10px 0;
}

.contact-form form {
  display: flex;
  flex-direction: column;
}

.contact-form input,
.contact-form textarea {
  margin-bottom: 15px;
  padding: 10px;
  border: none;
  border-radius: 5px;
  font-size: 1rem;
}

.contact-form button {
  background-color: #1e88e5;
  color: #fff;
  padding: 12px;
  font-size: 1rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s ease;
}

.contact-form button:hover {
  background-color: #1e88e5;
}

  </style>
</head>
<body>

  <section class="contact-section">
    <div class="overlay"></div>
    
    <div class="contact-container">
      <h2>📞 Get in Touch</h2>
      <p>Have questions or feedback? We'd love to hear from you!</p>

      <div class="contact-boxes">
        <div class="contact-info">
          <h3>Contact Information</h3>
          <p><strong>Email:</strong> support@studybuddy.com</p>
          <p><strong>Phone:</strong> +91 98765 43210</p>
          <p><strong>Location:</strong> Chennai, India</p>
        </div>

        <div class="contact-form">
          <form action="#" method="post">
            <input type="text" name="name" placeholder="Your Name" required />
            <input type="email" name="email" placeholder="Your Email" required />
            <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
          </form>
        </div>
      </div>
    </div>

  </section>

</body>
</html>
