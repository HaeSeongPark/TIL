package com.rhino.study.touchevent;

import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v4.app.FragmentTransaction;
import android.app.*;
import android.os.Bundle;

/*
자바 코드에서 프래그멘트를 추가하는 방법

가로 세로 모드 전환할 때 클릭하 한 게 남아있는데 v4 때문에 그러나
nono land모드 따로 만들어야 됨!!! fragmentActivity5처럼
v4는 api11이전 버전 지원할려는 거고
그냥은 11이후버전용이니까
 */

public class FragmentActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(savedInstanceState == null) {
            ArrayListFragment list = new ArrayListFragment();
            FragmentManager fm = getSupportFragmentManager();
            FragmentTransaction ft = fm.beginTransaction();
            ft.add(android.R.id.content, list);
            ft.commit();
        }
    }
}
