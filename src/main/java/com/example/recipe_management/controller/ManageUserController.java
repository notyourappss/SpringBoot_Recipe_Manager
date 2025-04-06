package com.example.recipe_management.controller;

import com.example.recipe_management.entity.User;
import com.example.recipe_management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ManageUserController {

    @Autowired
    private UserService userService;

    // Show all users (excluding admins)
    @GetMapping("/manage-users")
    public String showUsers(Model model) {
        List<User> users = userService.getAllUsersByRole("USER");
        model.addAttribute("users", users);
        return "ADMIN/Dashboard/manage_users";
    }

    // Delete a user
    @GetMapping("/delete-user/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/manage-users";
    }
}
