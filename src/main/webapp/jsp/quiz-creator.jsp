<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz Creator - QuizLoco</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quiz-creator.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<header>
  <div class="container">
    <a href="#" class="logo">QuizLoco</a>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Quizzes</a></li>
        <li><a href="#">Subjects</a></li>
        <li><a href="#">Create</a></li>
      </ul>
    </nav>
    <div class="auth-links">
      <a href="#" class="user-profile">
        <i class="fas fa-user-circle"></i>
        <span class="username">John Doe</span>
      </a>
      <a href="#" class="btn-logout">Logout</a>
      <div class="theme-toggle">
        <input type="checkbox" id="theme-toggle">
        <label for="theme-toggle">
          <i class="fas fa-moon"></i>
          <i class="fas fa-sun"></i>
        </label>
      </div>
    </div>
    <button class="mobile-menu-toggle">
      <i class="fas fa-bars"></i>
    </button>
  </div>
</header>

<main>
  <section class="quiz-creator">
    <div class="container">
      <h2>Create Your Own Quiz</h2>
      <form action="QuizCreatorServlet" method="post" class="quiz-form">
        <label for="quiz-title">Quiz Title:</label>
        <input type="text" id="quiz-title" name="quizTitle" required>

        <label for="quiz-description">Description:</label>
        <textarea id="quiz-description" name="quizDescription" required></textarea>

        <label for="quiz-tags">Tags:</label>
        <div class="tags-input">
          <div id="quiz-tags"></div>
          <input type="text" id="add-tag-input" placeholder="Add a tag">
          <button type="button" id="add-tag-btn">Add Tag</button>
        </div>

        <label for="quiz-questions">Add Questions:</label>
        <div id="quiz-questions">
          <!-- JavaScript will dynamically add question inputs here -->
        </div>

        <button type="button" id="add-question-btn">Add Question</button>
        <button type="submit" class="btn-submit">Create Quiz</button>
      </form>
    </div>
  </section>
</main>

<footer>
  <div class="container">
    <div class="footer-content">
      <div class="footer-section">
        <h3>About QuizLoco</h3>
        <p>QuizLoco is a platform for creating and taking quizzes on various subjects. Learn, challenge yourself, and have fun!</p>
      </div>
      <div class="footer-section">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Quizzes</a></li>
          <li><a href="#">Subjects</a></li>
          <li><a href="#">Create Quiz</a></li>
        </ul>
      </div>
      <div class="footer-section">
        <h3>Contact Us</h3>
        <ul>
          <li><a href="mailto:support@quizloco.com">support@quizloco.com</a></li>
          <li><a href="tel:+1234567890">+1 (234) 567-890</a></li>
        </ul>
      </div>
      <div class="footer-section">
        <h3>Follow Us</h3>
        <div class="social-icons">
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-linkedin"></i></a>
        </div>
      </div>
    </div>
    <div class="copyright">
      &copy; 2024 QuizLoco. All rights reserved.
    </div>
  </div>
</footer>

<script src="${pageContext.request.contextPath}/js/quiz-creator.js"></script>
</body>
</html>