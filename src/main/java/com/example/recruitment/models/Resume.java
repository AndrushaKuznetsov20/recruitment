package com.example.recruitment.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Resume")
@Data
public class Resume {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "Fio")
    private String Fio;
    @Column(name = "Education")
    private String Education;
    @Column(name = "Experience", columnDefinition = "text")
    private String Experience;
    @Column(name = "Skills", columnDefinition = "text")
    private String Skills;
    @Column(name = "ExpectedSalary")
    private int ExpectedSalary;

    public Resume() {
    }

    private Long profile_id;

    @OneToOne
    @JoinColumn(name = "User_id")
    private User User_id;

}