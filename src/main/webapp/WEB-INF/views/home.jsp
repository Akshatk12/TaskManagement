<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
.updateStatusBtn, .addCommentBtn{
text-decoration: revert;
color:blue;
}
</style>
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
	
		<div class="col-8 container mt-5" style="margin-left: 26rem;width: 70%;">
			<h2>Assigned Tasks</h2>
			<table class="table table-striped" border="1">
				<thead class="thead-dark">
					<tr>
						<th>Title</th>
						<th>Priority</th>
						<th>Status</th>
						<th>Assigned By</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listAssignedTasks}" var="atask">

						<tr>
							<td>${atask.title}</td>
							<td>${atask.priority}</td>
							<td>${atask.status}</td>
								<td>${atask.owner.username}</td>
							<td><a href="/taskapp/tasks/updateStatus?id=${atask.id}" class="updateStatusBtn" ">Update Status</a></td>
							<td><a href="/taskapp/comment/addcomment?id=${atask.id}" class="addCommentBtn" ">Add comment</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<jsp:include page="/WEB-INF/views/bottom.jsp" />
		</div>
		</div>
		
</body>
<script>

</script>
</html>