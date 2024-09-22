<%-- 
    Document   : view-lessons
    Created on : Sep 21, 2024, 7:30:44 PM
    Author     : hient
--%>

<%@page import="java.util.List"%>
<%@ page import="entity.Lessons" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lesson List</title>
</head>
<body>
    <h1>Lesson List</h1>
    <ul>
        <% 
            List<Lessons> lessons = (List<Lessons>) request.getAttribute("lessons");
            if (lessons != null && !lessons.isEmpty()) {
                for (Lessons lesson : lessons) {
        %>
            <li>
                <h2><%= lesson.getTitle() %></h2>
                <p><%= lesson.getContent() %></p>
            </li>
        <% 
                }
            } else { 
        %>
            <p>No lessons available.</p>
        <% } %>
    </ul>
</body>
</html>

