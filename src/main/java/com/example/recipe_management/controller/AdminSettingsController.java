package com.example.recipe_management.controller;

import com.example.recipe_management.entity.User;
import com.example.recipe_management.service.FeedbackService;
import com.example.recipe_management.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminSettingsController {

    @Autowired
    private UserService userService;

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/settings")
    public String showSettings(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/admin/login";
        }

        User admin = (User) session.getAttribute("user");
        model.addAttribute("admin", admin);
        model.addAttribute("feedbacks", feedbackService.getAllFeedbacks());
        return "ADMIN/Dashboard/settings";
    }

    @PostMapping("/update-profile")
    public String updateProfile(@RequestParam String username,
                                @RequestParam(required = false) String password,
                                HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/admin/login";
        }

        User admin = (User) session.getAttribute("user");
        admin.setUsername(username);
        if (password != null && !password.isEmpty()) {
            admin.setPassword(password);
        }
        userService.register(admin);
        session.setAttribute("user", admin);
        return "redirect:/admin/settings";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    @GetMapping("/delete-feedback/{id}")
    public String deleteFeedback(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/admin/login";
        }

        feedbackService.deleteFeedback(id);
        return "redirect:/admin/settings";
    }
}