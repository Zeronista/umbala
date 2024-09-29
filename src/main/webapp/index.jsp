<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizLoco - Your Ultimate Interactive Learning Platform</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</head>
<body>
<header>
    <div class="container">
        <a href="index.jsp" class="logo">QuizLoco</a>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#subjects">Subjects</a></li>
                <li><a href="#leaderboard">Leaderboard</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
        <div class="auth-links">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            <div class="user-info">
                <a href="${pageContext.request.contextPath}/jsp/user-profile.jsp" class="user-profile">
                    <i class="fas fa-user-circle"></i>
                    <span class="username">Welcome, <%= username %></span> <!-- Display Username with welcome message -->
                </a>
                <a href="LogoutServlet" class="btn-logout">Logout</a>
            </div>
            <%
            } else {
            %>
            <a href="jsp/login.jsp" class="btn-login">Login</a>
            <a href="jsp/register.jsp" class="btn-register">Register</a>
            <%
                }
            %>
        </div>
        <button class="mobile-menu-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</header>



<main>
    <section id="home" class="hero">
        <div class="container">
            <h1>Welcome to QuizLoco</h1>
            <p>Challenge yourself, learn, and have fun with our interactive quizzes and study tools!</p>
            <div class="cta-buttons">
                <a href="#subjects" class="cta-button">Start Quizzing Now</a>
                <a href="#create-quiz" class="cta-button secondary">Create Your Own Quiz</a>
            </div>
        </div>
    </section>

    <section id="features" class="features">
        <div class="container">
            <h2>Why Choose QuizLoco?</h2>
            <div class="features-grid">
                <div class="feature">
                    <i class="fas fa-brain"></i>
                    <h3>Diverse Topics</h3>
                    <p>Explore a wide range of subjects and challenge your knowledge.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-chart-line"></i>
                    <h3>Track Progress</h3>
                    <p>Monitor your improvement with detailed performance analytics.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-users"></i>
                    <h3>Compete & Collaborate</h3>
                    <p>Join study groups and compete on global leaderboards.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-mobile-alt"></i>
                    <h3>Mobile Friendly</h3>
                    <p>Practice anytime, anywhere with our responsive design.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="subjects" class="subjects">
        <div class="container">
            <h2>Popular Subjects</h2>
            <div class="subject-grid">
                <a href="${pageContext.request.contextPath}/jsp/subject.jsp?id=math" class="subject-card">
                    <img src="${pageContext.request.contextPath}/img/math.jpg" alt="Mathematics">
                    <h3>Mathematics</h3>
                </a>
                <a href="${pageContext.request.contextPath}/jsp/subject.jsp?id=science" class="subject-card">
                    <img src="${pageContext.request.contextPath}/img/science.jpg" alt="Science">
                    <h3>Science</h3>
                </a>
                <a href="${pageContext.request.contextPath}/jsp/subject.jsp?id=history" class="subject-card">
                    <img src="${pageContext.request.contextPath}/img/history.jpg" alt="History">
                    <h3>History</h3>
                </a>
                <a href="${pageContext.request.contextPath}/jsp/subject.jsp?id=literature" class="subject-card">
                    <img src="${pageContext.request.contextPath}/img/literature.jpg" alt="Literature">
                    <h3>Literature</h3>
                </a>
            </div>
            <a href="${pageContext.request.contextPath}/jsp/all-subjects.jsp" class="btn-view-all">View All Subjects</a>
        </div>
    </section>

    <section id="study-modes" class="study-modes">
        <div class="container">
            <h2>Multiple Ways to Learn</h2>
            <div class="mode-grid">
                <div class="mode-card">
                    <i class="fas fa-clock"></i>
                    <h3>Timed Quizzes</h3>
                    <p>Test your knowledge under pressure with our timed quiz mode.</p>
                </div>
                <div class="mode-card">
                    <i class="fas fa-users"></i>
                    <h3>Multiplayer Challenges</h3>
                    <p>Compete with friends or random opponents in real-time quiz battles.</p>
                </div>
                <div class="mode-card">
                    <i class="fas fa-graduation-cap"></i>
                    <h3>Adaptive Learning</h3>
                    <p>Our AI-powered system adjusts questions based on your performance.</p>
                </div>
                <div class="mode-card">
                    <i class="fas fa-sticky-note"></i>
                    <h3>Flashcards</h3>
                    <p>Review key concepts with our digital flashcard system.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="create-quiz" class="create-quiz">
        <div class="container">
            <h2>Create Your Own Quiz</h2>
            <p>Share your knowledge and challenge others by creating your own quizzes!</p>
            <div class="quiz-creator-preview">
                <img src="${pageContext.request.contextPath}/img/quiz-create.jpg" alt="Quiz Creator Interface">
            </div>
            <a href="${pageContext.request.contextPath}/jsp/quiz-creator.jsp" class="cta-button">Start Creating</a>
        </div>
    </section>

    <section id="leaderboard" class="leaderboard">
        <div class="container">
            <h2>Global Leaderboard</h2>
            <table>
                <thead>
                <tr>
                    <th>Rank</th>
                    <th>User</th>
                    <th>Score</th>
                </tr>
                </thead>
                <tbody>
                <!-- This would be populated dynamically from the backend -->
                <tr>
                    <td>1</td>
                    <td>QuizMaster2000</td>
                    <td>9850</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>BrainiacSupreme</td>
                    <td>9720</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>TriviaTitan</td>
                    <td>9680</td>
                </tr>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/jsp/full-leaderboard.jsp" class="btn-view-all">View Full
                Leaderboard</a>
        </div>
    </section>

    <section id="testimonials" class="testimonials">
        <div class="container">
            <h2>What Our Users Say</h2>
            <div class="testimonial-slider">
                <div class="testimonial">
                    <p>"QuizLoco has revolutionized the way I study. The variety of subjects and quiz types keeps me
                        engaged and motivated!"</p>
                    - Sarah K., Student
                </div>
                <div class="testimonial">
                    <p>"As a teacher, I love using QuizLoco to create interactive quizzes for my students. It's so easy
                        to use!"</p>
                    - Mr. Johnson, High School Teacher
                </div>
                <div class="testimonial">
                    <p>"The multiplayer challenges are addictive! I've made new friends while improving my
                        knowledge."</p>
                    - Alex M., Quiz Enthusiast
                </div>
            </div>
        </div>
    </section>

    <section id="mobile-app" class="mobile-app">
        <div class="container">
            <h2>Take QuizLoco Anywhere</h2>
            <p>Download our mobile app and learn on the go!</p>
            <div class="app-buttons">
                <a href="#" class="app-button">
                    <img src="${pageContext.request.contextPath}/img/appstore.jpg"
                         alt="Download on the App Store">
                </a>
                <a href="#" class="app-button">
                    <img src="${pageContext.request.contextPath}/img/ggplay.jpg" alt="Get it on Google Play">
                </a>
            </div>
            <div class="app-preview">
                <img src="${pageContext.request.contextPath}/img/app-preview.jpg" alt="QuizLoco Mobile App">
            </div>
        </div>
    </section>

    <section id="cta" class="cta">
        <div class="container">
            <h2>Ready to Boost Your Knowledge?</h2>
            <p>Join millions of learners and quiz enthusiasts on QuizLoco today!</p>
            <a href="jsp/register.jsp" class="cta-button">Sign Up Now</a>
        </div>
    </section>
</main>

<footer id="contact">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#subjects">Subjects</a></li>
                    <li><a href="#leaderboard">Leaderboard</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: support@quizloco.com</p>
                <p>Phone: (123) 456-7890</p>
            </div>
            <div class="footer-section">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <p class="copyright">&copy; 2024 QuizLoco. All rights reserved.</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>