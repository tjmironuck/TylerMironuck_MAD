package com.example.tjmir.boardjournal;

import android.app.ActionBar;
import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


public class HowTosActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_how_tos);


        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                //String tricktype = (String) listView.getItemAtPosition(position);
                //create new intent
                Intent intent = new Intent(HowTosActivity.this, HowTosVideoActivity.class);
                //add tricktype to intent
                intent.putExtra("trickid", id);
                //start intent
                startActivity(intent);
            }
        };

        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);
        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);

        //define an array adapter
        ArrayAdapter<HowTos> listAdapter;

        //initialize the array adapter
        listAdapter = new ArrayAdapter<HowTos>(this, android.R.layout.simple_list_item_1, HowTos.howTos);

        //set the array adapter on the list view
        listview.setAdapter(listAdapter);

        //get reference to action bar
        ActionBar actionBar = getActionBar();
       //

        //enable the up button
        //actionBar.setDisplayHomeAsUpEnabled(true);
        if (actionBar != null){
            actionBar.setDisplayHomeAsUpEnabled(true);
        }

    }
/*
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_trick_list, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.action_settings:
                //start order activity
                Intent intent = new Intent(this, HowTosActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    */
}
