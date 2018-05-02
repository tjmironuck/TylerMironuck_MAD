package com.example.tjmir.boardjournal;

import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;
import io.realm.annotations.Required;

public class Trick extends RealmObject {
    @Required
    @PrimaryKey
    private String id;
    private String trick_name;
    private String trick_date;
    private boolean landed;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTrick_name() {
        return trick_name;
    }

    public void setTrick_name(String trick) {
        this.trick_name = trick;
    }

    public String getTrick_date() {
        return trick_date;
    }

    public void setTrick_date(String date) {
        this.trick_date = date;
    }

    public boolean hasLanded() {
        return landed;
    }

    public void setLanded(boolean done) {
        this.landed = done;
    }


}
