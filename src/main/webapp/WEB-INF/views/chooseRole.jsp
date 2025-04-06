<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose Role</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            color: white;
            text-align: center;
            padding-top: 100px;
            font-family: Arial, sans-serif;
        }
        .btn-custom {
            width: 200px;
            padding: 15px;
            font-size: 18px;
            margin: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <h1>Select Role</h1>
    <a href="/admin/login" class="btn btn-Danger btn-custom">Admin</a>
    <a href="/user/login" class="btn btn-success btn-custom">User</a>
</body>
</html>
