/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

/**
 *
 * @author Asus
 */
public class Specialist {
    private int id;
    private String specialistName;
    
    public Specialist(){
        super();
    }

    public Specialist(int id, String specialistName) {
        super();
        this.id = id;
        this.specialistName = specialistName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialistName() {
        return specialistName;
    }

    public void setSpecialistName(String specialistName) {
        this.specialistName = specialistName;
    }
    
}
