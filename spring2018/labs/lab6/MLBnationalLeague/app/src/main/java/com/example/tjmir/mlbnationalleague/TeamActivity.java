package com.example.tjmir.mlbnationalleague;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class TeamActivity extends Activity {

    private String divisionType;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_team);

        //get team id from the intent
        Intent intent = getIntent();
        divisionType = intent.getStringExtra("division");
        int teamnum = intent.getIntExtra("teamid", 0);

        Team team;
        switch (divisionType){
            case "West":
                team = Team.West[teamnum];
                break;
            case "Central":
                team = Team.Central[teamnum];
                break;
            case "East":
                team = Team.East[teamnum];
                break;
            default:
                team = Team.West[teamnum];
        }
        //Team team = Team.West[teamnum];

        //populate image
        ImageView teamImage = (ImageView)findViewById(R.id.teamImageView);
        teamImage.setImageResource(team.getImageResourceID());

        //populate name
        TextView teamName = (TextView)findViewById(R.id.team_name);
        teamName.setText(team.getName());
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
