package com.example.recruitment.services;

import com.example.recruitment.repositories.NewsRepository;
import com.example.recruitment.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class NewsServiceTests {
    private NewsService newsService;

    @Test
    public void NewsServiceCanBeCreated(){

        // Arrange
        var newsRepository = Mockito.mock(NewsRepository.class);
        var userRepository = Mockito.mock(UserRepository.class);

        // Act && Assert
        assertDoesNotThrow(() -> new NewsService(userRepository, newsRepository));
    }

    @Test
    public void NewsServiceCanNotBeCreatedWhenNewsRepositoryIsNull(){

        // Arrange
        NewsRepository newsRepository = null;
        var userRepository = Mockito.mock(UserRepository.class);

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new NewsService(userRepository, newsRepository));
    }


    @Test
    public void NewsServiceCanNotBeCreatedWhenUserRepositoryIsNull(){

        // Arrange
        var newsRepository = Mockito.mock(NewsRepository.class);
        UserRepository userRepository = null;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new NewsService(userRepository, newsRepository));
    }
}
