package com.rhino.study.touchevent;

import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
/*
    액티비티에서 프래그먼트에 데이터 전달하기
 */
public class FragmentActivity3 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String[] numbers = new String[]{"1","2","3","4","5","6","7","8","9"};

        ArrayListFragment3 list = new ArrayListFragment3();

        // Bundle 데이터를 전달하기 위해 사용하는 하나의 객체 꾸러미
        Bundle bundle = new Bundle();
        bundle.putStringArray("numbers",numbers);
        list.setArguments(bundle);

        FragmentManager fm = getSupportFragmentManager();
        FragmentTransaction ft = fm.beginTransaction();
        ft.add(android.R.id.content, list);
        ft.commit();
    }
}
