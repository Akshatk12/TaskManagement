<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>

<body style="background-color: #fffaf0;">
<div class="vertical"></div>
<jsp:include page="/WEB-INF/views/navbar.jsp" />

	<div class="row">
		<jsp:include page="/WEB-INF/views/sidenav.jsp" />

	<form:form action="adduser" method="post" modelAttribute="userDto"
		style="margin-left: 44rem;margin-top: 4rem;padding: 1rem 5rem;width: 25rem; padding-bottom: 2rem;background-color: white;
    border-radius: 15px;border: 1px solid lightgray;">

		<fieldset>
			<legend class="text-center header">Register User</legend>
			<div class="form-group">
				<label for="exampleInputEmail1">Username</label>
				<form:input required="required" path="username" class="form-control" />
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Password</label>
				<form:password required="required" path="password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Profile</label>
				<form:select path="profile" class="form-control">
					<form:option value="ROLE_Assignee" class="form-control">Assignee</form:option>
					<form:option value="ROLE_MGR" class="form-control">MANAGER</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email</label>
				<form:input path="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required="required"
				 class="form-control" oninvalid="this.setCustomValidity('Invalid Email Address')" onchange="this.setCustomValidity('')" />
				
			</div>
			<button type="submit" name="submit" class="btn btn-primary">Register</button>
			
		</fieldset>
	</form:form>
	</div>
	<br>
</body>
</html>