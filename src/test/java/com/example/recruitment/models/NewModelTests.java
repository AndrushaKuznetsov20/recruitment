package com.example.recruitment.models;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

public class NewModelTests {

    private New news;

    @BeforeEach
    public void createEmptyNew() {
        news = new New();
    }

    @Test
    public void EmptyNewCanBeCreated(){

        // Act && Assert
        assertDoesNotThrow(() -> new New());
    }

    @Test
    public void NewWithValuesCanBeCreated(){

        var id = 1;
        var title = "Новость_1";
        var text = "Текст новости";
        var name_author = "Кузнецов А.А.";
        var rating = 5;

        // Act && Assert
        assertDoesNotThrow(() -> new New((long) id, title, text, name_author, rating));
    }

    @Test
    public void ReviewModelCanNotBeCreatedWithIllegalTitleArgument(){

        var id = 1;
        var title = " ";
        var text = "Текст новости";
        var name_author = "Кузнецов А.А.";
        var rating = 5;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new New((long) id, title, text, name_author, rating));
    }

    @Test
    public void ReviewModelCanNotBeCreatedWithIllegalTextArgument(){

        var id = 1;
        var title = "name";
        var text = " ";
        var name_author = "Кузнецов А.А.";
        var rating = 5;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new New((long) id, title, text, name_author, rating));
    }


    @Test
    public void NewCanEditCorrectTitleAndText(){

        // Arrange
        var title = "name";
        var text = "text news";

        // Act && Assert
        var news = new New();

        assertDoesNotThrow(() -> news.setTitle(title));
        assertDoesNotThrow(() -> news.setText(text));

        assertEquals(title, news.getTitle());
        assertEquals(text, news.getText());
    }

    @Test
    public void NewCanNotEditIllegalTitleAndTextArguments(){

        // Arrange

        var id = 1;
        var title = " ";
        var text = " ";
        var name_author = "Кузнецов";
        var rating = 5;


        assertThrows(IllegalArgumentException.class, () -> new New((long) id, title, text, name_author, rating));
    }
}