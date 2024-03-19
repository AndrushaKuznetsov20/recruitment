package com.example.recruitment.services;

import com.example.recruitment.models.Resume;
import com.example.recruitment.models.*;
import com.example.recruitment.repositories.PositionProfileRepository;
import com.example.recruitment.repositories.ResumeRepository;
import com.example.recruitment.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ResumeService {
    private final ResumeRepository resumeRepository;
    private final UserRepository userRepository;
    private final PositionProfileRepository positionProfileRepository;

    public List<Resume> listResume(String fio) {
        if (fio != null) return resumeRepository.findResultByName(fio);
        return resumeRepository.findAll();
    }

    public void saveResume(Resume resume) {
        log.info("Saving new {}", resume);
        resumeRepository.save(resume);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteResume(Long id) {
        resumeRepository.deleteById(id);
    }

    public Resume getResumeById(Long id) {
        return resumeRepository.findById(id).orElse(null);
    }
}
