<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        .navbar-brand, .nav-link, .btn {
            color: #fff !important;
        }
        .btn-yellow {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }
        .btn-yellow:hover {
            background-color: #e0a800;
            border-color: #e0a800;
            color: black;
        }
        .card {
            background-color: #1e1e1e;
            color: #fff;
            border: 1px solid #444;
            margin-bottom: 20px;
        }
        .reviews-section {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #444;
        }
        .btn-added {
            background-color: #6c757d;
            cursor: default;
        }
        .nav-link.active {
            background-color: #ffc107;
            color: #000;
        }
        .profile-section {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .username-display {
            color: #ffc107;
            font-weight: 500;
            margin-right: 15px;
            font-size: 1.1rem;
        }
    </style>
    <script>
        function checkFavoriteStatus(recipeId) {
            $.get("/user/isFavorited/" + recipeId, function(isFavorited) {
                if (isFavorited) {
                    $("#fav-btn-" + recipeId)
                        .removeClass("btn-yellow")
                        .addClass("btn-added")
                        .prop("disabled", true)
                        .text("Added to Favorites");
                }
            });
        }

        function handleFavorite(recipeId, form) {
            event.preventDefault();
            $.post(form.action, {
                "${_csrf.parameterName}": "${_csrf.token}"
            }, function() {
                $("#fav-btn-" + recipeId)
                    .removeClass("btn-yellow")
                    .addClass("btn-added")
                    .prop("disabled", true)
                    .text("Added to Favorites");
            });
        }
    </script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RecipeManager</a>
    <div class="navbar-nav mr-auto">
        <a class="nav-link active" href="/user/dashboard">Home</a>
        <a class="nav-link" href="/user/favorites">Favorites</a>
        <a class="nav-link" href="/user/profile">Profile</a>
    </div>
    <div class="profile-section">
        <span class="username-display">Welcome, ${user.username}</span>
        <a href="/user/logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<jsp:include page="categories.jsp" />

<div class="container mt-4">
    <h3 class="text-yellow">
        <c:choose>
            <c:when test="${not empty selectedCategory}">
                Recipes - ${selectedCategory}
            </c:when>
            <c:otherwise>
                All Recipes
            </c:otherwise>
        </c:choose>
    </h3>

    <div class="row">
        <c:forEach items="${recipes}" var="recipe">
            <div class="col-md-6">
                <div class="card p-3">
                    <div class="card-body">
                        <h5 class="card-title">${recipe.name}</h5>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Ingredients:</strong> ${recipe.ingredients}</p>
                        <p><strong>Instructions:</strong> ${recipe.instructions}</p>
                        <form action="/user/addToFavorites/${recipe.id}" method="post" onsubmit="handleFavorite(${recipe.id}, this)">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button id="fav-btn-${recipe.id}" type="submit" class="btn btn-yellow btn-sm">
                                Add to Favorites
                            </button>
                        </form>
                        <script>
                            checkFavoriteStatus(${recipe.id});
                        </script>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="reviews-section">
        <h3 class="text-yellow">Recent Reviews</h3>
        <div class="row">
            <c:forEach items="${feedbacks}" var="feedback">
                <div class="col-md-6">
                    <div class="card p-3">
                        <div class="card-body">
                            <h5 class="card-title">${feedback.user.username}</h5>
                            <p class="card-text">${feedback.message}</p>
                            <small class="text-muted">${feedback.createdAt}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
