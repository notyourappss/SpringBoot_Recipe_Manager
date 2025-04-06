package com.example.recipe_management.service;

import com.example.recipe_management.entity.Recipe;

import java.util.List;
import java.util.Optional;

public interface RecipeService {
    List<Recipe> getAllRecipes();
    Optional<Recipe> getRecipeById(Long id);
    List<Recipe> getRecipesByCategory(String category);
    void saveRecipe(Recipe recipe);
    void updateRecipe(Long id, Recipe updatedRecipe);
    void deleteRecipe(Long id);
}
