<%@include file="/common/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
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
		<h2>Sign Up</h2>
	</div>

	<div class="module form-module ">
		<div class="toggle">
			<i class="fa fa-times fa-pencil"></i>
			<div class="tooltip">Sign up</div>
		</div>

		<div class="form">
			<h2>Please change your details</h2>
			<font color="red" class="w3-centered">${message}</font>
			<form:form modelAttribute="user" method="post" action="change">
			<!-- 	<input type="text" placeholder="Username" name="userName" disabled="true" /> -->
				<input type="password" placeholder="Password" name="password" />
				<input type="email" placeholder="Email Address" name="email" />
				<input type="tel" placeholder="Phone Number" name="phoneno" />
				<button>Register</button>
			</form:form>
		</div>
	</div>
	<div></div>
	<div id="footer">
		<br></br>
		<footer> <%@include file="./common/footer/footer.html"%>
		</footer>
	</div>
</body>
</html>