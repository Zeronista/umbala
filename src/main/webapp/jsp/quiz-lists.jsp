<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
<head>
    <title>Quiz Lists - QuizLoco</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/css/fonts.css" rel="stylesheet">
</head>
<body>
<%-- Include header --%>
<header>
    <div class="container">
        <h1><a href="${pageContext.request.contextPath}/index.jsp" class="logo">QuizLoco</a></h1>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#services">Services</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Contact</a></li>
            </ul>
        </nav>

        <!-- Display login/register or user details based on session -->
        <div class="auth-links">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <!-- Display username and logout button when user is logged in -->
            <div class="user-info">
                <p>Hello, <%= username %>!</p>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-logout">Logout</a>
            </div>
            <%
            } else {
            %>
            <!-- Display login button if user is not logged in -->
            <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="btn-login">Login</a>
            <%
                }
            %>
        </div>

        <div class="mobile-menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</header>

<main>
    <div class="content-with-sidebar">
        <%-- Include sidebar --%>
        <aside class="sidebar">
            <h2>Quick Links</h2>
            <!-- Sidebar Links -->
            <ul>
                <li><a href="${pageContext.request.contextPath}/jsp/blog-lists.jsp">Blog Lists</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/quiz-lists.jsp">Quiz Lists</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/view-lessons.jsp">View Quizzes</a></li>
            </ul>
        </aside>
        <div class="main-content">
            <div class="container">
                <h2>Available Quizzes</h2>
                <div class="quiz-list">
                    <div class="quiz-item">
                        <h3>Quiz Title 1</h3>
                        <p>Description: A brief description of the quiz.</p>
                        <p>Category: Science</p>
                        <p>Number of Questions: 10</p>
                        <p>Difficulty: Medium</p>
                        <p>Author: John Doe</p>
                        <p>Date Created: 2024-01-01</p>
                        <p>Average Rating: 4.5</p>
                        <p>Number of Attempts: 150</p>
                        <p>Tags: Science, General Knowledge</p>
                        <p>Estimated Time: 15 minutes</p>
                        <div class="quiz-actions">
                            <a href="start-quiz.jsp" class="btn btn-start">Start Quiz</a>
                            <a href="quiz-details.jsp" class="btn btn-details">View Details</a>
                            <a href="#" class="btn btn-share">Share</a>
                        </div>
                    </div>
                    <div class="quiz-item">
                        <h3>Quiz Title 2</h3>
                        <p>Description: Another brief description of the quiz.</p>
                        <p>Category: History</p>
                        <p>Number of Questions: 15</p>
                        <p>Difficulty: Hard</p>
                        <p>Author: Jane Smith</p>
                        <p>Date Created: 2024-02-15</p>
                        <p>Average Rating: 4.8</p>
                        <p>Number of Attempts: 200</p>
                        <p>Tags: History, World</p>
                        <p>Estimated Time: 20 minutes</p>
                        <div class="quiz-actions">
                            <a href="start-quiz.jsp" class="btn btn-start">Start Quiz</a>
                            <a href="quiz-details.jsp" class="btn btn-details">View Details</a>
                            <a href="#" class="btn btn-share">Share</a>
                        </div>
                    </div>
                    <div class="quiz-item">
                        <h3>Quiz Title 3</h3>
                        <p>Description: Yet another brief description of the quiz.</p>
                        <p>Category: Technology</p>
                        <p>Number of Questions: 20</p>
                        <p>Difficulty: Easy</p>
                        <p>Author: Alice Johnson</p>
                        <p>Date Created: 2024-03-10</p>
                        <p>Average Rating: 4.2</p>
                        <p>Number of Attempts: 100</p>
                        <p>Tags: Technology, Innovations</p>
                        <p>Estimated Time: 10 minutes</p>
                        <div class="quiz-actions">
                            <a href="start-quiz.jsp" class="btn btn-start">Start Quiz</a>
                            <a href="quiz-details.jsp" class="btn btn-details">View Details</a>
                            <a href="#" class="btn btn-share">Share</a>
                        </div>
                    </div>
                    <!-- Repeat for other quizzes -->
                </div>
            </div>
        </div> <!-- End of main-content -->
    </div> <!-- End of content-with-sidebar -->
</main>

<%-- Include footer --%>
<footer id="contact">
    <div class="container">
        <p>&copy; 2024 QuizLoco. All rights reserved.</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>