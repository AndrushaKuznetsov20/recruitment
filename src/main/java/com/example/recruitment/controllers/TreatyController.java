package com.example.recruitment.controllers;

import com.example.recruitment.models.Treaty;
import com.example.recruitment.repositories.TreatyRepository;
import com.example.recruitment.services.TreatyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TreatyController {
   private final TreatyService treatyService;
   private final TreatyRepository treatyRepository;

    @GetMapping("/treaty")
    public String Treatys(@RequestParam(name = "user_id", required = false) Long user_id, Model model, Principal principal) {
        model.addAttribute("treatys", treatyService.listTreatys(user_id));
        model.addAttribute("user", treatyService.getUserByPrincipal(principal));
        return "treatys";
    }
    @GetMapping("/treaty/{id}")
    public String TreatyInfo(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("treaty", treatyService.getTreatyById(id));
        model.addAttribute("user", treatyService.getUserByPrincipal(principal));
        return "treaty-info";
    }

    @PostMapping("/treaty/create")
    public String createTreaty(Treaty treaty, Model model, Principal principal) {
        model.addAttribute("user", treatyService.getUserByPrincipal(principal));
        treatyService.saveTreaty(treaty);
        return "redirect:/treaty";
    }

    @GetMapping("/treaty/delete/{id}")
    public String deleteApplication(@PathVariable("id") Long id, Model model) {
        Treaty treaty = treatyRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid treaty Id:" + id));
        treatyRepository.delete(treaty);
        return "redirect:/treaty";
    }
}
