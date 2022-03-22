<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Task</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

		<div class="container  mt-5" style="width: 70%;margin-left: 26rem;">
			<table class="table table-striped" border="1">
				<h2>All Tasks</h2>
				
				<thead class="thead-dark">
					<tr>
						<th>Title</th>
						<th>Priority</th>
						<th>Status</th>
						<th>Assigned To</th>
						<th>Assigned By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listTasks}" var="task">

						<tr>
							<td>${task.title}</td>
							<td>${task.priority}</td>
							<td>${task.status}</td>
							<td>${task.assignee.username}</td>
							
							<c:set var="assignedBy" value="${task.owner.username}" />
							<c:if test="${empty assignedBy}">
							<td><h5><span class="badge badge-secondary">Unassigned</span></h5></td>
							</c:if>
							<c:if test="${not empty assignedBy}">
							<td><c:out value="${assignedBy}" /></td>
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
    console.log(event.target.href);
	if(window.confirm("Are you sure you want to delete this post?")){
		return true;	
	}
	else return false;
}
</script>
</html>