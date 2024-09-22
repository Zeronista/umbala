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
