package com.example.recruitment.repositories;

import com.example.recruitment.models.New;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NewsRepository extends JpaRepository<New, Long> {
    List<New> findByTitle(String title);
    List<New> findAll();
}
