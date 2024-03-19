package com.example.recruitment.services;

import com.example.recruitment.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class UserServiceTests {

    private UserService userService;

    @Test
    public void UserServiceCanBeCreated(){

        // Arrange
        var userRepository = Mockito.mock(UserRepository.class);
        var passwordEncoder = Mockito.mock(PasswordEncoder.class);

        // Act && Assert
        assertDoesNotThrow(() -> new UserService(userRepository, passwordEncoder));
    }

    @Test
    public void UserServiceCanNotBeCreatedWhenUserRepositoryIsNull(){

        // Arrange
        UserRepository userRepository = null;
        var passwordEncoder = Mockito.mock(PasswordEncoder.class);

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new UserService(userRepository, passwordEncoder));
    }


    @Test
    public void UserServiceCanNotBeCreatedWhenPasswordEncoderIsNull(){

        // Arrange
        var userRepository = Mockito.mock(UserRepository.class);
        PasswordEncoder passwordEncoder = null;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new UserService(userRepository, passwordEncoder));
    }
}