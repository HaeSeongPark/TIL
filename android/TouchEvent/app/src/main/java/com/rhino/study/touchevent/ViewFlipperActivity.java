package com.rhino.study.touchevent;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ViewFlipper;

public class ViewFlipperActivity extends AppCompatActivity implements View.OnClickListener{
    Button prev;
    Button next;
    ViewFlipper flipper;

    @Override
    public void onClick(View view) {
        if(view == prev)
//            flipper.showPrevious(); // 이전
        flipper.startFlipping(); // 자동전환시작
        else if(view == next)
//            flipper.showNext(); //다음
        flipper.stopFlipping(); // 자동전환종료
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_flipper);

        flipper = (ViewFlipper)findViewById(R.id.flipper);
        prev = (Button)findViewById(R.id.prev);
        next = (Button)findViewById(R.id.next);

        prev.setOnClickListener(this);
        next.setOnClickListener(this);

        //자동전환 1000 ms
        flipper.setFlipInterval(1000);
    }
}
