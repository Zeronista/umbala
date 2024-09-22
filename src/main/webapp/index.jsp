<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="entity.Blog" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Lessons" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    session = request.getSession(false);
    String username = (session != null && session.getAttribute("username") != null) ? (String) session.getAttribute("username") : null;

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
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>
<%@ include file="fragments/navbar.jsp" %>

<div class="container">
    <div class="content">
        <%@ include file="fragments/header.jsp" %>

        <div id="blog-content">
            <h2>Blog List</h2>
            <div class="cards" id="blog-list"></div>
            <div class="pagination" id="blog-pagination"></div>
        </div>

        <div id="subject-content" style="display: none;">
            <h2>Subject List</h2>
            <div class="cards"></div>
        </div>

        <div id="lesson-content" style="display: none;">
            <h2>Lesson List</h2>
            <div class="cards"></div>
        </div>
    </div>

    <%@ include file="fragments/side-menu.jsp" %>
</div>
</body>
</html>