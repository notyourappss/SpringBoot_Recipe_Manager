package com.example.recipe_management.controller;

import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserDashboardController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/dashboard")
    public String showUserDashboard(Model model) {
        List<Recipe> recipes = recipeService.getAllRecipes();
        model.addAttribute("recipes", recipes);
        return "USER/UserDashboard/user_dashboard";
    }

    @GetMapping("/category")
    public String filterByCategory(@RequestParam("type") String category, Model model) {
        List<Recipe> recipes = recipeService.getRecipesByCategory(category);
        model.addAttribute("recipes", recipes);
        model.addAttribute("selectedCategory", category);
        return "USER/UserDashboard/user_dashboard";
    }
}
