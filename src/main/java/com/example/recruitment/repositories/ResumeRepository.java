package com.example.recruitment.repositories;

import com.example.recruitment.models.Resume;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ResumeRepository extends JpaRepository<Resume, Long> {
    List<Resume> findAll();

    @Query("SELECT r FROM Resume r WHERE r.Fio = :Fio")
    List<Resume> findResultByName(@Param("Fio") String Fio);
}
