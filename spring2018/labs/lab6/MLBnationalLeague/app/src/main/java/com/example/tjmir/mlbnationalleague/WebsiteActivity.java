package com.example.tjmir.mlbnationalleague;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class WebsiteActivity extends Activity {

    private WebView webview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_website);

        webview = (WebView)findViewById(R.id.webview1);

        webview.getSettings().setJavaScriptEnabled(true);
        webview.loadUrl("https://en.wikipedia.org/wiki/National_League");

        //get reference to action bar
        ActionBar actionBar = getActionBar();
        //enable the up button
        actionBar.setDisplayHomeAsUpEnabled(true);

    }
}
