package com.example.recipe_management.service;

import com.example.recipe_management.entity.Favorite;
import com.example.recipe_management.entity.Recipe;
import com.example.recipe_management.entity.User;
import com.example.recipe_management.repository.FavoriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepository favoriteRepository;

    @Transactional
    public void addToFavorites(User user, Recipe recipe) {
        if (!favoriteRepository.existsByUserAndRecipe(user, recipe)) {
            Favorite fav = new Favorite();
            fav.setUser(user);
            fav.setRecipe(recipe);
            favoriteRepository.save(fav);
        }
    }

    public List<Favorite> getFavoritesByUser(User user) {
        return favoriteRepository.findByUser(user);
    }

    @Transactional
    public void removeFromFavorites(User user, Recipe recipe) {
        favoriteRepository.deleteByUserAndRecipe(user, recipe);
    }

    public boolean isFavorited(User user, Recipe recipe) {
        return favoriteRepository.existsByUserAndRecipe(user, recipe);
    }
}
