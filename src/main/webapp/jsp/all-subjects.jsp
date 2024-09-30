<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Subjects - QuizLoco</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header>
  <!-- Include common header here -->
</header>

<main>
  <section class="all-subjects">
    <div class="container">
      <h2>All Subjects</h2>
      <div class="subject-grid">
        <%
          // Sample data for subjects, in actual implementation this will come from the backend
          String[] subjects = { "Math", "Science", "History", "Literature", "Physics", "Geography", "Computer Science", "Chemistry" };
          for (String subject : subjects) {
        %>
        <a href="${pageContext.request.contextPath}/jsp/subject.jsp?id=<%= subject.toLowerCase() %>" class="subject-card">
          <img src="${pageContext.request.contextPath}/img/<%= subject.toLowerCase() %>.jpg" alt="<%= subject %>" loading="lazy">
          <h3><%= subject %></h3>
        </a>
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
