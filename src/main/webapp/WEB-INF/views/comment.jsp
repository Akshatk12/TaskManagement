<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>

<body style="background-color: #fffaf0;">
<div class="vertical"></div>
	<jsp:include page="/WEB-INF/views/navbar.jsp" />
	
			<%
		if (request.getParameter("success") != null) {
	%>
	<div class="alert alert-success alert-dismissible fade show"
		role="alert"
				style="position:absolute;margin-left:50%;margin-top: 1rem;left: 46rem; width: max-content; margin-inline: auto;">

		<%=request.getParameter("success")%>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<%
		if (request.getParameter("error") != null) {
	%>
	<div class="alert alert-danger alert-dismissible fade show"
		role="alert"
				style="position:absolute;margin-left:50%;margin-top: 1rem;left: 46rem; width: max-content; margin-inline: auto;">

		<%=request.getParameter("error")%>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<div class="row">
		<jsp:include page="/WEB-INF/views/sidenav.jsp" />

	
	<form:form action="addcomment" method="post" modelAttribute="commentDto"
		style="margin-left: 44rem;margin-top: 4rem;padding: 1rem 5rem;width: 25rem; padding-bottom: 2rem;background-color: white;
    border-radius: 15px;border: 1px solid lightgray;">

		<fieldset>
			<legend class="text-center header">Add Comment</legend>
			<br><div style="padding: 1rem;background-color: gainsboro;border-radius: 10px;">
			<c:forEach items="${comments}" var="comment">
				<span class="text-primary">${comment.username}</span> : ${comment.comment}<br>
			</c:forEach>
			</div><br>
			<form:hidden path="taskId" value='<%= request.getParameter("id")%>' />
			<div class="form-group">
				<label for="exampleInputEmail1">Comment</label>
				<form:input required="required" path="comment" class="form-control" />
			</div>
			<button type="submit" name="submit" class="btn btn-primary">Add Comment</button>
		</fieldset>
	</form:form>
	<br>
</div>
</body>
</html>