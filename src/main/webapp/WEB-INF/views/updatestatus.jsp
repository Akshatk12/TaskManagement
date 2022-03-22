<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Status</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body style="background-color: #fffaf0;">
<div class="vertical"></div>
	<jsp:include page="/WEB-INF/views/navbar.jsp" />
	
	<div class="row">
		<jsp:include page="/WEB-INF/views/sidenav.jsp" />

	
	<form:form action="updateStatus" method="post" modelAttribute="updateStatusDto"
		style="margin-left: 44rem;margin-top: 4rem;padding: 1rem 5rem;width: 25rem; padding-bottom: 2rem;background-color: white;
    border-radius: 15px;border: 1px solid lightgray;">

		<fieldset>
			<legend class="text-center header">Update Status</legend>
			<form:hidden path="id" value='<%= request.getParameter("id")%>' />
			<div class="form-group">
				<label for="exampleInputEmail1">Status</label>
				<form:select path="status" class="form-control">
					<form:option value="In Progress" class="form-control">In Progress</form:option>
					<form:option value="Done" class="form-control">Done</form:option>
				</form:select>
			</div>
			<button type="submit" name="submit" class="btn btn-primary">Save</button>
		</fieldset>
	</form:form>
</div>
</body>
</html>