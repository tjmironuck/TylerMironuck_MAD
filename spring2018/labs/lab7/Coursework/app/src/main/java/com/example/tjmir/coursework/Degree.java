package com.example.tjmir.coursework;

import java.util.ArrayList;
import java.util.Arrays;

public class Degree {
    private String degree;
    private ArrayList<String> degreecourses = new ArrayList<>();

    //constructor
    private Degree(String deg, ArrayList<String> courses){
        this.degree = deg;
        this.degreecourses = new ArrayList<String>(courses);
    }

    public static final Degree[] courses = {
            new Degree("Electrical Engineering", new ArrayList<String>(Arrays.asList("Introduction to Engineering", "Algorithm Design & Programming I", "Introduction to Logic Systems", "Circuit Theory I", "Circuit Theory II","Microprocessor Engineering", "Signals & Linear Systems", "Electronic Circuits & Signals I", "Electromagnetic Fields", "Semiconductors & Devices", "ECE Projects", "Senior Capstone Design"))),
            new Degree("Computer Engineering", new ArrayList<String>(Arrays.asList("Algorithm Design & Programming I", "Algorithm Design & Programming II", "Software Design in C & C++", "Real Time Embedded Computing", "VHDL & Programmable Logic Devices", "Computer Organization"))),
            new Degree("Mechanical Engineering", new ArrayList<String>(Arrays.asList("Advanced Product design", "Solid Mechanics I", "Component Design", "Design for Manufacturability", "Thermodynamics", "Mobile App Dev", "Mobile App Dev Advanced", "Graduate Design I", "Graduate Design II"))),

    };

    public String getDegree(){
        return degree;
    }

    public ArrayList<String> getDegreecourses(){
        return degreecourses;
    }

    public String toString(){
        return this.degree;
    }
}
