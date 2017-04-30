<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

body {
	background-color: white;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Add a Person</h1>

	<c:url var="addAction" value="/person/add"></c:url>

	<div>
		<form:form action="${addAction}" commandName="person">
			<table>
				<%-- 	<c:if test="${!empty person.name}">
					<tr>
						<td><form:label path="id">
								<spring:message text="ID" />
							</form:label></td>
						<td><form:input path="id" readonly="true" size="8"
								disabled="true" /> <form:hidden path="id" /></td>
					</tr>
				</c:if>
				<tr>
					<td><form:label path="name">
							<spring:message text="Name" />
						</form:label></td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td><form:label path="country">
							<spring:message text="Country" />
						</form:label></td>
					<td><form:input path="country" /></td>
				</tr>
				<tr>
					<td colspan="2"><c:if test="${!empty person.name}">
							<input type="submit" value="<spring:message text="Edit Person"/>" />
						</c:if> <c:if test="${empty person.name}">
							<input type="submit" value="<spring:message text="Add Person"/>" />
						</c:if></td>
				</tr> --%>

			</table>
			<form:label path="name">First Name</form:label>
			<input type="text" id="fname" name="firstname"
				placeholder="Person first name..">

			<form:label path="name">Last Name</form:label>
			<input type="text" id="lname" name="lastname"
				placeholder="Person last name..">

			<<form:label path="country">Country</form:label>
			<select id="country" name="country">
				<option value="australia">Australia</option>
				<option value="canada">Canada</option>
				<option value="usa">USA</option>
			</select>

			<c:if test="${!empty person.name}">
				<input type="submit" value="<spring:message text="Edit Person"/>" />
			</c:if>
			<c:if test="${empty person.name}">
				<input type="submit" value="<spring:message text="Add Person"/>" />
			</c:if>
		</form:form>
	</div>

</body>
</html>