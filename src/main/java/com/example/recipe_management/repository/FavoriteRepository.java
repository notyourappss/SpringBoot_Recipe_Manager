package com.example.recipe_management.repository;

import com.example.recipe_management.entity.Favorite;
import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    List<Favorite> findByUser(User user);
    void deleteByUserAndRecipe(User user, Recipe recipe);
    boolean existsByUserAndRecipe(User user, Recipe recipe);
}
