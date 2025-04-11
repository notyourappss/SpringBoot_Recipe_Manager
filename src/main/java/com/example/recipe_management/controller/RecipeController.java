package com.example.recipe_management.controller;

import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/dashboard")
    public String viewRecipes(Model model) {
        List<Recipe> recipes = recipeService.getAllRecipes();
        model.addAttribute("recipes", recipes);
        return "ADMIN/Dashboard/admin_dashboard";
    }

    @GetMapping("/add-recipe")
    public String showAddRecipeForm() {
        return "ADMIN/Dashboard/add_recipe";
    }

    @PostMapping("/add-recipe")
    public String addRecipe(@ModelAttribute Recipe recipe) {
        recipeService.saveRecipe(recipe);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/edit-recipe/{id}")
    public String showEditRecipeForm(@PathVariable Long id, Model model) {
        Optional<Recipe> recipe = recipeService.getRecipeById(id);
        if (recipe.isPresent()) {
            model.addAttribute("recipe", recipe.get());
            return "ADMIN/Dashboard/edit_recipe";
        }
        return "redirect:/admin/dashboard";
    }

    @PostMapping("/update-recipe/{id}")
    public String updateRecipe(@PathVariable Long id,
                               @ModelAttribute Recipe recipe) {
        recipeService.updateRecipe(id, recipe);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/delete-recipe/{id}")
    public String deleteRecipe(@PathVariable Long id) {
        recipeService.deleteRecipe(id);
        return "redirect:/admin/dashboard";
    }
}
