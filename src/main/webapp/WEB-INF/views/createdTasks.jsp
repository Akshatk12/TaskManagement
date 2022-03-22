<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Created Task</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
.changeAssigneeBtn, .addCommentBtn, .deleteTaskBtn{
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

		<div class="container  mt-5" style="width: 70%;margin-left: 26rem;">
			<table class="table table-striped" border="1">
				<h2>Created Tasks</h2>
				
				<thead class="thead-dark">
					<tr>
						<th>Title</th>
						<th>Priority</th>
						<th>Status</th>
						<th>Assigned To</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listCreatedTasks}" var="ctask">

						<tr>
							<td>${ctask.title}</td>
							<td>${ctask.priority}</td>
							<td>${ctask.status}</td>
							<c:set var="assignee" value="${ctask.assignee.username}" />
							<c:if test="${empty assignee}">
							<td><h5><span class="badge badge-secondary">Unassigned</span></h5></td>
							</c:if>
							<c:if test="${not empty assignee}">
							<td><c:out value="${assignee}" /></td>
							</c:if>							
							<td><a href="/taskapp/tasks/changeAssignee?id=${ctask.id}" class="changeAssigneeBtn" id="changeAssignee-${ctask.id}">Change Assignee</a></td>
							<td><a href="/taskapp/comment/addcomment?id=${ctask.id}" class="addCommentBtn" id="addComment-${ctask.id}">Add comment</a></td>
							
							<c:if test="${empty assignee}">
							<td><a href="/taskapp/tasks/deleteTask?id=${ctask.id}" onclick="return deleteTask(event);" class="deleteTaskBtn" id="deleteTask-${ctask.id}">Delete Task</a></td>
							</c:if>
							<c:if test="${not empty assignee}">
							<td><a class="deleteTaskBtn" id="deleteTask-${ctask.id}">Delete Task</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
</body>
<script type="text/javascript">
deleteTask = function(event) {
  
	if(window.confirm("Are you sure you want to delete this post?")){
		return true;	
	}
	else return false;
}
</script>
</html>