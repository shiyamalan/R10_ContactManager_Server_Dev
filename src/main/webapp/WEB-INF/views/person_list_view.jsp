
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>All Contacts</title>

<link rel="stylesheet" href="../resources/css/theme.css" type="text/css" />
<link rel="stylesheet" href="../resources/css/navigation.css">
<link rel="stylesheet" href="../resources/css/demo.css">
<link rel="stylesheet" href="../resources/css/form-validation.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>
<body class="w3-grey-light">
	<div class="main-content">
		<%@include file="common/header_bar.jsp"%>
		<div id="heading" class="w3-center">
			<h1>Person's Contact Information</h1>
			<br></br> <br />
		</div>
		
		<div>
				<font color="w3-green" class = "w3-centered">${message}</font>
		</div>
		<div>
			<c:if test="${!empty listPersons}">
				<table class="w3-table w3-striped ">
					<thead>
						<tr>
							<th width="80">Person ID</th>
							<th width="80">First Name</th>
							<th width="80">Last Name</th>
							<th width="80">Country</th>
							<th width="80">Mobile No</th>
							<th width="60">Edit</th>
							<th width="60">Delete</th>
							<th width="60">View More</th>
						</tr>
					</thead>
					<c:forEach items="${listPersons}" var="person">
						<tbody>
							<tr>
								<td>${person.id}</td>
								<td>${person.firstName}</td>
								<td>${person.lastName}</td>
								<td>${person.country}</td>
								<td>${person.mobileNo}</td>
								<td><a href="<c:url value='/edit/${person.id}' />">Edit</a></td>
								<td><a href="<c:url value='/person/remove/${person.id}' />">Delete</a></td>
								<td><a href="<c:url value='/person/view/${person.id}' />">View3
								</a></td>
							</tr>
						</tbody>
					</c:forEach>


				</table>
			</c:if>
		</div>
	</div>
	<div id="footer">

		<footer>
			<%@include file="./common/footer/footer.html"%>
		</footer>
	</div>
</body>
</html>
