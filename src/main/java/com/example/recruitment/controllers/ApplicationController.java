package com.example.recruitment.controllers;

import com.example.recruitment.models.Application;
import com.example.recruitment.repositories.ApplicationRepository;
import com.example.recruitment.repositories.UserRepository;
import com.example.recruitment.services.ApplicationsService;
import com.example.recruitment.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplicationController {
    private final ApplicationsService applicationsService;
    private final ApplicationRepository applicationRepository;
    private final UserRepository userRepository;
    private final UserService userService;

    @GetMapping("/application")
    public String viewApplication(Model model, Principal principal) {
        return findPaginated(1, "title", "asc",model, principal);
    }
    @GetMapping("/page/{pageNo}/{sortField}/{sortDir}")
    public String findPaginated(@PathVariable (value = "pageNo") int pageNo,
                                @PathVariable (value = "sortField") String sortField,
                                @PathVariable (value = "sortDir") String sortDir,
                                Model model, Principal principal) {
        int pageSize = 5;

        Page<Application> page = applicationsService.findPaginated(pageNo, pageSize, sortField, sortDir);
        List<Application> listApplications= page.getContent();

        model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("listApplications", listApplications);
        return "applications1";
    }
   // @GetMapping("/application")
   ///// public String applications(@RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
        //                       @RequestParam(value = "size", required = false, defaultValue = "5") int size, Model model, Principal principal) {
      //  model.addAttribute("applications", applicationsService.getPage(pageNumber, size));
      //  model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
     //   return "applicationss";
   // }
    @GetMapping("/application/{id}")
    public String applicationInfo(@PathVariable Long id, Model model, Principal principal) {
        Application application = applicationsService.getApplicationById(id);
        model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
        model.addAttribute("application", applicationsService.getApplicationById(id));
        return "application-info";
    }
    @PostMapping("/application/create")
    public String createApplication(@ModelAttribute("application") @Valid Application application, BindingResult bindingResult, Model model, Principal principal) {
        model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
        if(bindingResult.hasErrors())
        {
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
            }
            model.addAttribute("listErrors",errors);
            return "positionProfiles";
        }
        applicationsService.saveApplication(application);
        return "redirect:/application";
    }
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model, Principal principal) {
        Application application = applicationRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid application Id:" + id));
        model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
        model.addAttribute("application", application);
        return "editApplication";
    }
    @PostMapping("/update/{id}")
    public String updateApplication(@PathVariable("id") long id, Application application, BindingResult result, Model model,Principal principal) {
        model.addAttribute("user", applicationsService.getUserByPrincipal(principal));
        model.addAttribute("application", application);
        applicationRepository.save(application);

        return "application-info";
    }
    @GetMapping("/application/delete/{id}")
    public String deleteApplication(@PathVariable("id") Long id, Model model) {
        Application application= applicationRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid application Id:" + id));
        applicationRepository.delete(application);
        return "redirect:/application";
    }
}
