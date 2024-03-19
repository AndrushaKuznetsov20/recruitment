package com.example.recruitment.controllers;

import com.example.recruitment.models.Result;
import com.example.recruitment.repositories.ResultRepository;
import com.example.recruitment.services.ResultService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ResutController {
    private final ResultService resultService;
    private final ResultRepository resultRepository;

    @GetMapping("/result")
    public String Results(@RequestParam(name = "user_id", required = false) Long user_id,Model model, Principal principal) {
        model.addAttribute("results", resultService.listResult(user_id));
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        return "results";
    }
    @GetMapping("/result/{id}")
    public String ResultInfo(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("result", resultService.getResultById(id));
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        return "result-info";
    }

    @PostMapping("/result/create")
    public String createResult(Result result, Model model, Principal principal) {
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        resultService.saveResult(result);
        return "redirect:/result";
    }
    @GetMapping("/result/edit/{id}")
    public String showUpdateFormResult(@PathVariable("id") long id, Model model, Principal principal) {
        Result result = resultRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid result Id:" + id));
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        model.addAttribute("result", result);
        return "editResult";
    }
    @PostMapping("/result/update/{id}")
    public String updateResult(@PathVariable("id") long id, Result resultt, BindingResult result, Model model, Principal principal) {
        model.addAttribute("user", resultService.getUserByPrincipal(principal));
        resultRepository.save(resultt);

        return "result-info";
    }
    @GetMapping("/result/delete/{id}")
    public String deleteResult(@PathVariable("id") Long id, Model model) {
        Result result = resultRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid result Id:" + id));
        resultRepository.delete(result);
        return "redirect:/result";
    }
}
