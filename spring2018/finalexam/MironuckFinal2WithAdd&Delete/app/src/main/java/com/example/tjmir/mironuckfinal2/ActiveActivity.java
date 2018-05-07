package com.example.tjmir.mironuckfinal2;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;

public class ActiveActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_active);

        //get reference to action bar
        ActionBar actionBar = getActionBar();
        //enable the up button
        actionBar.setDisplayHomeAsUpEnabled(true);
    }
}
