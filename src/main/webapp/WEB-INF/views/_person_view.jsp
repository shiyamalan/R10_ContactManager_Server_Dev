<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>

<link rel="stylesheet" href="resources/css/theme.css" type="text/css" />
</head>
<body>

	<%@include file="./common/header/header.html"%>

	<div id="heading" class="w3-center">
		<h1>Person Contact Information</h1>
		<br></br> <br />
	</div>
	<div >
		<c:if test="${!empty listPersons}">
			<table class = "w3-table w3-striped ">
			<thead>
				<tr>
					<th width="80">Person ID</th>
					<th width="80">First Name</th>
					<th width="80">Last Name</th>
					<th width="80">Country</th>
					<th width="80">Mobile No</th>
					<th width="60">Edit</th>
					<th width="60">Delete</th>
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
						<td><a href="<c:url value='/remove/${person.id}' />">Delete</a></td>
					</tr>
				</tbody>
			</c:forEach>


			</table>
		</c:if>
	</div>
	<div id="footer">

		<footer>
			<%@include file="./common/footer/footer.html"%>>
		</footer>
	</div>
</body>
</html>
