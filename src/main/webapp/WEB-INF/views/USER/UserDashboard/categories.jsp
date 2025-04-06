<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-4">
    <ul class="nav nav-tabs justify-content-center">

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == null ? 'active' : ''}" href="/user/dashboard">All</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'veg' ? 'active' : ''}" href="/user/category?type=veg">Veg</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'nonveg' ? 'active' : ''}" href="/user/category?type=nonveg">Non-Veg</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'deserts' ? 'active' : ''}" href="/user/category?type=deserts">Deserts</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'south indian' ? 'active' : ''}" href="/user/category?type=south indian">South Indian</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'italian' ? 'active' : ''}" href="/user/category?type=italian">Italian</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${selectedCategory == 'chinese' ? 'active' : ''}" href="/user/category?type=chinese">Chinese</a>
        </li>

    </ul>
</div>
