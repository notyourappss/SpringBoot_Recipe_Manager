package com.example.recipe_management.repository;

import com.example.recipe_management.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsernameAndPassword(String username, String password);
    List<User> findByRole(String role);
}
