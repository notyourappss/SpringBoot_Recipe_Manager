<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #000; color: white; display: flex; justify-content: center; align-items: center; height: 100vh;">
<div class="container" style="max-width: 400px; background-color: #333; padding: 30px; border-radius: 15px;">
    <h2 class="text-center text-danger">Admin Login</h2>
    <form method="post" action="/admin/login">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required class="form-control"/>
        </div>
        <button type="submit" class="btn btn-danger btn-block">Login</button>
        <p class="text-center mt-3">Don't have an account? <a href="/admin/register" class="text-warning">Register here</a></p>
        <p class="text-danger">${error}</p>
    </form>
</div>
</body>
</html>
