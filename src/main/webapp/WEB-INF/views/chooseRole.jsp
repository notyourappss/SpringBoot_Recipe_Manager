<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose Role</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #000;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            text-align: center;
        }
        h1 {
            margin-bottom: 40px;
        }
        .btn-custom {
            width: 200px;
            padding: 15px;
            font-size: 18px;
            margin: 20px;
            border-radius: 10px;
        }
        .btn-warning {
            color: #fff !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Select Role</h1>
        <a href="/admin/login" class="btn btn-Danger btn-custom">Admin</a>
        <a href="/user/login" class="btn btn-warning btn-custom">User</a>
    </div>
</body>
</html>
