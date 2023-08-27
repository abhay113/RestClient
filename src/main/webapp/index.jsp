<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.mashape.unirest.http.HttpResponse, com.mashape.unirest.http.JsonNode, com.mashape.unirest.http.Unirest, org.json.JSONArray, org.json.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course List</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1 class="mt-5">Course List</h1>
		<div class="row">
			<%
			try {
				HttpResponse<JsonNode> res = Unirest.get("http://localhost:8085/courses").header("accept", "application/json")
				.asJson();

				JsonNode responseBody = res.getBody();
				JSONArray coursesArray = responseBody.getArray();

				for (int i = 0; i < coursesArray.length(); i++) {
					JSONObject course = coursesArray.getJSONObject(i);
			%>
			<div class="col-md-4 mt-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=course.getString("name")%></h5>
						<p class="card-text">
							Duration:
							<%=course.getString("duration")%></p>
						<p class="card-text">
							Fees:
							<%=course.getInt("fees")%></p>

						<a
							href="update.jsp?id=<%=course.getInt("cid")%>&name=<%=course.getString("name")%>&duration=<%=course.getString("duration")%>&fees=<%=course.getInt("fees")%>"
							class="btn btn-primary">Update</a> <a
							href="delete/<%=course.getInt("cid")%>"
							class="btn btn-danger ml-2">Delete</a>
					</div>
				</div>
			</div>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
		<a href="create.jsp" class="btn btn-success mt-4">Create New
			Course</a>
	</div>
</body>
</html>
