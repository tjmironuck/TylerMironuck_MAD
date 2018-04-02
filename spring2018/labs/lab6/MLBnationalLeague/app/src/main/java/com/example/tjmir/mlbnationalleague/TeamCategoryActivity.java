package com.example.tjmir.mlbnationalleague;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class TeamCategoryActivity extends ListActivity {

    private String teamName;
    private String division;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        teamName = i.getStringExtra("teamName");

        //get the list view
        ListView listTeams = getListView();

        //define an array adapter
        ArrayAdapter<Team> listAdapter;

        //initialize the array adapter with the right list of divisions
        switch (teamName){
            case "National League West":
                listAdapter = new ArrayAdapter<Team>(this, android.R.layout.simple_list_item_1, Team.West);
                division = "West";
                break;
            case "National League Central":
                listAdapter = new ArrayAdapter<Team>(this, android.R.layout.simple_list_item_1, Team.Central);
                division = "Central";
                break;
            case "National League East":
                listAdapter = new ArrayAdapter<Team>(this, android.R.layout.simple_list_item_1, Team.East);
                division = "East";
                break;
            default: listAdapter = new ArrayAdapter<Team>(this, android.R.layout.simple_list_item_1, Team.West);
        }

        //set the array adapter on the list view
        listTeams.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        //create an intent
        Intent intent = new Intent(TeamCategoryActivity.this, TeamActivity.class);
        //pass data
        intent.putExtra("division", division);
        intent.putExtra("teamid", (int) id);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.load_website:
                //start order activity
                Intent intent = new Intent(this, WebsiteActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
