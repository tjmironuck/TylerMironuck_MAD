package com.example.tjmir.mironuckfinal2;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class CategoryActivity extends ListActivity {

    private String itemName;
    private String division;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //Intent i = getIntent();
        //itemName = i.getStringExtra("itemName");
        long itemnum = (Long)getIntent().getExtras().get("itemid");
        int itemID = (int)itemnum;
        //Data data = Data.items.get(itemID);

        //get the list view
        ListView listview = getListView();

        //define an array adapter
        ArrayAdapter<Data> listAdapter;

        //initialize the array adapter with the right list of divisions
        switch (itemID){
            case 0:
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Cardio);
                division = "West";
                break;
            case 1:
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Strength);
                division = "Central";
                break;
            case 2:
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Flexibility);
                division = "East";
                break;
            default: listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Cardio);
        }

        //set the array adapter on the list view
        listview.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        //create an intent
        //Intent intent = new Intent(CategoryActivity.this, DetailActivity.class);
        //pass data
        //intent.putExtra("division", division);
        //intent.putExtra("itemid", (int) id);
        //startActivity(intent);
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
                //start active activity
                Intent intent = new Intent(this, ActiveActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
