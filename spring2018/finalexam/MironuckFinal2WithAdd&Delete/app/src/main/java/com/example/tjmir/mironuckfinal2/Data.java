package com.example.tjmir.mironuckfinal2;

import java.util.ArrayList;

public class Data {
    private String name;
    private int imageResourceID;

    //constructor
    Data(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static ArrayList<Data> Cardio = new ArrayList<Data>();
    public static ArrayList<Data> Strength = new ArrayList<Data>();
    public static ArrayList<Data> Flexibility = new ArrayList<Data>();

//    public static final Data[] Cardio = {
//            new Data("Running", R.drawable.dodgers),
//            new Data("Cycling", R.drawable.diamondbacks),
//
//    };
//
//    public static final Data[] Strength = {
//            new Data("Rock Climbing", R.drawable.brewers),
//            new Data("P90X", R.drawable.cubs),
//
//    };
//
//    public static final Data[] Flexibility = {
//            new Data("Yogo", R.drawable.mets),
//            new Data("Pilates", R.drawable.nationals),
//
//    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }
}
