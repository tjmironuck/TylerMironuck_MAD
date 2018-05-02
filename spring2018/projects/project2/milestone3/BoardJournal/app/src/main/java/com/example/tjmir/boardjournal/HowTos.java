package com.example.tjmir.boardjournal;

public class HowTos {
    private String name;
    private String videoResourceID;

    //constructor
    private HowTos(String newname, String newID){
        this.name = newname;
        this.videoResourceID = newID;
    }

    public static final HowTos[] howTos = {
            new HowTos("Ollie", "SXFQCgw-V_k"),
            new HowTos("Nollie", "H_tSuAipjWc"),
            new HowTos("Butter", "cVKamPWu_Sc"),
            new HowTos("Indy Grab", "iKkhKekZNQ8"),
            new HowTos("Frontside 180", "JMS2PGAFMcE"),
            new HowTos("Front Shifty", "MdhS9tu7TWg"),
            new HowTos("Backside 180", "YAABnJfKJ5w"),
            new HowTos("Frontside 360", "Sh3qT1INT_I"),
            new HowTos("50-50 Box", "0hZG3z1EaI0"),
            new HowTos("Butter Nose Role", "czpV-FOBHY4"),
            new HowTos("Back Board Slide", "udwk9nJ0lXA"),
            new HowTos("Front 540", "w66AU3GdfFo"),
            new HowTos("Front Cork 540", "FMHiSF0rHF8"),
    };

    public String getName(){
        return name;
    }

    public String getVideoResourceID(){
        return videoResourceID;
    }


    public String toString(){
        return this.name;
    }
}
