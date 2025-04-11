<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Register</title>
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
            background-image: url('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
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

        .register-container {
            background-color: rgba(51, 51, 51, 0.9);
            color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
            width: 100%;
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
            border-color: #e91e63;
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.25);
            color: #fff;
            transform: translateY(-2px);
        }

        .btn-warning {
            background-color: #e91e63;
            border-color: #e91e63;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-warning:hover {
            background-color: #c2185b;
            border-color: #c2185b;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        label {
            color: #fff;
            font-weight: 500;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        .text-danger {
            color: #e91e63 !important;
            transition: all 0.3s ease;
        }

        .text-danger:hover {
            color: #c2185b !important;
            text-decoration: none;
            transform: translateX(5px);
        }

        .password-requirements {
            font-size: 12px;
            color: #ccc;
            margin-top: 5px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        .requirement {
            color: #dc3545;
            transition: all 0.3s ease;
        }

        .requirement.valid {
            color: #28a745;
            transform: translateX(5px);
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

        h2 {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
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
        <a href="/choose-role" class="btn btn-secondary btn-block mt-3">Back to Role Selection</a>
    </div>
</body>
</html>
