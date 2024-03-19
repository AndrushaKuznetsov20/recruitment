package com.example.recruitment.repositories;

import com.example.recruitment.models.Treaty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TreatyRepository extends JpaRepository<Treaty, Long> {
    List<Treaty> findAll();

    @Query("SELECT t FROM Treaty t WHERE t.user_id = :user_id")
    List<Treaty> findTreatyById(@Param("user_id") Long user_id);
}
