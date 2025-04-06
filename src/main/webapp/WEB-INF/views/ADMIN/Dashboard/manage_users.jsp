<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Users</title>
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
        .table th, .table td {
            color: white;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="/admin/dashboard">Home</a>
    <a href="/admin/add-recipe">Add Recipes</a>
    <a href="/admin/manage-users" class="active">Manage Users</a>
    <a href="/admin/settings">Settings</a>
</div>

<div class="content">
    <h2>Registered Users</h2>
    <table class="table table-dark table-hover mt-4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <a href="/admin/delete-user/${user.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
