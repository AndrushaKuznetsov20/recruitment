package com.example.recruitment.repositories;

import com.example.recruitment.models.Application;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ApplicationRepository extends JpaRepository<Application, Long> {

    @Query("from Application")
    List<Application> findAllByPageRequest(PageRequest pageRequest);
}
