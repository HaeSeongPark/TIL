package com.rhino.study.touchevent;

import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class DialogActivity extends AppCompatActivity implements View.OnClickListener{
    @Override
    public void onClick(View view) {
        new AlertDialog.Builder(this)
                .setIcon(R.mipmap.ic_launcher)
                .setTitle("인사")
                .setMessage("안녕하세요!")
                .setNeutralButton("닫기",null) // null자리는 클릭리스너 자리, 눌렀을 때 어떤 동작
                .show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dialog);

        Button button = (Button)findViewById(R.id.button);
        button.setOnClickListener(this);
    }
}
