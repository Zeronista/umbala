<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz Creator - QuizLoco</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header>
  <!-- Include common header here -->
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

        <label for="quiz-subject">Select Subject:</label>
        <select id="quiz-subject" name="quizSubject">
          <option value="math">Math</option>
          <option value="science">Science</option>
          <!-- Add more subjects as needed -->
        </select>

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
  <!-- Include common footer here -->
</footer>

<script src="${pageContext.request.contextPath}/js/quiz-creator.js"></script>
</body>
</html>
