package com.example.recruitment.repositories;

import com.example.recruitment.models.PositionProfile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PositionProfileRepository extends JpaRepository<PositionProfile, Long> {
    List<PositionProfile> findByTitle(String title);
}
