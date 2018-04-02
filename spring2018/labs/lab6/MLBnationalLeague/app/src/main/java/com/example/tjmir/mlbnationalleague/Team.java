package com.example.tjmir.mlbnationalleague;

public class Team {
    private String name;
    private int imageResourceID;

    //constructor
    private Team(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Team[] West = {
            new Team("Los Angeles Dodgers", R.drawable.dodgers),
            new Team("Arizona Diamondbacks", R.drawable.diamondbacks),
            new Team("San Francisco Giants", R.drawable.giants),
            new Team("Colorado Rockies", R.drawable.rockies),
            new Team("San Diego Padres", R.drawable.padres)
    };

    public static final Team[] Central = {
            new Team("Milwaukee Brewers", R.drawable.brewers),
            new Team("Chicago Cubs", R.drawable.cubs),
            new Team("St. Louis Cardinals", R.drawable.cardinals),
            new Team("Pittsburgh Pirates", R.drawable.pirates),
            new Team("Cincinnati Reds", R.drawable.reds)
    };

    public static final Team[] East = {
            new Team("New York Mets", R.drawable.mets),
            new Team("Washington Nationals", R.drawable.nationals),
            new Team("Philadelphia Phillies", R.drawable.phillies),
            new Team("Atlanta Braves", R.drawable.braves),
            new Team("Miami Marlins", R.drawable.marlins)
    };

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
