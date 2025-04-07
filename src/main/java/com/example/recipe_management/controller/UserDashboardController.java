//package com.example.recipe_management.controller;
//
//import com.example.recipe_management.entity.Recipe;
//import com.example.recipe_management.service.RecipeService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@Controller
//@RequestMapping("/user")
//public class UserDashboardController {
//
//    @Autowired
//    private RecipeService recipeService;
//
//    @GetMapping("/dashboard")
//    public String showUserDashboard(Model model) {
//        List<Recipe> recipes = recipeService.getAllRecipes();
//        model.addAttribute("recipes", recipes);
//        return "USER/UserDashboard/user_dashboard";
//    }
//
//    @GetMapping("/category")
//    public String filterByCategory(@RequestParam("type") String category, Model model) {
//        List<Recipe> recipes = recipeService.getRecipesByCategory(category);
//        model.addAttribute("recipes", recipes);
//        model.addAttribute("selectedCategory", category);
//        return "USER/UserDashboard/user_dashboard";
//    }
//}
package com.example.recipe_management.controller;

import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.service.RecipeService;
import jakarta.servlet.http.HttpSession;
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
    public String showUserDashboard(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }
        List<Recipe> recipes = recipeService.getAllRecipes();
        model.addAttribute("recipes", recipes);
        return "USER/UserDashboard/user_dashboard";
    }

    @GetMapping("/category")
    public String filterByCategory(@RequestParam("type") String category, Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }
        List<Recipe> recipes = recipeService.getRecipesByCategory(category);
        model.addAttribute("recipes", recipes);
        model.addAttribute("selectedCategory", category);
        return "USER/UserDashboard/user_dashboard";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }
}
