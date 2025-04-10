package com.example.recipe_management.controller;

import com.example.recipe_management.entity.*;
import com.example.recipe_management.service.*;
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

    @Autowired
    private UserService userService;

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/dashboard")
    public String showUserDashboard(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }
        List<Recipe> recipes = recipeService.getAllRecipes();
        List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
        model.addAttribute("recipes", recipes);
        model.addAttribute("feedbacks", feedbacks);
        return "USER/UserDashboard/user_dashboard";
    }

    @GetMapping("/category")
    public String filterByCategory(@RequestParam("type") String category, Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }
        List<Recipe> recipes = recipeService.getRecipesByCategory(category);
        List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
        model.addAttribute("recipes", recipes);
        model.addAttribute("feedbacks", feedbacks);
        model.addAttribute("selectedCategory", category);
        return "USER/UserDashboard/user_dashboard";
    }

    @GetMapping("/profile")
    public String showProfile(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "USER/UserDashboard/profile";
    }

    @PostMapping("/update-profile")
    public String updateProfile(@RequestParam String username,
                                @RequestParam(required = false) String password,
                                HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }

        User user = (User) session.getAttribute("user");
        user.setUsername(username);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }
        userService.register(user);
        session.setAttribute("user", user);
        return "redirect:/user/profile";
    }

    @PostMapping("/send-feedback")
    public String sendFeedback(@RequestParam String feedback, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/user/login";
        }

        User user = (User) session.getAttribute("user");
        Feedback feedbackObj = new Feedback();
        feedbackObj.setUser(user);
        feedbackObj.setMessage(feedback);
        feedbackService.saveFeedback(feedbackObj);

        return "redirect:/user/profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login";
    }
}
