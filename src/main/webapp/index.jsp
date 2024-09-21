<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="entity.Blog" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Lessons" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Session handling with null checks
    session = request.getSession(false);
    String username = (session != null && session.getAttribute("username") != null) ? (String) session.getAttribute("username") : null;

    // Simulate fetching blogs, subjects, and lessons from the server
    List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
    List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
    List<Lessons> lessons = (List<Lessons>) request.getAttribute("lessons");

    if (blogs == null) {
        blogs = new ArrayList<>();
    }
    if (subjects == null) {
        subjects = new ArrayList<>();
    }
    if (lessons == null) {
        lessons = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Practice</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .navbar {
            background-color: #e8f5e9;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar input {
            padding: 10px;
            border-radius: 25px;
            border: 1px solid #ccc;
            width: 300px;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .navbar .menu {
            display: flex;
            gap: 15px;
        }

        .navbar .menu a {
            text-decoration: none;
            color: #388e3c;
            font-weight: bold;
            padding: 10px;
            border-radius: 20px;
        }

        .navbar .menu a:hover {
            background-color: #c8e6c9;
        }

        .container {
            display: flex;
            padding: 20px;
        }

        .side-menu {
            width: 220px;
            background-color: #333;
            color: #fff;
            padding: 20px;
            height: 100vh;
            border-radius: 10px;
        }

        .side-menu h2 {
            color: #fff;
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        .side-menu ul {
            list-style-type: none;
            padding: 0;
        }

        .side-menu ul li {
            background-color: #444;
            margin: 15px 0;
            padding: 15px;
            text-align: center;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .side-menu ul li:hover {
            background-color: #555;
        }

        .side-menu ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1em;
        }

        .content {
            flex-grow: 1;
            padding: 30px;
        }

        .header {
            background-color: #444;
            color: #fff;
            padding: 20px;
            text-align: center;
            position: relative;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .header .welcome-message {
            font-size: 1.2em;
            font-weight: bold;
            color: #ffeb3b;
        }

        .header .logout {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .header .logout a {
            background-color: #d32f2f;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            text-decoration: none;
        }

        .header .logout a:hover {
            background-color: #b71c1c;
        }

        .header .login-button,
        .header .register-button {
            position: absolute;
            top: 20px;
            background-color: #388e3c;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            text-decoration: none;
        }

        .header .login-button {
            right: 20px;
        }

        .header .register-button {
            right: 120px;
        }

        .header .login-button:hover,
        .header .register-button:hover {
            background-color: #2e7d32;
        }

        h1 {
            font-size: 2em;
            margin: 0;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        .card img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card h3 {
            margin: 10px 0;
            font-size: 1.5em;
            color: #333;
        }

        .card p {
            color: #666;
            font-size: 1em;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination span {
            cursor: pointer;
            padding: 8px 12px;
            background-color: #555;
            color: #fff;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .pagination span:hover {
            background-color: #777;
        }

        .pagination span.active {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
<!-- Navigation bar with search -->
<div class="navbar">
    <input type="text" id="search-input" placeholder="Search here..." oninput="searchItems()">
    <div class="menu">
        <a href="#">Community</a>
        <a href="#">Resources</a>
        <a href="#">Pricing</a>
        <a href="#">Contact</a>
    </div>
</div>

<div class="container">
    <!-- Sidebar Menu -->
    <div class="side-menu">
        <h2>Menu</h2>
        <ul>
            <li><a href="#" onclick="showContent('blog')">Blog List</a></li>
            <li><a href="#" onclick="showContent('subject')">Subject List</a></li>
            <li><a href="#" onclick="showContent('lesson')">Lesson List</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">
            <% if (username != null) { %>
            <div class="logout">
                <span class="welcome-message">Welcome, <%= username %>!</span>
                <a href="logout.jsp">Logout</a>
            </div>
            <% } else { %>
            <a href="login.jsp" class="login-button">Login</a>
            <a href="register.jsp" class="register-button">Register</a>
            <% } %>
            <h1>Quiz Practice</h1>
        </div>

        <!-- Blog/Subject/Lesson Content -->
        <div id="blog-content">
            <h2>Blog List</h2>
            <div class="cards" id="blog-list">
                <% if (blogs != null && !blogs.isEmpty()) { %>
                <% for (Blog blog : blogs) { %>
                <div class="card">
                    <img src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(blog.getAvatar())) %>" alt="<%= blog.getTitle() %>">
                    <h3><%= blog.getTitle() %></h3>
                    <p><%= blog.getContent() %></p>
                </div>
                <% } %>
                <% } else { %>
                <p>No blogs available.</p>
                <% } %>
            </div>
            <div class="pagination" id="blog-pagination"></div>
        </div>

        <div id="subject-content" style="display: none;">
            <h2>Subject List</h2>
            <div class="cards" id="subject-list">
                <% if (subjects != null && !subjects.isEmpty()) { %>
                <% for (Subject subject : subjects) { %>
                <div class="card">
                    <img src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(subject.getAvatar())) %>" alt="<%= subject.getTitle() %>">
                    <h3><%= subject.getTitle() %></h3>
                    <p><%= subject.getDescription() %></p>
                </div>
                <% } %>
                <% } else { %>
                <p>No subjects available.</p>
                <% } %>
            </div>
            <div class="pagination" id="subject-pagination"></div>
        </div>

        <div id="lesson-content" style="display: none;"> <!-- Lesson content -->
            <h2>Lesson List</h2>
            <div class="cards" id="lesson-list">
                <% if (lessons != null && !lessons.isEmpty()) { %>
                <% for (Lessons lesson : lessons) { %>
                <div class="card">
                    <img src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(lesson.getAvatar())) %>" alt="<%= lesson.getTitle() %>">
                    <h3><%= lesson.getTitle() %></h3>
                    <p><%= lesson.getContent() %></p>
                </div>
                <% } %>
                <% } else { %>
                <p>No lessons available.</p>
                <% } %>
            </div>
            <div class="pagination" id="lesson-pagination"></div>
        </div>
    </div>
</div>

<script>
    // Convert server-side blogs, subjects, and lessons to JavaScript arrays
    let blogs = [];
    <% for (Blog blog : blogs) { %>
    blogs.push({
        title: "<%= blog.getTitle() %>",
        description: "<%= blog.getContent() %>",
        image: "data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(blog.getAvatar())) %>"
    });
    <% } %>

    let subjects = [];
    <% for (Subject subject : subjects) { %>
    subjects.push({
        title: "<%= subject.getTitle() %>",
        description: "<%= subject.getDescription() %>",
        image: "data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(subject.getAvatar())) %>"
    });
    <% } %>

    let lessons = [];
    <% for (Lessons lesson : lessons) { %>
    lessons.push({
        title: "<%= lesson.getTitle() %>",
        description: "<%= lesson.getContent() %>",
        image: "data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(lesson.getAvatar())) %>"
    });
    <% } %>

    let itemsPerPage = 4;
    let currentItems = blogs; // Default to blogs
    let activeContainer = 'blog-list'; // Default to blog list
    let activePagination = 'blog-pagination';

    function paginate(items, containerId, paginationId) {
        const container = document.getElementById(containerId);
        const pagination = document.getElementById(paginationId);
        let currentPage = 1;

        function renderPage(page) {
            container.innerHTML = ""; // Clear previous items
            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const pageItems = items.slice(start, end);

            pageItems.forEach(item => {
                const card = document.createElement("div");
                card.className = "card";
                card.innerHTML = `<img src="${item.image}" alt="${item.title}">
                                  <h3>${item.title}</h3>
                                  <p>${item.description}</p>`;
                container.appendChild(card);
            });

            renderPagination(page);
        }

        function renderPagination(page) {
            pagination.innerHTML = "";
            const totalPages = Math.ceil(items.length / itemsPerPage);

            for (let i = 1; i <= totalPages; i++) {
                const span = document.createElement("span");
                span.textContent = i;
                span.className = i === page ? "active" : "";
                span.addEventListener("click", () => renderPage(i));
                pagination.appendChild(span);
            }
        }

        renderPage(currentPage);
    }

    function showContent(type) {
        if (type === 'blog') {
            currentItems = blogs;
            activeContainer = 'blog-list';
            activePagination = 'blog-pagination';
        } else if (type === 'subject') {
            currentItems = subjects;
            activeContainer = 'subject-list';
            activePagination = 'subject-pagination';
        } else if (type === 'lesson') {
            currentItems = lessons;
            activeContainer = 'lesson-list';
            activePagination = 'lesson-pagination';
        }

        document.getElementById('blog-content').style.display = type === 'blog' ? 'block' : 'none';
        document.getElementById('subject-content').style.display = type === 'subject' ? 'block' : 'none';
        document.getElementById('lesson-content').style.display = type === 'lesson' ? 'block' : 'none';

        paginate(currentItems, activeContainer, activePagination);
    }

    function searchItems() {
        const query = document.getElementById('search-input').value.toLowerCase();
        const filteredItems = currentItems.filter(item => item.title.toLowerCase().includes(query));
        paginate(filteredItems, activeContainer, activePagination);
    }

    // Initialize the pagination with blogs as default
    paginate(blogs, "blog-list", "blog-pagination");
</script>
</body>
</html>
