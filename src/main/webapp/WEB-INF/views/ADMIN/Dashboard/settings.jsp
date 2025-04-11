<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Settings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            background-color: #000;
            background-image: url('https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
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
            display: flex;
            flex-direction: column;
            position: relative;
            z-index: 2;
            backdrop-filter: blur(10px);
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
            position: relative;
            z-index: 2;
        }
        .feedback-card {
            background-color: #2d2d2d;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            border-left: 4px solid #e91e63;
        }
        .feedback-user {
            color: #e91e63;
            font-weight: bold;
        }
        .form-control {
            background-color: #2d2d2d;
            border: 1px solid #444;
            color: white;
        }
        .form-control:focus {
            background-color: #2d2d2d;
            color: white;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="sidebar-menu">
        <a href="/admin/dashboard">Home</a>
        <a href="/admin/add-recipe">Add Recipes</a>
        <a href="/admin/manage-users">Manage Users</a>
        <a href="/admin/settings" class="active">Settings</a>
    </div>
    <a href="/admin/logout" class="logout">Logout</a>
</div>
<div class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="card bg-dark text-white mb-4">
                <div class="card-header">
                    <h4>Update Admin Profile</h4>
                </div>
                <div class="card-body">
                    <form action="/admin/update-profile" method="post">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" value="${admin.username}" required>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Leave blank to keep current password">
                        </div>
                        <button type="submit" class="btn btn-warning">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h3>User Feedback</h3>
            <c:forEach items="${feedbacks}" var="feedback">
                <div class="feedback-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="feedback-user">${feedback.user.username}</div>
                        <a href="/admin/delete-feedback/${feedback.id}" class="btn btn-danger btn-sm">Delete</a>
                    </div>
                    <div class="feedback-message">${feedback.message}</div>
                    <small class="text-muted">${feedback.createdAt}</small>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
