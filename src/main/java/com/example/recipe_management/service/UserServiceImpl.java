package com.example.recipe_management.service;

import com.example.recipe_management.entity.User;
import com.example.recipe_management.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public void register(User user) {
        userRepository.save(user);
    }

    @Override
    public User login(String username, String password) {
        User user = userRepository.findByUsernameAndPassword(username,password);
        return user != null && user.getPassword().equals(password) ? user : null;
    }

    @Override
    public List<User> getAllUsersByRole(String role) {
        return userRepository.findByRole(role);
    }

    @Override
    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }
}
