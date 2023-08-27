<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.mashape.unirest.http.HttpResponse, com.mashape.unirest.http.JsonNode, com.mashape.unirest.http.Unirest, org.json.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Course</title>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
input {
	max-width: 450px;
}
</style>
<body>


	<%
	String courseId = request.getParameter("cid");
	String courseName = request.getParameter("name");
	String courseDuration = request.getParameter("duration");
	String courseFees = request.getParameter("fees");

	request.setAttribute("id", courseId);
	request.setAttribute("name", courseName);
	request.setAttribute("duration", courseDuration);
	request.setAttribute("fees", courseFees);
	%>
	<div class="container mt-5">
		<h1>Update Course</h1>

		<form action="updatecourse" method="post">
			<div class="form-group">
				<label for="id">Course ID:</label> <input type="text"
					class="form-control" id="id" name="id"
					value="<%=request.getParameter("id")%>" readonly>
			</div>
			<div class="form-group">
				<label for="name">Course Name:</label> <input type="text"
					class="form-control" id="name" name="name"
					value="<%=request.getAttribute("name")%>" required>
			</div>
			<div class="form-group">
				<label for="duration">Duration:</label> <input type="text"
					class="form-control" id="duration" name="duration"
					value="<%=request.getAttribute("duration")%>" required>
			</div>
			<div class="form-group">
				<label for="fees">Fees:</label> <input type="number"
					class="form-control" id="fees" name="fees"
					value="<%=request.getAttribute("fees")%>" required>
			</div>

			<button type="submit" class="btn btn-primary">Update Course</button>
			<a href="index.jsp" class="btn btn-secondary ml-2">Cancel</a>
		</form>
	</div>
</body>
</html>
