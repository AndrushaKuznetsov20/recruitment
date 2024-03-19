package com.example.recruitment.models;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class TreatyModelTests {
    private Treaty treatys;

    @BeforeEach
    public void createEmptyTreaty() {
        treatys = new Treaty();
    }

    @Test
    public void EmptyTreatyCanBeCreated(){

        // Act && Assert
        assertDoesNotThrow(() -> new New());
    }

    @Test
    public void NewWithValuesCanBeCreated(){

        var id = 1;
        var name_post = "Наименование";
        var fio = "ФИО";
        var StatusTreaty = "Нет";
        var Wage = 1000;

        // Act && Assert
        assertDoesNotThrow(() -> new Treaty(id,name_post,fio,StatusTreaty,Wage));
    }

    @Test
    public void ReviewModelCanNotBeCreatedWithIllegalTitleArgument(){

        var id = 1;
        var name_post = " ";
        var fio = "ФИО";
        var StatusTreaty = "Нет";
        var Wage = 1000;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new Treaty(id,name_post,fio,StatusTreaty,Wage));
    }

    @Test
    public void ReviewModelCanNotBeCreatedWithIllegalTextArgument(){

        var id = 1;
        var name_post = " ";
        var fio = " ";
        var StatusTreaty = "Нет";
        var Wage = 1000;

        // Act && Assert
        assertThrows(IllegalArgumentException.class, () -> new Treaty(id,name_post,fio,StatusTreaty,Wage));
    }


    @Test
    public void NewCanEditCorrectTitleAndText(){

        // Arrange
        var name_post = "Наименование";
        var fio = "Кузнецов";

        // Act && Assert
        var treatys = new Treaty();

        assertDoesNotThrow(() -> treatys.setName_post(name_post));
        assertDoesNotThrow(() -> treatys.setFio(fio));

        assertEquals(name_post, treatys.getName_post());
        assertEquals(fio, treatys.getFio());
    }

    @Test
    public void NewCanNotEditIllegalTitleAndTextArguments(){

        // Arrange

        var id = 1;
        var name_post = " ";
        var fio = " ";
        var StatusTreaty = "Нет";
        var Wage = 1000;


        assertThrows(IllegalArgumentException.class, () -> new Treaty(id,name_post,fio,StatusTreaty,Wage));
    }
}
