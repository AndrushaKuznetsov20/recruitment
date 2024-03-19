package com.example.recruitment.controllers;

import com.example.recruitment.models.User;
import com.example.recruitment.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login(Principal principal, Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }
    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }
    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }
    @PostMapping("/registration")
    public String createUser(@Valid User user, Model model) {
        if(!userService.createUser(user))
        {
            model.addAttribute("errorMessage","Пользователь с email:" + user.getEmail() + "уже существует! ");
            return "registration";
        }
        return "/login";
    }

    @GetMapping("/index")
    public String securityUrl() {
        return "index";
    }
}
