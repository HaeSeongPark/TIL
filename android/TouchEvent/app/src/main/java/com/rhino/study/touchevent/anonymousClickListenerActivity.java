package com.rhino.study.touchevent;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class anonymousClickListenerActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_anonymous_click_listener);

        final EditText edit = (EditText)findViewById(R.id.edit);
        final TextView text = (TextView)findViewById(R.id.text);

        Button button = (Button)findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                text.setText(edit.getText());
            }
        });
    }
    public void activitiyChange(View v)
    {
        Intent intent = new Intent(anonymousClickListenerActivity.this, ActivityClickListenerActivity.class);
        startActivity(intent);
    }
}
