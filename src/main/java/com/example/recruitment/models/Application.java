package com.example.recruitment.models;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.sql.Date;

@Entity
@Table(name = "applications")
@Data
public class Application {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @NotEmpty(message = "Наименование заявки не должно быть пустым!")
    @Size(min = 5, max = 25, message = "Длина наименования заявки должна быть между 5 и 30 символами!")
    @Column(name = "title")
    private String title;
    @Size(min = 5, max = 25, message = "Длина наименования вакансии должна быть между 5 и 100 символами!")
    @Column(name = "name_post")
    private String post;
    @Min(value = 1,message = "Количество сотрудников должно быть больше или равно одному!")
    @Column(name = "number_people")
    private int number_people;
    @Size(min = 15, max = 200, message = "Длина требований должна быть между 15 и 200 символами!")
    @Column(name = "requirements", columnDefinition = "text")
    private String requirements;
    @Min(value = 10000, message = "Заработная плата должна быть больше 10000р.!")
    @Column(name = "wage")
    private int wage;
    @Column(name = "schedule")
    private String schedule;
    @Column(name = "date_of_completion")
    private Date date_of_completion;
    @Column(name = "result_visirovanya")
    private String result_visirovanya;

    public Application() {
    }

}