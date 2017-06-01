package com.rhino.study.touchevent;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class ToastLayoutActivity extends AppCompatActivity implements View.OnClickListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_toast_layout);

        Button button = (Button)findViewById(R.id.button);
        button.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        LinearLayout layout = (LinearLayout)getLayoutInflater().inflate(R.layout.toastlayout,null);

        Toast toast = Toast.makeText(this,"TOAST!!!",Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();
    }
}
