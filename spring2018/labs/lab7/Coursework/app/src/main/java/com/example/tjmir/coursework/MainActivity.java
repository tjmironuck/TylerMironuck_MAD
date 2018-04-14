package com.example.tjmir.coursework;

import android.app.Activity;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends Activity implements DegreeListFragment.DegreeListListener, CourseDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override public void itemClicked(long id){
        //get a reference to the frame layout that contains CourseDetailFragment
        View fragmentContatiner = findViewById(R.id.fragment_container);
        //large layout device
        if(fragmentContatiner!=null){
            //create new fragment instance
            CourseDetailFragment frag = new CourseDetailFragment();
            //set the id of the degree selected
            frag.setDegree(id);

            //create new fragment transaction
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            //replace the fragment in the fragment container
            ft.replace(R.id.fragment_container, frag);
            //add fragment to the back stack
            ft.addToBackStack(null);
            //set the transition animation-optional
            ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            //commit the transaction
            ft.commit();
        }else{//app is running on a device with a smaller screen
            Intent intent = new Intent(this, DetailActivity.class);
            intent.putExtra("id",(int)id);
            startActivity(intent);
        }





    }

    @Override public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0 ){
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }

    @Override public void addcourseclicked(View view){
        CourseDetailFragment fragment = (CourseDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addcourse();
    }


}
