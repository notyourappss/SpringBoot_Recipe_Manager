<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WEB-INF/views/common/styles.css">
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            background-color: #000;
            background-image: url('https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1;
        }
        .sidebar {
            width: 250px;
            background: rgba(34, 34, 34, 0.9);
            padding: 20px;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            backdrop-filter: blur(10px);
            z-index: 2;
        }
        .sidebar h2 {
            color: white;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .sidebar-menu {
            flex-grow: 1;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: all 0.3s ease;
            width: 100%;
            text-align: left;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #e91e63;
            color: white;
            transform: translateX(5px);
        }
        .sidebar a.logout {
            background-color: #dc3545;
            margin-top: auto;
        }
        .sidebar a.logout:hover {
            background-color: #c82333;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
            margin-left: 250px;
            overflow-y: auto;
            background-color: transparent;
            position: relative;
            z-index: 2;
        }
        .content h2{
            color: white;
        }
        .card {
            background-color: #333;
            color: #fff;
            border: 1px solid #444;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .btn-container {
            margin-top: 10px;
        }
        .btn-container a {
            display: inline-block;
            margin-right: 5px;
        }
        .btn-warning, .btn-danger {
            padding: 5px 15px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="sidebar-menu">
        <a href="/admin/dashboard" class="active">Home</a>
        <a href="/admin/add-recipe">Add Recipes</a>
        <a href="/admin/manage-users">Manage Users</a>
        <a href="/admin/settings">Settings</a>
    </div>
    <a href="/admin/logout" class="logout">Logout</a>
</div>
<div class="content">
    <h2>Recipe List</h2>
    <div class="row">
        <c:forEach items="${recipes}" var="recipe">
            <div class="col-md-6">
                <div class="card p-3">
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
