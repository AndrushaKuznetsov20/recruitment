package com.example.recruitment.services;

import com.example.recruitment.models.Treaty;
import com.example.recruitment.models.User;
import com.example.recruitment.repositories.TreatyRepository;
import com.example.recruitment.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
@Service
@Slf4j
@RequiredArgsConstructor
public class TreatyService {
    private final TreatyRepository treatyRepository;
    private final UserRepository userRepository;

    public List<Treaty> listTreatys(Long user_id) {
        if (user_id != null) return treatyRepository.findTreatyById(user_id);
        return treatyRepository.findAll();
    }

    public void saveTreaty(Treaty treaty) {
        log.info("Saving new {}", treaty);
        treatyRepository.save(treaty);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public void deleteTreaty(Long id) {
        treatyRepository.deleteById(id);
    }

    public Treaty getTreatyById(Long id) {
        return treatyRepository.findById(id).orElse(null);
    }
}
