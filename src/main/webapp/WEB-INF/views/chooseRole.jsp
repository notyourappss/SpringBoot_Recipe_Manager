<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose Role</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1953&q=80');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .container {
            text-align: center;
            position: relative;
            z-index: 2;
            animation: fadeIn 1.5s ease-out;
        }

        h1 {
            margin-bottom: 40px;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1.5s ease-out 0.3s backwards;
        }

        .btn-custom {
            width: 200px;
            padding: 15px;
            font-size: 18px;
            margin: 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
            animation: fadeIn 1.5s ease-out 0.6s backwards, float 3s ease-in-out infinite;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            animation: float 3s ease-in-out infinite;
        }

        .btn-Danger {
            background-color: #e91e63;
            border-color: #e91e63;
            color: #fff !important;
        }

        .btn-Danger:hover {
            background-color: #c2185b;
            border-color: #c2185b;
        }

        .btn-warning {
            background-color: #ff9800;
            border-color: #ff9800;
            color: #fff !important;
        }

        .btn-warning:hover {
            background-color: #f57c00;
            border-color: #f57c00;
        }

        @media (max-width: 600px) {
            .btn-custom {
                width: 160px;
                padding: 12px;
                font-size: 16px;
                margin: 15px;
            }
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
