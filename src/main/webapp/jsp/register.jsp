<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="../css/register.css">
  <script>
    window.onload = function() {
      const error = document.getElementById('error-message').value;
      if (error) {
        alert(error);
      }
    }
  </script>
</head>
<body>
<div class="register-container">
  <h2>Register</h2>
  <form action="register" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password_hash" placeholder="Password" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="text" name="full_name" placeholder="Full Name">
    <select name="gender" required>
      <option value="" disabled selected>Gender</option>
      <option value="Male">Male</option>
      <option value="Female">Female</option>
      <option value="Other">Other</option>
    </select>
    <select name="role_id" required>
      <option value="" disabled selected>Role</option>
      <option value="1">User</option>
      <option value="2">Teacher</option>
    </select>
    <input type="submit" value="Register">
    <input type="hidden" id="error-message" value="${error}">
  </form>
</div>
</body>
</html>
