<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .register-container {
      width: 300px;
      margin: 100px auto;
      padding: 20px;
      background-color: #fff;
      border: 1px solid #ddd;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .register-container h2 {
      margin: 0 0 20px;
      text-align: center;
      color: #333;
    }

    .register-container input[type="text"],
    .register-container input[type="password"],
    .register-container input[type="email"],
    .register-container input[type="number"],
    .register-container select {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ddd;
      box-sizing: border-box;
    }

    .register-container input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #333;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .register-container input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
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