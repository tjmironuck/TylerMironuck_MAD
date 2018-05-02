package com.example.tjmir.boardjournal;

import android.app.ActionBar;
import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class HowTosListActivity extends ListActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //ActionBar actionBar = getActionBar();


        //get the list view
        ListView listHowTos = getListView();

        //define an array adapter
        ArrayAdapter<HowTos> listAdapter;

        //initialize the array adapter
        listAdapter = new ArrayAdapter<HowTos>(this, android.R.layout.simple_list_item_1, HowTos.howTos);

        //set the array adapter on the list view
        listHowTos.setAdapter(listAdapter);

        //get reference to action bar
        ActionBar actionBar = getActionBar();
        //actionBar.show();

        //enable the up button
        //actionBar.setDisplayHomeAsUpEnabled(true);
        if (actionBar != null){
            actionBar.setDisplayHomeAsUpEnabled(true);
        }

    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(HowTosListActivity.this, HowTosVideoActivity.class);
        intent.putExtra("trickid", (int) id);
        startActivity(intent);
    }
}
