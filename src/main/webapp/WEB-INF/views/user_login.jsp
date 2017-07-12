<%@include file="/common/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/theme.css">
</head>
<body>
	<div
		class="w3-bar w3-blue-grey w3-border w3-padding w3-border w3-round">
		<a href="#" class="w3-bar-item w3-button w3-mobile">Contact
			Manager</a>
	</div>

	<div class="pen-title">
		<h1>Login Here</h1>
	</div>
	<!-- Form Module-->
	<div class="module form-module ">
		<div class="toggle">
			<!-- <i class="fa fa-times fa-pencil"></i>
			<div class="tooltip"></div> -->
		</div>
		<div class="form">
			<h2>Login to your account</h2>
			<font color="red" class="w3-centered">${message}</font>
			<form:form modelAttribute="user" action="login" method="post">
				<input type="text" placeholder="Username" name="userName" />
				<input type="password" placeholder="Password" name="password" />
				<button>Login</button>
			</form:form>
		</div>

		<div class="cta">
			<a href="https://www.linkedin.com/in/srishiyamalan/">Forgot your
				password?</a>
		</div>
	</div>
	<br /></br>
	<div id="footer">
		<footer> <%@include file="./common/footer/footer.html"%>
		</footer>
	</div>
	<script src="resources/scripts/js/login.js"></script>
</body>

</html>