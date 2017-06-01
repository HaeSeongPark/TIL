package com.rhino.study.touchevent;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class ToastActivity extends AppCompatActivity implements View.OnClickListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_toast);

        Button btn_toast = (Button)findViewById(R.id.btn_toast);
        btn_toast.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        Toast.makeText(this,"TOAST!!!",Toast.LENGTH_SHORT).show();
    }
}
