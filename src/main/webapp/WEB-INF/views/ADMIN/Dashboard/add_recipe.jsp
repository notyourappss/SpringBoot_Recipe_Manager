<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Recipe</title>
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
        <a href="/admin/add-recipe" class="active">Add Recipes</a>
        <a href="/admin/manage-users">Manage Users</a>
        <a href="/admin/settings">Settings</a>
    </div>
    <div class="content">
        <h2>Add Recipe</h2>
        <form action="/admin/add-recipe" method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Recipe Name" class="form-control mb-2" required>
            <textarea name="ingredients" placeholder="Ingredients" class="form-control mb-2" required></textarea>
            <textarea name="instructions" placeholder="Instructions" class="form-control mb-2" required></textarea>
            <select name="category" class="form-control mb-3" required>
                <option value="">Select Category</option>
                <option value="veg">Veg</option>
                <option value="nonveg">Non-Veg</option>
                <option value="deserts">Deserts</option>
                <option value="south indian">South Indian</option>
                <option value="italian">Italian</option>
                <option value="chinese">Chinese</option>
            </select>

            <button type="submit" class="btn btn-danger">Add Recipe</button>
        </form>
    </div>
</body>
</html>
