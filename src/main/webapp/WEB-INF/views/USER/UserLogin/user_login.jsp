<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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
            color: #ffc107 !important;
        }
        .text-yellow:hover {
            color: #e0a800 !important;
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #000; color: white; display: flex; justify-content: center; align-items: center; height: 100vh;">
<div class="container" style="max-width: 400px; background-color: #333; padding: 30px; border-radius: 15px;">
    <h2 class="text-center text-yellow">User Login</h2>
    <form method="post" action="/user/login">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required class="form-control"/>
        </div>
        <button type="submit" class="btn btn-yellow btn-block">Login</button>
        <p class="text-center mt-3">Don't have an account? <a href="/user/register" class="text-yellow">Register here</a></p>
        <p class="text-danger">${error}</p>
    </form>
    <a href="/" class="btn btn-secondary btn-block mt-3">Back to Role Selection</a>
</div>
</body>
</html>
