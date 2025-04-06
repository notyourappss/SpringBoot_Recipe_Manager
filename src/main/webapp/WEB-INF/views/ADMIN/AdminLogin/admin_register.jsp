<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #000; color: white; display: flex; justify-content: center; align-items: center; height: 100vh;">
<div class="container" style="max-width: 400px; background-color: #333; padding: 30px; border-radius: 15px;">
    <h2 class="text-center text-warning">Admin Register</h2>
    <form method="post" action="/admin/register">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required class="form-control"/>
        </div>
        <button type="submit" class="btn btn-warning btn-block">Register</button>
        <p class="text-center mt-3">Already have an account? <a href="/admin/login" class="text-danger">Login here</a></p>
    </form>
</div>
</body>
</html>
