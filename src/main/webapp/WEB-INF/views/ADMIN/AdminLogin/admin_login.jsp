<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #1e1e1e, #2c3e50);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-container {
            background-color: white;
            color: #333;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        .form-control {
            border: 1px solid #ddd;
            color: #333;
        }
        .form-control:focus {
            border-color: #e91e63;
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.25);
        }
        .btn-danger {
            background-color: #e91e63;
            border-color: #e91e63;
        }
        .btn-danger:hover {
            background-color: #c2185b;
            border-color: #c2185b;
        }
        label {
            color: #333;
            font-weight: 500;
        }
        .text-warning {
            color: #e91e63 !important;
        }
        .text-warning:hover {
            color: #c2185b !important;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center mb-4" style="color: #e91e63;">Admin Login</h2>
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
            <p class="text-center mt-3" style="color: #666;">Don't have an account? <a href="/admin/register" class="text-warning">Register here</a></p>
            <p class="text-danger">${error}</p>
        </form>
        <a href="/" class="btn btn-secondary btn-block mt-3">Back to Role Selection</a>
    </div>
</body>
</html>
