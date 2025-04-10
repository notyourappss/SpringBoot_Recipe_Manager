<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | Recipe Manager</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #1e1e1e, #2c3e50);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            max-width: 600px;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #ffffff;
        }

        p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #cccccc;
        }

        .get-started-btn {
            padding: 15px 40px;
            font-size: 18px;
            color: #ffffff;
            background-color: #e91e63;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .get-started-btn:hover {
            background-color: #c2185b;
            transform: scale(1.05);
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 36px;
            }

            p {
                font-size: 16px;
            }

            .get-started-btn {
                padding: 12px 30px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Recipe Manager</h1>
        <p>Your personalized hub to create, explore, and manage delicious recipes!</p>
        <a href="/choose-role" class="get-started-btn">Get Started</a>
    </div>
</body>
</html>