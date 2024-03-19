package com.example.recruitment.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Result")
@Data
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "user_id")
    private Long user_id;
    @Column(name = "position_id")
    private Long position_id;
    @Column(name = "description")
    private String description;
    @Column(name = "address")
    private String address;
    @Column(name = "result_itog")
    private String result_itog;
}
