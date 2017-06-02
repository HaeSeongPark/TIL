package com.rhino.study.touchevent;

import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class ViewPagerActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_pager);

        ViewPager viewPager = (ViewPager)findViewById(R.id.view_pager);
        ImagePagerAdapter ipa = new ImagePagerAdapter(this);
        viewPager.setAdapter(ipa);
    }
}
