<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css"> <!-- Adjust path if necessary -->
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post"> <!-- Form submits to LoginServlet -->
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
