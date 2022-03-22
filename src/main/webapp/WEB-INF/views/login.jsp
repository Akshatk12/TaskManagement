<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body style="height: 90vh; background-color: #fffaf0;">


	<%
		if (request.getParameter("success") != null) {
	%>
	<div class="alert alert-success alert-dismissible fade show" role="alert" 		style="position:absolute;margin-left:50%;margin-top: 1rem;left: 46rem; width: max-content; margin-inline: auto;">

		<%=request.getParameter("success")%>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
			<div class="alert alert-danger alert-dismissible fade show" role="alert" 		style="position:absolute;margin-left:50%;margin-top: 1rem;left: 46rem; width: max-content; margin-inline: auto;">

		<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"></c:out>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<c:remove var = "SPRING_SECURITY_LAST_EXCEPTION" scope = "session" />
		</c:if>
	
<div class="container">
<div class="row">
<div class="col-sm-6" style="margin-inline: auto; margin-top:8rem ">
<h1 style="color:red">Task Management System</h1>
<br>
<h6>Task Management System helps you to track status of tasks. </h6>

</div>
<div class="col-sm-6">
<form action='tasklogin' method='POST'
		style="margin-inline: auto; margin-top: 4rem; padding: 1rem 5rem; width: 25rem; padding-bottom: 2rem; background-color: white; border-radius: 15px;">
		
		<fieldset>
			<legend class="text-center header">Login</legend>
			<div class="form-group">
				<label for="exampleInputEmail1">Username</label> <input type="text" required="required"
					class="form-control" name='uname' id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" required="required" name='upass' class="form-control"
					id="exampleInputPassword1">
			</div>
			<button type="submit" name="submit" class="btn btn-primary">Login</button>
			
		</fieldset>

	</form>
</div>
</div>
</div>
</body>
</html>