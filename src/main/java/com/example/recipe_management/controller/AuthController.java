package com.example.recipe_management.controller;

import com.example.recipe_management.entity.User;
import com.example.recipe_management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    // Landing page to choose role
    @GetMapping("/")
    public String frontPage() {
        return "front";
    }

    @GetMapping("/choose-role")
    public String chooseRolePage() {
        return "chooseRole";
    }

    // Admin login and register pages
    @GetMapping("/admin/login")
    public String adminLoginPage() {
        return "ADMIN/AdminLogin/admin_login";
    }

    @GetMapping("/admin/register")
    public String adminRegisterPage() {
        return "ADMIN/AdminLogin/admin_register";
    }

    // User login and register pages
    @GetMapping("/user/login")
    public String userLoginPage() {
        return "USER/UserLogin/user_login";
    }

    @GetMapping("/user/register")
    public String userRegisterPage() {
        return "USER/UserLogin/user_register";
    }

    // Handle Admin registration
    @PostMapping("/admin/register")
    public String registerAdmin(@ModelAttribute User user) {
        user.setRole("ADMIN");
        userService.register(user);
        return "redirect:/admin/login";
    }

    // Handle User registration
    @PostMapping("/user/register")
    public String registerUser(@ModelAttribute User user) {
        user.setRole("USER");
        userService.register(user);
        return "redirect:/user/login";
    }

    // Handle Admin login
    @PostMapping("/admin/login")
    public String loginAdmin(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        User user = userService.login(username, password);
        if (user != null && "ADMIN".equals(user.getRole())) {
            session.setAttribute("user", user);
            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", "Invalid Credentials");
        return "ADMIN/AdminLogin/admin_login";
    }

    // Handle User login
    @PostMapping("/user/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        User user = userService.login(username, password);
        if (user != null && "USER".equals(user.getRole())) {
            session.setAttribute("user", user);
            return "redirect:/user/dashboard";
        }
        model.addAttribute("error", "Invalid Credentials");
        return "USER/UserLogin/user_login";
    }
}
