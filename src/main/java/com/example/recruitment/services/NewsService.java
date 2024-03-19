package com.example.recruitment.services;

import com.example.recruitment.models.New;
import com.example.recruitment.models.User;
import com.example.recruitment.repositories.NewsRepository;
import com.example.recruitment.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
public class NewsService {
    private final NewsRepository newsRepository;
    private final UserRepository userRepository;

    public NewsService(UserRepository userRepository, NewsRepository newsRepository){

        if (userRepository == null){
            throw new IllegalArgumentException("Null user repository was provided");
        }

        this.userRepository = userRepository;


        if (newsRepository == null){
            throw new IllegalArgumentException("Null passwordEncoder was provided");
        }

        this.newsRepository = newsRepository;
    }
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<New> listNews() {
        return newsRepository.findAll();
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public void saveNew(New news) {
        log.info("Saving new {}", news);
        newsRepository.save(news);
    }
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void deleteNew(Long id) {newsRepository.deleteById(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public New getNewById(Long id) {
        return newsRepository.findById(id).orElse(null);
    }
}
