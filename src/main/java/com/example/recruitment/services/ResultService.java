package com.example.recruitment.services;

import com.example.recruitment.models.Result;
import com.example.recruitment.models.User;
import com.example.recruitment.repositories.ResultRepository;
import com.example.recruitment.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ResultService {
    private final ResultRepository resultRepository;
    private final UserRepository userRepository;

    public List<Result> listResult(Long user_id) {
        if (user_id != null) return resultRepository.findResultById(user_id);
        return resultRepository.findAll();
    }
    public void saveResult(Result result) {
        log.info("Saving new {}", result);
        resultRepository.save(result);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteResult(Long id) {
        resultRepository.deleteById(id);
    }

    public Result getResultById(Long id) {
        return resultRepository.findById(id).orElse(null);
    }
}
