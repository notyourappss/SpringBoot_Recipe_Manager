<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Favourites</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            background-image: url('https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
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
        .navbar {
            background-color: rgba(34, 34, 34, 0.9);
            position: relative;
            z-index: 2;
            backdrop-filter: blur(10px);
        }
        .container {
            position: relative;
            z-index: 2;
        }
        .navbar-brand, .nav-link, .btn { color: #fff; }
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
        .card { background-color: #1e1e1e; color: #fff; border: 1px solid #444; margin-bottom: 20px; }
        .nav-link.active {
            background-color: #ffc107;
            color: #000;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RecipeManager</a>
    <div class="navbar-nav mr-auto">
        <a class="nav-link" href="/user/dashboard">Home</a>
        <a class="nav-link active" href="/user/favorites">Favorites</a>
        <a class="nav-link" href="/user/profile">Profile</a>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <a href="/user/logout" class="btn btn-danger">Logout</a>
    </form>
</nav>

<div class="container mt-4">
    <h3>My Favorites</h3>

    <div class="row">
        <c:forEach items="${favorites}" var="recipe">
            <div class="col-md-4">
                <div class="card p-3">
                    <div class="card-body">
                        <h5 class="card-title">${recipe.name}</h5>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Ingredients:</strong> ${recipe.ingredients}</p>
                        <p><strong>Instructions:</strong> ${recipe.instructions}</p>
                        <form action="/user/removeFavorite/${recipe.id}" method="post" onsubmit="return confirm('Are you sure you want to remove this recipe from favorites?')">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-yellow btn-sm mt-2">Remove from Favorites</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
