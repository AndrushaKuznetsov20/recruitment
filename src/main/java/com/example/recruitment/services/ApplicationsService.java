package com.example.recruitment.services;

import com.example.recruitment.models.Application;
import com.example.recruitment.models.User;
import com.example.recruitment.repositories.ApplicationRepository;
import com.example.recruitment.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ApplicationsService {
    private final ApplicationRepository applicationRepository;
    private final UserRepository userRepository;
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Application> listApplications() {
        return applicationRepository.findAll();
    }
   public Page<Application> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
       Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
               Sort.by(sortField).descending();
       Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
       return this.applicationRepository.findAll(pageable);
   }
    @Transactional(propagation = Propagation.REQUIRED)
    public void saveApplication(Application application) {
        log.info("Saving new {}", application);
        applicationRepository.save(application);
    }
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public Application updateApplication(Application applicationRequest) {

        Application existingApplication = applicationRepository.findById(applicationRequest.getId()).orElse(null);
        existingApplication.setTitle(applicationRequest.getTitle());
        existingApplication.setPost(applicationRequest.getPost());
        existingApplication.setNumber_people(applicationRequest.getNumber_people());
        existingApplication.setRequirements(applicationRequest.getRequirements());
        existingApplication.setWage(applicationRequest.getWage());
        existingApplication.setSchedule(applicationRequest.getSchedule());
        existingApplication.setDate_of_completion(applicationRequest.getDate_of_completion());
        existingApplication.setResult_visirovanya(applicationRequest.getResult_visirovanya());
        return applicationRepository.save(existingApplication);
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public void deleteApplication(Long id) {
        applicationRepository.deleteById(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Application getApplicationById(Long id) {
        return applicationRepository.findById(id).orElse(null);
    }
}
