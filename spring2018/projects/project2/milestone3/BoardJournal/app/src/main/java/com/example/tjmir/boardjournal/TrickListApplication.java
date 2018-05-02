package com.example.tjmir.boardjournal;

import android.app.Application;

import io.realm.Realm;
import io.realm.RealmConfiguration;

public class TrickListApplication extends Application{
    @Override
    public void onCreate() {
        super.onCreate();

        //initialize Realm
        Realm.init(this);
        //define the configuration for realm
        RealmConfiguration realmConfig = new RealmConfiguration.Builder().build();

        //uncomment this line if you change your class structure. Run it once. then comment out again
        //Realm.deleteRealm(realmConfig);

        //set the default realm configuration
        Realm.setDefaultConfiguration(realmConfig);
    }
}
