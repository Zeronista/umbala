<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Verify Code</title>
	<meta name="viewport" content="initial-scale=1, width=device-width">

	<!-- Use absolute paths for CSS and fonts -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/verify.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />

	<style>
		/* Existing styles */
		.error-message {
			color: red;
			font-size: 14px;
			position: absolute;
			top: 10px;
			right: 10px;
			background-color: #f8d7da;
			border-color: #f5c6cb;
			padding: 10px;
			border-radius: 5px;
		}
	</style>
</head>
<body>
<div class="qun-mt-khu">
	<!-- Use absolute path in form action -->
	<form action="${pageContext.request.contextPath}/verify" method="post" class="form-log-in">
		<%
			String error = (String) session.getAttribute("error");
			if (error != null) {
		%>
		<div class="error-message">
			<%= error %>
		</div>
		<%
				session.removeAttribute("error");  // Clear error after displaying it
			}
		%>
		<div class="input-field">
			<div class="label">Xin mời nhập mã xác nhận đã gửi qua email</div>
			<input class="input" type="text" name="capcha" placeholder="Nhập mã xác nhận" required>
		</div>
		<div class="button-group">
			<button type="submit" class="button">Gửi</button>
		</div>
	</form>
</div>
</body>
</html>
