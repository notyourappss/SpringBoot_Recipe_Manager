<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            color: #fff;
        }
        .navbar {
            background-color: #222;
        }
        .navbar-brand, .nav-link, .btn {
            color: #fff !important;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .card {
            background-color: #1e1e1e;
            color: #fff;
            border: 1px solid #444;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RecipeManager</a>
    <div class="navbar-nav mr-auto">
        <a class="nav-link" href="/user/dashboard">Home</a>
        <a class="nav-link" href="/user/favorites">Favourites</a>
        <a class="nav-link" href="/user/profile">Profile</a>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <a href="/logout" class="btn btn-danger">Logout</a>
    </form>
</nav>
<jsp:include page="categories.jsp" />
<div class="container mt-4">
    <h3>
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
            <div class="col-md-4">
                <div class="card p-3">
                    <div class="card-body">
                        <h5 class="card-title">${recipe.name}</h5>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Ingredients:</strong> ${recipe.ingredients}</p>
                        <p><strong>Instructions:</strong> ${recipe.instructions}</p>
                        <form action="/user/addToFavorites/${recipe.id}" method="post">
                            <button type="submit" class="btn btn-success btn-sm">Add to Favourites</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
