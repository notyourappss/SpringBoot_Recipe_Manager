<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            background-image: url('https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
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
        .navbar {
            background-color: rgba(34, 34, 34, 0.9);
            position: relative;
            z-index: 2;
            backdrop-filter: blur(10px);
        }
        .container {
            position: relative;
            z-index: 2;
        }
        .navbar-brand, .nav-link, .btn {
            color: #fff !important;
        }
        .card {
            background-color: #1e1e1e;
            color: #fff;
            border: 1px solid #444;
            margin-bottom: 20px;
        }
        .form-control {
            background-color: #2d2d2d;
            border: 1px solid #444;
            color: #fff;
        }
        .form-control:focus {
            background-color: #2d2d2d;
            color: #fff;
        }
        .feedback-card {
            background-color: #2d2d2d;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
        }
        .btn-yellow {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }
        .btn-yellow:hover {
            background-color: #e0a800;
            border-color: #e0a800;
            color: #000;
        }
        .text-yellow {
            color: #ffc107;
        }
        .nav-link.active {
            background-color: #ffc107;
            color: #000;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RecipeManager</a>
    <div class="navbar-nav mr-auto">
        <a class="nav-link" href="/user/dashboard">Home</a>
        <a class="nav-link" href="/user/favorites">Favorites</a>
        <a class="nav-link active" href="/user/profile">Profile</a>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <a href="/user/logout" class="btn btn-yellow">Logout</a>
    </form>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-yellow">Update Profile</h4>
                </div>
                <div class="card-body">
                    <form action="/user/update-profile" method="post">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" value="${user.username}" required>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Leave blank to keep current password">
                        </div>
                        <button type="submit" class="btn btn-yellow">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-yellow">Send Feedback</h4>
                </div>
                <div class="card-body">
                    <form action="/user/send-feedback" method="post">
                        <div class="form-group">
                            <label>Your Feedback</label>
                            <textarea class="form-control" name="feedback" rows="4" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-yellow">Send Feedback</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>