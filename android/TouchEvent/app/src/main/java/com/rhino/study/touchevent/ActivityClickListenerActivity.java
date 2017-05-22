package com.rhino.study.touchevent;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class ActivityClickListenerActivity extends AppCompatActivity implements View.OnClickListener{

    EditText edit;
    TextView text;

    @Override
    public void onClick(View view) {
        text.setText(edit.getText());
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_click_listener);

        edit = (EditText)findViewById(R.id.edit);
        text = (TextView)findViewById(R.id.text);

        Button button = (Button)findViewById(R.id.button);
        button.setOnClickListener(this);
    }
    public void activitiyChange(View v)
    {
        Intent intent = new Intent(ActivityClickListenerActivity.this, XMLOnClickActivity.class);
        startActivity(intent);
    }
}
