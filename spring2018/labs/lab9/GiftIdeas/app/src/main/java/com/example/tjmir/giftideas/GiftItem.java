package com.example.tjmir.giftideas;

public class GiftItem {
    private String id;
    private String name;
    private String url;

    public GiftItem(){
        // Default constructor required for calls to DataSnapshot.getValue(RecipeItem.class)
    }

    public GiftItem(String newid, String newName, String newURL){
        id = newid;
        name = newName;
        url = newURL;
    }

    public String getId() {
        return id;
    }

    public String getName(){
        return name;
    }

    public String geturl(){
        return url;
    }

    //the string representation of a gift name
    public String toString(){
        return this.name;
    }
}
