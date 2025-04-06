package com.example.recipe_management.controller;

import com.example.recipe_management.entity.User;
import com.example.recipe_management.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class SettingsController {

    @Autowired
    private UserRepository userRepository;

    // Display Settings Page
    @GetMapping("/settings")
    public String settings(Model model, HttpSession session) {
        User admin = (User) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/login";
        }
        model.addAttribute("admin", admin);

        // Load all feedbacks from users (assuming message field is review/feedback)
        List<User> reviews = userRepository.findAll(); // You can filter only feedback users if needed
        model.addAttribute("reviews", reviews);
        return "admin/settings";
    }

    // Update admin email and password
    @PostMapping("/update-details")
    public String updateDetails(@ModelAttribute User updatedAdmin, HttpSession session) {
        User admin = (User) session.getAttribute("admin");
        if (admin != null) {
            admin.setUsername(updatedAdmin.getUsername());
            admin.setPassword(updatedAdmin.getPassword());
            userRepository.save(admin);
            session.setAttribute("admin", admin); // update session info
        }
        return "redirect:/admin/settings";
    }

    // Logout
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
