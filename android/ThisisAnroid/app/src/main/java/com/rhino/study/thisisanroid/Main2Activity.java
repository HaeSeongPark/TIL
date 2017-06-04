package com.rhino.study.thisisanroid;

import android.net.Uri;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Toast;

public class Main2Activity extends AppCompatActivity implements  OnFragmentInteractionListener{
    @Override
    public void onFragmentInteraction(Uri uri) {
        Toast.makeText(this, uri.toString(),Toast.LENGTH_SHORT).show();
    }

    FragmentPagerAdapter adapterViewPager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        ViewPager viewPager = (ViewPager)findViewById(R.id.viewpager);
        adapterViewPager = new MyPagerAdapter(getSupportFragmentManager());
        viewPager.setAdapter(adapterViewPager);

        TabLayout mTab = (TabLayout)findViewById(R.id.tabs);
        mTab.setupWithViewPager(viewPager);
    }

    public static class MyPagerAdapter extends FragmentPagerAdapter {
        private static int NUM_ITEMS = 3;

        public MyPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
        }

        // Returns total number of pages
        @Override
        public int getCount() {
            return NUM_ITEMS;
        }

        // Returns the fragment to display for that page
        @Override
        public Fragment getItem(int position) {
            switch (position) {
                case 0: // Fragment # 0 - This will show FirstFragment
                    return PageOneFragment.newInstance();
                case 1: // Fragment # 0 - This will show FirstFragment different title
                    return PageTwoFragment.newInstance();
                case 2: // Fragment # 1 - This will show SecondFragment
                    return PageThreeFragment.newInstance();
                default:
                    return null;
            }
        }

        // Returns the page title for the top indicator
        @Override
        public CharSequence getPageTitle(int position) {
            switch (position)
            {
                case 0:
                    return "첫번째 탭";
                case 1:
                    return "두번째 탭";
                case 2:
                    return "세번째 탭";
                default:
                    return null;
            }
        }
    }
}
