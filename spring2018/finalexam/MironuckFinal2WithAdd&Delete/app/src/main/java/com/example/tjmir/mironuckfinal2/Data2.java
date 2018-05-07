package com.example.tjmir.mironuckfinal2;

import java.util.ArrayList;

public class Data2 {
    private String name;

    //constructor
    public Data2(String newname) {
        this.name = newname;
    }

    public static ArrayList<Data2> items2 = new ArrayList<Data2>();

    public String getName(){
        return name;
    }


    //the string representation of an itme is its name
    public String toString(){
        return this.name;
    }
}
