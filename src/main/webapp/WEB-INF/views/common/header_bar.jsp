<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/page-theme.css">
<link rel="stylesheet" href="../resources/css/navigation.css">
<link rel="stylesheet" href="../resources/css/theme.css">
<link rel="stylesheet" href="../resources/css/header_bar.css">
</head>
<body>

	<div
		class="w3-bar w3-blue-grey w3-border w3-padding w3-border w3-round">
		<a href="../person/list" class="w3-bar-item w3-button w3-mobile">Home</a>
		<div class="w3-dropdown-hover">
			<button class="w3-button">Contact</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="../person/new" class="w3-bar-item w3-button">Add New</a> <a
					href="#" class="w3-bar-item w3-button">Sync Profile(Linked In)</a>
				<a href="../person/orderby" class="w3-bar-item w3-button">Order
					By(Rank)</a>
			</div>
		</div>

		<div class="w3-dropdown-hover">
			<button class="w3-button">User</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="../user/profile" class="w3-bar-item w3-button">Update
					Profile</a> <a href="../user/changep" class="w3-bar-item w3-button">Change
					Password</a> <a href="../user/signout" class="w3-bar-item w3-button">Signout</a>
			</div>
		</div>
	</div>
	<!-- </div> -->
</body>
</html>