package com.example.tjmir.mironuckfinal2;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

public class MainActivity extends Activity {
    //define an array adapter
    ArrayAdapter<Data2> listAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Adding multiple items the short way
        Data2.items2.add(new Data2("Cardio"));
        Data2.items2.add(new Data2("Strength"));
        Data2.items2.add(new Data2("Flexibility"));


    }

    @Override public void onStart() {
        super.onStart();

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                //String itemName = (String) listView.getItemAtPosition(position);
                //create new intent
                Intent intent = new Intent(MainActivity.this, SecondActivity.class);
                //add teamName to intent
                intent.putExtra("itemid", id);
                //start intent
                startActivity(intent);
            }
        };

        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);
        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);

        //initialize the array adapter
        listAdapter = new ArrayAdapter<Data2>(this, android.R.layout.simple_list_item_1, Data2.items2);

        //set the array adapter on the list view
        listview.setAdapter(listAdapter);


        //register context menu
        registerForContextMenu(listview);
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



    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get item name that was pressed
        //String itemname = listAdapter.getItem(adapterContextMenuInfo.position);
        Data2 itemname = listAdapter.getItem(adapterContextMenuInfo.position);
        //set the menu title
        menu.setHeaderTitle("Delete " + itemname);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the hero
            Data2.items2.remove(info.position);
            //refresh the list view
            listAdapter.notifyDataSetChanged();
        }
        return true;
    }

}
