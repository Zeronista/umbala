<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Use absolute path with context -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="<%= request.getContextPath() %>/login" method="post"> <!-- Form submits to LoginServlet -->
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
        <!-- Forgot Password Link -->
        <div class="forgot-password">
            <a href="forgot-password.jsp">Forgot Password?</a>
        </div>
    </form>

    <% if (request.getAttribute("error") != null) { %>
    <div class="error-message">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>
</div>
</body>
</html>
