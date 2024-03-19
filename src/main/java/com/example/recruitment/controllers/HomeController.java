package com.example.recruitment.controllers;

import com.example.recruitment.services.PositionProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PositionProfileService positionProfileService;

    @GetMapping("/")
    public String positionProfiles(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("positionProfiles", positionProfileService.listPositionProfile(title));
        model.addAttribute("user", positionProfileService.getUserByPrincipal(principal));
        return "positionProfiles";
    }
}
