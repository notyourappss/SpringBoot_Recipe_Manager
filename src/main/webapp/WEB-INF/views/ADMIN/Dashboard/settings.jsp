<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Settings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            background-color: #000;
            color: white;
        }
        .sidebar {
            width: 250px;
            background: #222;
            padding: 20px;
            height: 100vh;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #e91e63;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .logout-btn {
            background-color: #e91e63;
            color: white;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="/admin/dashboard">Home</a>
    <a href="/admin/add-recipe">Add Recipes</a>
    <a href="/admin/manage-users">Manage Users</a>
    <a href="/admin/settings" class="active">Settings</a>
</div>
<div class="content">
    <h2>Settings</h2>
    <hr>

    <h4>Change Your Details</h4>
    <form method="post" action="/admin/update-details">
        <input type="hidden" name="id" value="${admin.id}">
        <div class="form-group">
            <label>Email</label>
            <input type="text" name="username" class="form-control" value="${admin.username}">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" value="${admin.password}">
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>

    <hr>
    <h4>User Feedback</h4>
    <c:forEach var="review" items="${reviews}">
        <div class="card bg-dark text-white my-2 p-2">
            <p><strong>${review.username}</strong>: ${review.message}</p>
        </div>
    </c:forEach>

    <hr>
    <form action="/admin/logout" method="post">
        <button class="btn logout-btn mt-3">Logout</button>
    </form>
</div>
</body>
</html>
