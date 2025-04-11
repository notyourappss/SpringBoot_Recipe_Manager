<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | Recipe Manager</title>
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
            background-image: url('https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1953&q=80');
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
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .container {
            text-align: center;
            max-width: 600px;
            position: relative;
            z-index: 2;
            animation: fadeIn 1.5s ease-out;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1.5s ease-out 0.3s backwards;
        }

        p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #ffffff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            animation: fadeIn 1.5s ease-out 0.6s backwards;
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
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-out 0.9s backwards, float 3s ease-in-out infinite;
        }

        .get-started-btn:hover {
            background-color: #c2185b;
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            animation: float 3s ease-in-out infinite;
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