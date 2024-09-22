<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>QuizLoco</title>
  <link rel="stylesheet" href="css/styles.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<header>
  <div class="container">
    <h1><a href="index.jsp" class="logo">QuizLoco</a></h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
    </nav>
    <div class="auth-links">
      <a href="jsp/login.jsp" class="btn-login">Login</a>
    </div>
    <div class="mobile-menu-toggle">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</header>
<main>
  <section class="hero">
    <div class="container">
      <h2>Welcome to QuizLoco</h2>
      <p>Your ultimate quiz platform</p>
      <a href="jsp/register.jsp" class="btn btn-register">Register</a>
    </div>
  </section>
  <section class="features" id="about">
    <div class="container">
      <h2>Our Features</h2>
      <div class="features-grid">
        <div class="feature">
          <h3>Feature 1</h3>
          <p>Description of feature 1.</p>
        </div>
        <div class="feature">
          <h3>Feature 2</h3>
          <p>Description of feature 2.</p>
        </div>
        <div class="feature">
          <h3>Feature 3</h3>
          <p>Description of feature 3.</p>
        </div>
      </div>
    </div>
  </section>
  <section class="cta" id="services">
    <div class="container">
      <h2>Join Us Today</h2>
      <p>Become a part of QuizLoco and test your knowledge with thousands of quizzes!</p>
      <a href="#" class="btn btn-cta">Sign Up Now</a>
    </div>
  </section>
</main>
<footer id="contact">
  <div class="container">
    <p>&copy; 2024 QuizLoco. All rights reserved.</p>
  </div>
</footer>

<script src="js/script.js"></script>
</body>
</html>
