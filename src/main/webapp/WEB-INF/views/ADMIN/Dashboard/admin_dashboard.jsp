<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
            margin: 0;
            background-color: #000;
            color: #fff;
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
        .card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            float: right;
            border-radius: 10px;
        }
        .btn-container {
            margin-top: 10px;
        }
        .btn-container a {
            display: block;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="/admin/dashboard" class="active">Home</a>
    <a href="/admin/add-recipe">Add Recipes</a>
    <a href="/admin/manage-users">Manage Users</a>
    <a href="/admin/settings">Settings</a>
</div>
<div class="content">
    <h2>Recipe List</h2>
    <div class="row">
        <c:forEach items="${recipes}" var="recipe">
            <div class="col-md-6">
                <div class="card p-3 bg-dark text-white mb-4">
                    <div class="card-body">
                        <h5 class="card-title">${recipe.name}</h5>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Ingredients:</strong> ${recipe.ingredients}</p>
                        <p><strong>Instructions:</strong> ${recipe.instructions}</p>
                        <div class="btn-container">
                            <a href="/admin/edit-recipe/${recipe.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="/admin/delete-recipe/${recipe.id}" class="btn btn-danger btn-sm">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
