<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
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
            background: rgba(0, 0, 0, 0.7);
            z-index: 1;
        }

        .container {
            background-color: rgba(51, 51, 51, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
            max-width: 400px;
            position: relative;
            z-index: 2;
            animation: fadeIn 1s ease-out;
        }

        .form-control {
            background-color: rgba(68, 68, 68, 0.8);
            border: 1px solid #555;
            color: #fff;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: rgba(68, 68, 68, 0.9);
            border-color: #ffc107;
            box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
            color: #fff;
            transform: translateY(-2px);
        }

        .btn-yellow {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
            transition: all 0.3s ease;
        }

        .btn-yellow:hover {
            background-color: #e0a800;
            border-color: #e0a800;
            color: #000;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .text-yellow {
            color: #ffc107 !important;
            transition: all 0.3s ease;
        }

        .text-yellow:hover {
            color: #e0a800 !important;
            text-decoration: none;
            transform: translateX(5px);
        }

        label {
            color: #fff;
            font-weight: 500;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .btn-secondary {
            background-color: rgba(108, 117, 125, 0.8);
            border-color: rgba(108, 117, 125, 0.8);
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: rgba(108, 117, 125, 1);
            border-color: rgba(108, 117, 125, 1);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
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
        <a href="/choose-role" class="btn btn-secondary btn-block mt-3">Back to Role Selection</a>
    </div>
</body>
</html>
