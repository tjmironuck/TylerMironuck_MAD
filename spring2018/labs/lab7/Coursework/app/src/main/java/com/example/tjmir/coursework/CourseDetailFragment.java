package com.example.tjmir.coursework;


import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.app.Fragment;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class CourseDetailFragment extends Fragment implements View.OnClickListener {

    // array adapter
    private ArrayAdapter<String> adapter;

    //id of the degree chosen
    private long degreeId;

    public CourseDetailFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        if (savedInstanceState !=null){
            degreeId = savedInstanceState.getLong("degreeId");
        }
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_course_detail, container, false);
    }

    @Override public void onStart(){
        super.onStart();

        View view = getView();
        ListView listCourses = (ListView) view.findViewById(R.id.courselistView);

        // get course data
        ArrayList<String> courselist = new ArrayList<String>();
        courselist = Degree.courses[(int) degreeId].getDegreecourses();

        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, courselist);

        //bind array adapter to the list view
        listCourses.setAdapter(adapter);
        Button addCourseButton = (Button) view.findViewById(R.id.addCourseButton);
        addCourseButton.setOnClickListener(this);

        //register context menu
        registerForContextMenu(listCourses);

    }


    //set the degree id
    public void setDegree(long id){
        this.degreeId = id;
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("degreeId", degreeId);
    }

    //create interface
    interface ButtonClickListener{
        void addcourseclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (ButtonClickListener)context;
    }

    @Override public void onClick(View view){
        if (listener !=null){
            listener.addcourseclicked(view);
        }
    }

    public void addcourse(){
        //create alert dialog
        AlertDialog.Builder dialog = new AlertDialog.Builder(getActivity());
        //create edit text
        final EditText edittext = new EditText(getActivity());
        //add edit text to dialog
        dialog.setView(edittext);
        //set dialog title
        dialog.setTitle("Add Course");
        //sets OK action
        dialog.setPositiveButton("Add", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                //get course name entered
                String courseName = edittext.getText().toString();
                if(!courseName.isEmpty()){
                    //add course
                    Degree.courses[(int) degreeId].getDegreecourses().add(courseName);
                    //refresh the list view
                    CourseDetailFragment.this.adapter.notifyDataSetChanged();
                }
            }
        });

        //sets cancel action
        dialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int whichButton) {
                //cancel
            }
        });
        //present alert dialog
        dialog.show();
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get course name that was pressed
        String coursename = adapter.getItem(adapterContextMenuInfo.position);
        //set the menu title
        menu.setHeaderTitle("Delete " + coursename);
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
            //remove the course
            Degree.courses[(int) degreeId].getDegreecourses().remove(info.position);
            //refresh the list view
            CourseDetailFragment.this.adapter.notifyDataSetChanged();
        }
        return true;
    }

}
