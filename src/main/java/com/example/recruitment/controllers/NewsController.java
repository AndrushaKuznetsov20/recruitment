package com.example.recruitment.controllers;

import com.example.recruitment.models.New;
import com.example.recruitment.repositories.NewsRepository;
import com.example.recruitment.services.NewsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class NewsController {

    private final NewsService newsService;
    private final NewsRepository newsRepository;

    @GetMapping("/new")
    public String News(Model model, Principal principal) {
        model.addAttribute("news", newsService.listNews());
        model.addAttribute("user", newsService.getUserByPrincipal(principal));
        return "news";
    }
    @GetMapping("/new/{id}")
    public String newsInfo(@PathVariable Long id, Model model, Principal principal) {
        New news = newsService.getNewById(id);
        model.addAttribute("user", newsService.getUserByPrincipal(principal));
        model.addAttribute("new", newsService.getNewById(id));
        return "news-info";
    }

    @PostMapping("/new/create")
    public String createNew(New news) {
        newsService.saveNew(news);
        return "redirect:/admin";
    }
    @GetMapping("/new/delete/{id}")
    public String deleteNew(@PathVariable("id") Long id, Model model) {
        New news = newsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid new Id:" + id));
        newsRepository.delete(news);
        return "redirect:/new";
    }
}
