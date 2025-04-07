//package com.example.recipe_management.controller;
//
//import com.example.recipe_management.entity.Favorite;
//import com.example.recipe_management.entity.Recipe;
//import com.example.recipe_management.entity.User;
//import com.example.recipe_management.service.FavoriteService;
//import com.example.recipe_management.service.RecipeService;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//        import java.util.List;
//import java.util.stream.Collectors;
//
//@Controller
//@RequestMapping("/user")
//public class FavoriteController {
//
//    @Autowired
//    private FavoriteService favoriteService;
//
//    @Autowired
//    private RecipeService recipeService;
//
//    // Add to favorites
//    @PostMapping("/addToFavorites/{recipeId}")
//    public String addToFavorites(@PathVariable Long recipeId, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        Recipe recipe = recipeService.getRecipeById(recipeId).orElse(null);
//
//        if (user != null && recipe != null) {
//            favoriteService.addToFavorites(user, recipe);
//        }
//
//        return "redirect:/user/dashboard";
//    }
//
//    // Show all favorites
//    @GetMapping("/favorites")
//    public String showFavorites(@RequestParam(required = false) String category, Model model, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        List<Favorite> favorites = favoriteService.getFavoritesByUser(user);
//
//        List<Recipe> favoriteRecipes = favorites.stream()
//                .map(Favorite::getRecipe)
//                .collect(Collectors.toList());
//
//        if (category != null && !category.isEmpty()) {
//            favoriteRecipes = favoriteRecipes.stream()
//                    .filter(r -> r.getCategory().equalsIgnoreCase(category))
//                    .collect(Collectors.toList());
//            model.addAttribute("selectedCategory", category);
//        }
//
//        model.addAttribute("favorites", favoriteRecipes);
//        return "USER/UserDashboard/favorites"; // JSP page to show favorites
//    }
//
//    // Remove from favorites
//    @GetMapping("/removeFavorite/{recipeId}")
//    public String removeFromFavorites(@PathVariable Long recipeId, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        Recipe recipe = recipeService.getRecipeById(recipeId).orElse(null);
//
//        if (user != null && recipe != null) {
//            favoriteService.removeFromFavorites(user, recipe);
//        }
//
//        return "redirect:/user/favorites";
//    }
//}
package com.example.recipe_management.controller;

import com.example.recipe_management.entity.Favorite;
import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.entity.User;
import com.example.recipe_management.service.FavoriteService;
import com.example.recipe_management.service.RecipeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class FavoriteController {

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private RecipeService recipeService;

    // Add to favorites
    @PostMapping("/addToFavorites/{recipeId}")
    public String addToFavorites(@PathVariable Long recipeId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        Recipe recipe = recipeService.getRecipeById(recipeId).orElse(null);
        if (recipe != null) {
            favoriteService.addToFavorites(user, recipe);
        }
        return "redirect:/user/dashboard";
    }

    // Show all favorites
    @GetMapping("/favorites")
    public String showFavorites(@RequestParam(required = false) String category, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        List<Favorite> favorites = favoriteService.getFavoritesByUser(user);
        List<Recipe> favoriteRecipes = favorites.stream()
                .map(Favorite::getRecipe)
                .collect(Collectors.toList());

        if (category != null && !category.isEmpty()) {
            favoriteRecipes = favoriteRecipes.stream()
                    .filter(r -> r.getCategory().equalsIgnoreCase(category))
                    .collect(Collectors.toList());
            model.addAttribute("selectedCategory", category);
        }

        model.addAttribute("favorites", favoriteRecipes);
        return "USER/UserDashboard/favorites"; // JSP page to show favorites
    }

    // Remove from favorites
    @GetMapping("/removeFavorite/{recipeId}")
    public String removeFromFavorites(@PathVariable Long recipeId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        Recipe recipe = recipeService.getRecipeById(recipeId).orElse(null);
        if (recipe != null) {
            favoriteService.removeFromFavorites(user, recipe);
        }
        return "redirect:/user/favorites";
    }
}
