<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz Detail - QuizLoco</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header>
  <!-- Include common header here -->
</header>

<main>
  <section class="quiz-detail">
    <div class="container">
      <div class="quiz-header">
        <h2>Quiz Title</h2>
        <p>Challenge yourself with this quiz on [Subject]. Test your knowledge on [Topic] and improve your skills.</p>
        <a href="${pageContext.request.contextPath}/jsp/take-quiz.jsp?id=${param.id}" class="btn-quiz">Start Quiz</a>
      </div>
      <div class="quiz-info">
        <h3>Quiz Information</h3>
        <p>Number of Questions: 10</p>
        <p>Difficulty: Medium</p>
        <p>Time Limit: 10 minutes</p>
      </div>
    </div>
  </section>
</main>

<footer>
  <!-- Include common footer here -->
</footer>

</body>
</html>
