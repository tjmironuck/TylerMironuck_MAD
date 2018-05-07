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

public class SecondActivity extends Activity {
    //define an array adapter
    ArrayAdapter<Data> listAdapter;
    private String division;
    int itemID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        //Intent i = getIntent();
        //itemName = i.getStringExtra("itemName");
        long itemnum = (Long)getIntent().getExtras().get("itemid");
        itemID = (int)itemnum;
        //Data data = Data.items.get(itemID);

        //Adding multiple items the short way


        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                //String itemName = (String) listView.getItemAtPosition(position);
                //create new intent
                //Intent intent = new Intent(SecondActivity.this, SecondActivity.class);
                //add teamName to intent
                //intent.putExtra("itemid", id);
                //start intent
                //startActivity(intent);
            }
        };

        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView2);
        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);

        //initialize the array adapter with the right list of divisions

        switch (itemID){
            case 0:
                Data.Cardio.add(new Data("Running", R.drawable.braves));
                Data.Cardio.add(new Data("Cycling", R.drawable.brewers));
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Cardio);
                division = "West";
                break;
            case 1:
                Data.Strength.add(new Data("Rock Climbing", R.drawable.cardinals));
                Data.Strength.add(new Data("P90X", R.drawable.cardinals ));
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Strength);
                division = "Central";
                break;
            case 2:
                Data.Flexibility.add(new Data("Yoga", R.drawable.cardinals));
                Data.Flexibility.add(new Data("Pilates", R.drawable.cardinals ));
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Flexibility);
                division = "East";
                break;
            default:
                Data.Cardio.add(new Data("Running", R.drawable.braves));
                Data.Cardio.add(new Data("Cycling", R.drawable.brewers));
                listAdapter = new ArrayAdapter<Data>(this, android.R.layout.simple_list_item_1, Data.Cardio);
        }

        //set the array adapter on the list view
        listview.setAdapter(listAdapter);


        final Button button = (Button) findViewById(R.id.addButton);
        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                additem();
            }
        });


        //register context menu
        registerForContextMenu(listview);


    }

    @Override public void onStart() {
        super.onStart();


    }

    public void additem(){
        //create alert dialog
        AlertDialog.Builder dialog = new AlertDialog.Builder(SecondActivity.this);

        //create edit text
        final EditText edittext = new EditText(SecondActivity.this);

        //add edit text to dialog
        dialog.setView(edittext);

        //set dialog title
        dialog.setTitle("Add Item");

        //sets OK action
        dialog.setPositiveButton("Add", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                //get item name entered
                String itemName = edittext.getText().toString();
                if(!itemName.isEmpty()){
                    //create new an Item object
                    //Data new_item = new Data(itemName, R.drawable.braves);
                    //Data.Cardio.add(new Data(itemName, R.drawable.braves));
                    switch (itemID){
                        case 0:
                            Data.Cardio.add(new Data(itemName, R.drawable.braves));
                            break;
                        case 1:
                            Data.Strength.add(new Data(itemName, R.drawable.braves));
                            break;
                        case 2:
                            Data.Flexibility.add(new Data(itemName, R.drawable.braves));
                            break;
                        default:
                            Data.Cardio.add(new Data(itemName, R.drawable.braves));
                    }

                    // add item
                    //Data.items.add(new_item);
                    //refresh the list view
                    SecondActivity.this.listAdapter.notifyDataSetChanged();
                    listAdapter.notifyDataSetChanged();
                }
            }
        });

        //sets cancel action
        dialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                // cancel
            }
        });

        //present alert dialog
        dialog.show();
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get item name that was pressed
        //String itemname = listAdapter.getItem(adapterContextMenuInfo.position);
        Data itemname = listAdapter.getItem(adapterContextMenuInfo.position);
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
            //remove the activity

            switch (itemID){
                case 0:
                    Data.Cardio.remove(info.position);
                    break;
                case 1:
                    Data.Strength.remove(info.position);
                    break;
                case 2:
                    Data.Flexibility.remove(info.position);
                    break;
                default:
                    Data.Cardio.remove(info.position);
            }


            //Data.Cardio.remove(info.position);
            //refresh the list view
            listAdapter.notifyDataSetChanged();
        }
        return true;
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
