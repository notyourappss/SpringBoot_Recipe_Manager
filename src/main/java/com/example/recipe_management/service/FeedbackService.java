package com.example.recipe_management.service;

import com.example.recipe_management.entity.Feedback;
import com.example.recipe_management.entity.User;
import java.util.List;

public interface FeedbackService {
    void saveFeedback(Feedback feedback);
    List<Feedback> getAllFeedbacks();
    void deleteFeedback(Long id);
}