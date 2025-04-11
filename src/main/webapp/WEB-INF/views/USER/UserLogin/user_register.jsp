<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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
        .btn-yellow {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }
        .btn-yellow:hover {
            background-color: #e0a800;
            border-color: #e0a800;
            color: #000;
        }
        .text-yellow {
            color: #ffc107 !important;
        }
        .text-yellow:hover {
            color: #e0a800 !important;
            text-decoration: none;
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
<body style="background-color: #000; color: white; display: flex; justify-content: center; align-items: center; height: 100vh;">
<div class="container" style="max-width: 400px; background-color: #333; padding: 30px; border-radius: 15px;">
    <h2 class="text-center text-yellow">User Register</h2>
    <form method="post" action="/user/register" onsubmit="return validateForm()">
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
        <button type="submit" class="btn btn-yellow btn-block">Register</button>
        <p class="text-center mt-3">Already have an account? <a href="/user/login" class="text-yellow">Login here</a></p>
    </form>
</div>
</body>
</html>
