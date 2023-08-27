
<%@ page import="com.mashape.unirest.http.HttpResponse, com.mashape.unirest.http.JsonNode, com.mashape.unirest.http.Unirest, org.json.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
       
        input{
            max-width: 450px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Add Course</h1>
        
        <form action="createc" method="post">
            <div class="form-group">
                <label for="id">Course ID:</label>
                <input type="number" class="form-control" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="name">Course Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="duration">Duration:</label>
                <input type="text" class="form-control" id="duration" name="duration" required>
            </div>
            <div class="form-group">
                <label for="fees">Fees:</label>
                <input type="number" class="form-control" id="fees" name="fees" required>
            </div>
            <!-- Add more input fields as needed -->
            <button type="submit" class="btn btn-primary">Add Course</button>
            <a href="index.jsp" class="btn btn-secondary ml-2">Cancel</a>
        </form>
    </div>
    <!-- Include Bootstrap JS (if needed) -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</body>
</html>
