<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .register-container {
            background-color: #333;
            color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        .form-control {
            background-color: #444;
            border: 1px solid #555;
            color: #fff;
        }
        .form-control:focus {
            background-color: #444;
            border-color: #e91e63;
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.25);
            color: #fff;
        }
        .btn-warning {
            background-color: #e91e63;
            border-color: #e91e63;
            color: white;
        }
        .btn-warning:hover {
            background-color: #c2185b;
            border-color: #c2185b;
            color: white;
        }
        label {
            color: #fff;
            font-weight: 500;
        }
        .text-danger {
            color: #e91e63 !important;
        }
        .text-danger:hover {
            color: #c2185b !important;
            text-decoration: none;
        }
        .password-requirements {
            font-size: 12px;
            color: #ccc;
            margin-top: 5px;
        }
        .requirement {
            color: #dc3545;
        }
        .requirement.valid {
            color: #28a745;
        }
    </style>
    <script>
        function validatePassword() {
            const password = document.getElementById('password').value;
            const requirements = {
                length: password.length >= 8,
                uppercase: /[A-Z]/.test(password),
                lowercase: /[a-z]/.test(password),
                number: /[0-9]/.test(password),
                special: /[!@#$%^&*(),.?":{}|<>]/.test(password)
            };

            Object.keys(requirements).forEach(key => {
                const element = document.getElementById(key);
                if (requirements[key]) {
                    element.classList.add('valid');
                } else {
                    element.classList.remove('valid');
                }
            });

            return Object.values(requirements).every(Boolean);
        }

        function validateForm() {
            const username = document.getElementById('username').value;
            if (username.length < 3) {
                alert('Username must be at least 3 characters long');
                return false;
            }
            return validatePassword();
        }
    </script>
</head>
<body>
    <div class="register-container">
        <h2 class="text-center mb-4" style="color: #e91e63;">Admin Register</h2>
        <form method="post" action="/admin/register" onsubmit="return validateForm()">
            <div class="form-group">
                <label>Username</label>
                <input type="text" id="username" name="username" required class="form-control" minlength="3"/>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" id="password" name="password" required class="form-control" onkeyup="validatePassword()"/>
                <div class="password-requirements">
                    <div id="length" class="requirement">• At least 8 characters long</div>
                    <div id="uppercase" class="requirement">• At least 1 uppercase letter</div>
                    <div id="lowercase" class="requirement">• At least 1 lowercase letter</div>
                    <div id="number" class="requirement">• At least 1 number</div>
                    <div id="special" class="requirement">• At least 1 special character</div>
                </div>
            </div>
            <button type="submit" class="btn btn-warning btn-block">Register</button>
            <p class="text-center mt-3" style="color: #ccc;">Already have an account? <a href="/admin/login" class="text-danger">Login here</a></p>
        </form>
        <a href="/" class="btn btn-secondary btn-block mt-3">Back to Role Selection</a>
    </div>
</body>
</html>
