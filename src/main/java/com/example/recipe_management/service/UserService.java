package com.example.recipe_management.service;

import com.example.recipe_management.entity.User;

import java.util.List;

public interface UserService {
    void register(User user) throws IllegalArgumentException;
    User login(String username, String password) throws IllegalArgumentException;
    List<User> getAllUsersByRole(String role);
    void deleteUserById(Long id);
    String validateUser(User user);
    String validatePassword(String password);
}
