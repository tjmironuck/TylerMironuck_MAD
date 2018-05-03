package com.example.tjmir.boardjournal;

import android.app.ListActivity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;

import java.util.UUID;

import io.realm.Realm;
import io.realm.RealmResults;


public class TrickListActivity extends AppCompatActivity {

    private Realm realm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trick_list);

        //get realm instance
        realm = Realm.getDefaultInstance();

        //get all saved Trick objects
        RealmResults<Trick> tricks = realm.where(Trick.class).findAll();

        final TrickAdapter adapter = new TrickAdapter(this, tricks);

        ListView listView = (ListView) findViewById(R.id.trick_list);

        //set our RealmBaseAdapter to the listview
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                //create a vertical linear layout to hold edit texts
                LinearLayout layout = new LinearLayout(TrickListActivity.this);
                layout.setOrientation(LinearLayout.VERTICAL);

                final Trick trick = (Trick) adapterView.getAdapter().getItem(i);

                //create edit texts and add to layout
                final EditText trickEditText = new EditText(TrickListActivity.this);
                trickEditText.setText(trick.getTrick_name());
                layout.addView(trickEditText);

                final EditText dateEditText = new EditText(TrickListActivity.this);
                dateEditText.setText(trick.getTrick_date());
                layout.addView(dateEditText);

                AlertDialog.Builder dialog = new AlertDialog.Builder(TrickListActivity.this);
                dialog.setTitle("Edit Trick");
                dialog.setView(layout);
                dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        //get updated trick names

                        final String updatedTrickName = trickEditText.getText().toString();
                        final String updatedTrickDate = dateEditText.getText().toString();
                        if(!updatedTrickName.isEmpty()) {
                            changeTrick(trick.getId(), updatedTrickName, updatedTrickDate);
                        }

                    }
                });
                dialog.setNegativeButton("Delete", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        deleteTrick(trick.getId());
                    }
                });
                dialog.create();
                dialog.show();
            }
        });

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //create a vertical linear layout to hold edit texts
                LinearLayout layout = new LinearLayout(TrickListActivity.this);
                layout.setOrientation(LinearLayout.VERTICAL);

                //create edit texts and add to layout
                final EditText trickEditText = new EditText(TrickListActivity.this);
                trickEditText.setHint("Trick name");
                layout.addView(trickEditText);
//                final EditText dateEditText = new EditText(TrickListActivity.this);
//                dateEditText.setHint("Enter Date");
//                layout.addView(dateEditText);

                //create alert dialog
                AlertDialog.Builder dialog = new AlertDialog.Builder(TrickListActivity.this);
                dialog.setTitle("Add Trick");
                dialog.setView(layout);
                dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //get trick name entered
                        final String newTrickName = trickEditText.getText().toString();
//                        final String newTrickDate = dateEditText.getText().toString();

                        if(!newTrickName.isEmpty()) {
                            //start realm write transaction
                            realm.executeTransactionAsync(new Realm.Transaction() {
                                @Override
                                public void execute(Realm realm) {
                                    //create a realm object
                                    Trick newtrick = realm.createObject(Trick.class, UUID.randomUUID().toString());
                                    newtrick.setTrick_name(newTrickName);
//                                    newtrick.setTrick_date(newTrickDate);
                                }
                            });
                        }
                    }
                });
                dialog.setNegativeButton("Cancel", null);
                dialog.show();
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        //close the Realm instance when the Activity exits
        realm.close();
    }

    public void changeTrickLanded(final String trickId) {
        realm.executeTransactionAsync(new Realm.Transaction() {
            @Override
            public void execute(Realm realm) {
                Trick trick = realm.where(Trick.class).equalTo("id", trickId).findFirst();
                trick.setLanded(!trick.hasLanded());
            }
        });
        //
            ///////DELETE THIS CODE IF YOU WANT TO GO BACK TO HOW IT WAS////////////////////////
            //create a vertical linear layout to hold edit texts
            LinearLayout layout = new LinearLayout(TrickListActivity.this);
            layout.setOrientation(LinearLayout.VERTICAL);


            final Trick trick = realm.where(Trick.class).equalTo("id", trickId).findFirst();
            Boolean landedCheck = trick.hasLanded();
            if(!landedCheck){
            final EditText dateEditText = new EditText(TrickListActivity.this);

            dateEditText.setText(trick.getTrick_date());
            layout.addView(dateEditText);

            AlertDialog.Builder dialog = new AlertDialog.Builder(TrickListActivity.this);
            dialog.setTitle("Add Date");
            dialog.setView(layout);
            dialog.setPositiveButton("Save", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    //get updated trick names

                    final String updatedTrickDate = dateEditText.getText().toString();
                    if (!updatedTrickDate.isEmpty()) {
                        changeDate(trick.getId(), updatedTrickDate);
                    }

                }
            });
            dialog.setNegativeButton("Delete", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    //deleteTrick(trick.getId());
                }
            });
            dialog.create();
            dialog.show();
            //////////////////////////////////////////////
        }
        else {
                changeDate(trick.getId(), "");
            }
    }

    private void changeTrick(final String trickId, final String trick_name, final String trick_date) {
        realm.executeTransactionAsync(new Realm.Transaction() {
            @Override
            public void execute(Realm realm) {
                Trick trick = realm.where(Trick.class).equalTo("id", trickId).findFirst();
                trick.setTrick_name(trick_name);
                trick.setTrick_date(trick_date);
            }
        });
    }

    ///////DELETE THIS METHOD IF YOU WANT TO GO BACK TO HOW IT WAS
    private void changeDate(final String trickId, final String trick_date) {
        realm.executeTransactionAsync(new Realm.Transaction() {
            @Override
            public void execute(Realm realm) {
                Trick trick = realm.where(Trick.class).equalTo("id", trickId).findFirst();
                trick.setTrick_date(trick_date);
            }
        });
    }

    private void deleteTrick(final String trickId) {
        realm.executeTransactionAsync(new Realm.Transaction() {
            @Override
            public void execute(Realm realm) {
                realm.where(Trick.class).equalTo("id", trickId)
                        .findFirst()
                        .deleteFromRealm();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_trick_list, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.


        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()) {
            case R.id.action_settings:
                //start order activity
                Intent intent = new Intent(this, HowTosListActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }

        /*
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
        */
    }
}
