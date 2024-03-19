package com.example.recruitment.controllers;

import com.example.recruitment.models.PositionProfile;
import com.example.recruitment.repositories.PositionProfileRepository;
import com.example.recruitment.services.PositionProfileService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class PositionProfileController {
    private final PositionProfileService positionProfileService;
    private final PositionProfileRepository positionProfileRepository;

    @GetMapping("/positionProfile")
    public String positionProfiles(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("positionProfiles", positionProfileService.listPositionProfile(title));
        model.addAttribute("user", positionProfileService.getUserByPrincipal(principal));
        return "positionProfiles";
    }
    @GetMapping("/positionProfile/{id}")
    public String positionProfileInfo(@PathVariable Long id, Model model, Principal principal) {
        PositionProfile positionProfile = positionProfileService.getPositionProfileById(id);
        model.addAttribute("user", positionProfileService.getUserByPrincipal(principal));
        model.addAttribute("positionProfile", positionProfile);
        model.addAttribute("images", positionProfile.getImages());
        return "positionProfile-info";
    }

    @PostMapping("/positionProfile/create")
    public String createApplication(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                    @RequestParam("file3") MultipartFile file3, PositionProfile positionProfile, Principal principal) throws IOException {
        positionProfileService.savePositionProfile(principal,positionProfile, file1, file2, file3);
        return "redirect:/positionProfile";
    }

    @GetMapping("/positionProfile/delete/{id}")
    public String deletePositionProfile(@PathVariable("id") Long id, Model model) {
        PositionProfile positionProfile = positionProfileRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid position prodile Id:" + id));
        positionProfileRepository.delete(positionProfile);
        return "redirect:/positionProfile";
    }

}
