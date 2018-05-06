package com.example.tjmir.giftideas;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.ContextMenu;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class GiftsMainActivity extends AppCompatActivity {

    // Firebase database instance
    FirebaseDatabase database = FirebaseDatabase.getInstance();
    //Firebase database reference
    DatabaseReference ref = database.getReference();
    //Firebase database giftideas node reference
    DatabaseReference giftref = database.getReference("gifts");

    //array list of gifts
    List gifts = new ArrayList<>();
    //array adapter
    ArrayAdapter<GiftItem> listAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gifts_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//
                //create a vertical linear layout to hold edit texts
                LinearLayout layout = new LinearLayout(GiftsMainActivity.this);
                layout.setOrientation(LinearLayout.VERTICAL);

                //create edit texts and add to layout
                final EditText nameEditText = new EditText(GiftsMainActivity.this);
                nameEditText.setHint("Gift name");
                layout.addView(nameEditText);
                final EditText urlEditText = new EditText(GiftsMainActivity.this);
                urlEditText.setHint("URL");
                layout.addView(urlEditText);

                //create alert dialog
                AlertDialog.Builder dialog = new AlertDialog.Builder(GiftsMainActivity.this);
                dialog.setTitle("Add Gift Idea");
                dialog.setView(layout);
                dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //get entered data
                        String giftName = nameEditText.getText().toString();
                        String giftURL = urlEditText.getText().toString();
                        if (giftName.trim().length() > 0) {
                            //get new id from firebase
                            String key = giftref.push().getKey();
                            //create new gift item
                            GiftItem newGift = new GiftItem(key, giftName, giftURL);
                            //add to Firebase
                            giftref.child(key).child("name").setValue(newGift.getName());
                            giftref.child(key).child("url").setValue(newGift.geturl());
                        }
                    }
                });
                dialog.setNegativeButton("Cancel", null);
                dialog.show();
            }
        });


        ListView giftList = (ListView) findViewById(R.id.listView);
        listAdapter = new ArrayAdapter<GiftItem>(this, android.R.layout.simple_list_item_1, gifts);
        giftList.setAdapter(listAdapter);

        // Read from the database
        ValueEventListener firebaseListener = new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                // This method is called once with the initial value and again
                // whenever data at this location is updated.

                //empty the arraylist
                gifts.clear();

                for (DataSnapshot snapshot : dataSnapshot.getChildren()) {
                    // gets the item id
                    String newId = snapshot.getKey();
                    //get gift from the snapshot
                    GiftItem giftItem = snapshot.getValue(GiftItem.class);
                    //create new GiftItem object
                    GiftItem newGift = new GiftItem(newId, giftItem.getName(), giftItem.geturl());
                    //add new recipe to our array
                    gifts.add(newGift);
                    //Log.d("data", "Value is: " + newGift.getId() + newGift.getName() + newGift.geturl());
                }
                //update adapter
                listAdapter.notifyDataSetChanged();
            }

            @Override
            public void onCancelled(DatabaseError error) {
                // Failed to read value
                Log.w("oncreate", "Failed to read value.", error.toException());
            }
        };

        //add listener to the database recipe node reference
        giftref.addValueEventListener(firebaseListener);
        registerForContextMenu(giftList);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> listView, View view, int position, long id){
                //get tapped gift
                GiftItem giftTapped = (GiftItem) gifts.get(position);
                //get the gift url
                String giftURL = giftTapped.geturl();
                //create new intent
                Intent intent = new Intent(Intent.ACTION_VIEW);
                //add url to intent
                intent.setData(Uri.parse(giftURL));
                //start intent
                startActivity(intent);
            }
        };
        giftList.setOnItemClickListener(itemClickListener);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_gifts_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get gift name that was pressed
        String giftname = ((TextView) adapterContextMenuInfo.targetView).getText().toString();
        //set the menu title
        menu.setHeaderTitle("Delete " + giftname);
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
            //get gift that was pressed
            GiftItem selectedGift = (GiftItem) gifts.get(info.position);
            //get recipe id
            String giftid = selectedGift.getId();
            //delete from Firebase
            giftref.child(giftid).removeValue();
        }
        return true;
    }
}
