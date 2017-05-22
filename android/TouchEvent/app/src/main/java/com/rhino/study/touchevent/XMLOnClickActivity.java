package com.rhino.study.touchevent;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class XMLOnClickActivity extends AppCompatActivity {

    EditText edit;
    TextView text;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_xmlon_click);

        edit = (EditText)findViewById(R.id.edit);
        text = (TextView)findViewById(R.id.text);
    }
    public void clickButton(View v)
    {
        text.setText(edit.getText());
    }
}
