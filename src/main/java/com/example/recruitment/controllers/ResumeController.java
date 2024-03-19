package com.example.recruitment.controllers;


import com.example.recruitment.models.Resume;
import com.example.recruitment.repositories.ResumeRepository;
import com.example.recruitment.services.PositionProfileService;
import com.example.recruitment.services.ResumeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ResumeController {
    private final ResumeService resumeService;
    private final ResumeRepository resumeRepository;
    private final PositionProfileService positionProfileService;

    @GetMapping("/resume")
    public String resumes(@RequestParam(name = "Fio", required = false) String fio, Principal principal, Model model, Long id) {
        model.addAttribute("resumes", resumeService.listResume(fio));
        model.addAttribute("user", resumeService.getUserByPrincipal(principal));
        return "resumes";
    }

    @GetMapping("/resume/{id}")
    public String ResumeInfo(@PathVariable Long id, Model model, Principal principal) {
        Resume resume = resumeService.getResumeById(id);
        model.addAttribute("user", resumeService.getUserByPrincipal(principal));
        model.addAttribute("resume", resume);
        return "resume-info";
    }

    @PostMapping("/resume/create")
    public String createResume(Long id, Resume resume, Model model, Principal principal) throws IOException {
        resumeService.saveResume(resume);
        return "redirect:/positionProfile";
    }

    @GetMapping("/resume/delete/{id}")
    public String deleteResume(@PathVariable("id") Long id, Model model) {
        Resume resume= resumeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid resume Id:" + id));
        resumeRepository.delete(resume);
        return "redirect:/resume";
    }
}