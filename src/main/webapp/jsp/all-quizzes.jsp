<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Quizzes - QuizLoco</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header>
  <!-- Include common header here -->
</header>

<main>
  <section class="all-quizzes">
    <div class="container">
      <h2>All Quizzes</h2>
      <div class="quiz-grid">
        <%
          // Sample data for quizzes, this will be fetched from the database in a real implementation
          String[] quizzes = { "Basic Algebra", "World History", "English Literature", "Physics", "Geography", "Chemistry" };
          for (String quiz : quizzes) {
        %>
        <div class="quiz-card">
          <img src="${pageContext.request.contextPath}/img/<%= quiz.replaceAll(" ", "-").toLowerCase() %>.jpg" alt="<%= quiz %>" loading="lazy">
          <div class="quiz-content">
            <h3><%= quiz %></h3>
            <p>Test your knowledge on <%= quiz %>.</p>
            <a href="${pageContext.request.contextPath}/jsp/quiz-detail.jsp?id=<%= quiz.hashCode() %>" class="btn-quiz">Take Quiz</a>
          </div>
        </div>
        <% } %>
      </div>
    </div>
  </section>
</main>

<footer>
  <!-- Include common footer here -->
</footer>

</body>
</html>
