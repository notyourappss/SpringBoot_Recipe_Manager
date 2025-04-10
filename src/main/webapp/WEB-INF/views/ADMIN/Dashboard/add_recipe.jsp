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
            display: flex;
            flex-direction: column;
        }
        .sidebar-menu {
            flex-grow: 1;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: all 0.3s ease;
            width: 100%;
            text-align: left;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #e91e63;
            color: white;
            transform: translateX(5px);
        }
        .sidebar a.logout {
            background-color: #dc3545;
            margin-top: auto;
        }
        .sidebar a.logout:hover {
            background-color: #c82333;
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
        <div class="sidebar-menu">
            <a href="/admin/dashboard">Home</a>
            <a href="/admin/add-recipe" class="active">Add Recipes</a>
            <a href="/admin/manage-users">Manage Users</a>
            <a href="/admin/settings">Settings</a>
        </div>
        <a href="/admin/logout" class="logout">Logout</a>
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
                <option value="deserts">Desert</option>
                <option value="south indian">South Indian</option>
                <option value="italian">Italian</option>
                <option value="chinese">Chinese</option>
            </select>

            <button type="submit" class="btn btn-danger">Add Recipe</button>
        </form>
    </div>
</body>
</html>
