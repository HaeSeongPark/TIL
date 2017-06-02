package com.rhino.study.touchevent;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
/*
액티비티의 레이아웃 파일에 프래그먼트를 선언하는 방법
 */
public class FragmentActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fragment);
    }
}
