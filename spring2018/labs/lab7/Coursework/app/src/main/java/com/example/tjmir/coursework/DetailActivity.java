package com.example.tjmir.coursework;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

public class DetailActivity extends Activity implements CourseDetailFragment.ButtonClickListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        //get reference to the course detail fragment
        CourseDetailFragment courseDetailFragment = (CourseDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        //get the id passed in the intent
        int degreeId = (int)getIntent().getExtras().get("id");
        //pass the degree id to the fragment
        courseDetailFragment.setDegree(degreeId);
    }


    @Override public void addcourseclicked(View view){
        CourseDetailFragment fragment = (CourseDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addcourse();
    }
}
