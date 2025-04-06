package com.example.recipe_management.service;

import com.example.recipe_management.entity.User;

import java.util.List;

public interface UserService {
    void register(User user);
    User login(String username, String password);
    List<User> getAllUsersByRole(String role);
    void deleteUserById(Long id);
}
