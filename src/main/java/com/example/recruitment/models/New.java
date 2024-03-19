package com.example.recruitment.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "News")
@Data
public class New {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "text")
    private String text;
    @Column(name = "name_author")
    private String name_author;
    @Column(name = "rating")
    private int rating;

    public New(Long id, String title, String text, String name_author, int rating) {

        this.id = id;
        if (stringIsNullOrEmptyOrBlank(title)){
            throw new IllegalArgumentException("Пустое наименование новости");
        }

        this.title = title;

        if (stringIsNullOrEmptyOrBlank(text)){
            throw new IllegalArgumentException("Пустое описание");
        }

        this.text = text;
        this.name_author = name_author;
        this.rating = rating;
    }

    public New() {

    }

    private boolean stringIsNullOrEmptyOrBlank(String row)
    {
        return row == null || row.isEmpty() || row.trim().isEmpty();
    }
}

