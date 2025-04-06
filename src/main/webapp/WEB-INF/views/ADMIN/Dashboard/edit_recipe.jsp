<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Recipe</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            background-color: #000;
            color: white;
        }
        .sidebar {
            width: 250px;
            background: #222;
            padding: 20px;
            height: 100vh;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #e91e63;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="/admin/dashboard">Home</a>
    <a href="/admin/add-recipe">Add Recipes</a>
    <a href="/admin/manage-users">Manage Users</a>
    <a href="/admin/settings">Settings</a>
</div>
<div class="content">
    <h2>Edit Recipe</h2>
    <form action="/admin/update-recipe/${recipe.id}" method="post" enctype="multipart/form-data">
        <input type="text" name="name" value="${recipe.name}" class="form-control mb-2" required>
        <textarea name="ingredients" class="form-control mb-2" required>${recipe.ingredients}</textarea>
        <textarea name="instructions" class="form-control mb-2" required>${recipe.instructions}</textarea>

        <select name="category" class="form-control mb-2" required>
            <option value="">-- Select Category --</option>
            <option value="veg" ${recipe.category == 'veg' ? 'selected' : ''}>Veg</option>
            <option value="nonveg" ${recipe.category == 'nonveg' ? 'selected' : ''}>Non-Veg</option>
            <option value="desserts" ${recipe.category == 'desserts' ? 'selected' : ''}>Desserts</option>
            <option value="south indian" ${recipe.category == 'south indian' ? 'selected' : ''}>South Indian</option>
            <option value="italian" ${recipe.category == 'italian' ? 'selected' : ''}>Italian</option>
            <option value="chinese" ${recipe.category == 'chinese' ? 'selected' : ''}>Chinese</option>
        </select>

        <button type="submit" class="btn btn-warning">Update Recipe</button>
    </form>
</div>
</body>
</html>
