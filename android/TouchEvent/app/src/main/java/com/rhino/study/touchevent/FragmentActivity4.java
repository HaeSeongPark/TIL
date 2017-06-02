package com.rhino.study.touchevent;

import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

/*
    프래그먼트에서 액티비티에 이벤트 전달하기

    1. OnListItemSelectedListener.java 인터페이스
    2. FragmentActivity4.java 클래스
    3. ArrayListFragment4.java 클래스

 */

public class FragmentActivity4 extends AppCompatActivity implements  OnListItemSelectedListener{
    @Override
    public void onListItemSelected(String itemName) {
        setTitle(getTitle() + " " + itemName);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ArrayListFragment4 list = new ArrayListFragment4();

        FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
        ft.add(android.R.id.content,list).commit();
    }
}
