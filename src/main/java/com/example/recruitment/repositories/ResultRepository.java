package com.example.recruitment.repositories;

import com.example.recruitment.models.Result;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findAll();

    @Query("SELECT r FROM Result r WHERE r.user_id = :user_id")
    List<Result> findResultById(@Param("user_id") Long user_id);

}
