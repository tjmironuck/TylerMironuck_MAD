package com.example.tjmir.boardjournal;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.google.android.youtube.player.YouTubeBaseActivity;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;

import java.util.ArrayList;
import java.util.List;

public class HowTosVideoActivity extends YouTubeBaseActivity {

    private static final String TAG = "HowTosVideoActivity";
    //declare our variables
    YouTubePlayerView mYouTubePlayerView;
    Button btnPlay;
    YouTubePlayer.OnInitializedListener mOnInitializedListener;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_how_tos_video);

        //get Trick id from the intent
        int tricknum = (Integer)getIntent().getExtras().get("trickid");
        final HowTos howTos = HowTos.howTos[tricknum];

        //populate name
        TextView trickName = (TextView)findViewById(R.id.trick_name);
        trickName.setText("How to do a \n"+ howTos.getName());

        Log.d(TAG, "onCreate: Starting.");
        btnPlay = (Button) findViewById(R.id.btnPlay);
        mYouTubePlayerView = (YouTubePlayerView) findViewById(R.id.youtubePlay);

        mOnInitializedListener = new YouTubePlayer.OnInitializedListener() {
            @Override
            public void onInitializationSuccess(YouTubePlayer.Provider provider, YouTubePlayer youTubePlayer, boolean b) {
                Log.d(TAG, "onClick: Done initializing.");
//                List<String> videoList = new ArrayList<>();
//                videoList.add("iKkhKekZNQ8");
//                videoList.add("6QsLhWzXGu0");
//                youTubePlayer.loadVideos(videoList);
                //youTubePlayer.loadVideo(howTos.getVideoResourceID());
                youTubePlayer.loadVideo("iKkhKekZNQ8");
            }

            @Override
            public void onInitializationFailure(YouTubePlayer.Provider provider, YouTubeInitializationResult youTubeInitializationResult) {
                Log.d(TAG, "onClick: Failed to initialize.");
            }
        };
        //add onclick listener to the button\
        btnPlay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d(TAG, "onClick: Initializing YouTube Player.");
                mYouTubePlayerView.initialize(YouTubeConfig.getApiKey(), mOnInitializedListener);

            }
        });


        //populate image
        //ImageView trickImage = (ImageView)findViewById(R.id.trickImageView);
        //trickImage.setImageResource(howTos.getVideoResourceID());



    }
}
