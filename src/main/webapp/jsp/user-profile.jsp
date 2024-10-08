<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.User, model.UserDAO" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Base64" %>

<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
        return;
    }

    // Create an instance of UserDAO
    UserDAO userDAO = new UserDAO();

    // Fetch user details from the database using username
    User user = null;
    try {
        user = userDAO.getUserByUsername(username);
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (user == null) {
        // Handle the case where user is not found
        out.println("<p>User not found.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - QuizLoco</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
    <link rel="stylesheet" href="../css/profile.css">
</head>

<body>
<header>
    <div class="container">
        <h1><a href="${pageContext.request.contextPath}/index.jsp" class="logo">QuizLoco</a></h1>

        <div class="auth-links">
            <a href="logout.jsp" class="btn-logout">Logout</a>
        </div>
    </div>
</header>

<main>
    <div class="profile-container">
        <div class="profile-header">
            <h1>User Profile</h1>
        </div>
        <div class="profile-content">
            <div class="profile-avatar">
                <%
                    byte[] avatarBytes = user.getAvatar();
                    if (avatarBytes != null && avatarBytes.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(avatarBytes);
                %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="User Avatar" class="avatar">
                <% } else { %>
                <img src="../img/avt.jpg" alt="Default Avatar" class="avatar">
                <% } %>
                <a href="upload-avatar.jsp" class="btn-avatar">Update Avatar</a>
            </div>

            <div class="profile-actions">
                <a href="${pageContext.request.contextPath}/jsp/edit-profile.jsp" class="btn-edit">Edit Profile</a>
                <a href="${pageContext.request.contextPath}/jsp/change-password.jsp" class="btn-password">Change Password</a>
            </div>

            <div class="profile-details">
                <p><strong>Username:</strong> <%= user.getUsername() %></p>
                <p><strong>Full Name:</strong> <%= user.getFullName() %></p>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Gender:</strong> <%= user.getGender() %></p>
                <p><strong>Status:</strong> <%= user.getStatus() %></p>
                <p><strong>Created At:</strong> <%= user.getCreatedAt() %></p>
                <p><strong>Updated At:</strong> <%= user.getUpdatedAt() %></p>
            </div>
        </div>

        <div class="profile-actions">
            <a href="${pageContext.request.contextPath}/jsp/edit-profile.jsp" class="btn-edit">Edit Profile</a>
            <a href="${pageContext.request.contextPath}/jsp/change-password.jsp" class="btn-password">Change Password</a>
        </div>

        <div class="profile-activity">
            <h2>Recent Activity</h2>
            <!-- You can add logic here to display recent activity of the user -->
            <ul>
                <li>Attempted "Math Quiz" on <%= new Timestamp(System.currentTimeMillis()) %></li>
                <li>Scored 85% on "Science Quiz" on <%= new Timestamp(System.currentTimeMillis() - 86400000) %></li>
                <li>Created "History Quiz" on <%= new Timestamp(System.currentTimeMillis() - 172800000) %></li>
            </ul>
        </div>
    </div>
</main>

<footer>
    <div class="container">
        <p>&copy; 2024 QuizLoco. All rights reserved.</p>
    </div>
</footer>

<script src="../js/script.js"></script>
</body>
</html>
