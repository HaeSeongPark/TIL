package com.rhino.study.touchevent;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class Dialog2Activity extends AppCompatActivity implements View.OnClickListener{

    Button btn_items;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dialog2);

        Button btn_items = (Button)findViewById(R.id.btn_items);
        Button btn_sinigleItems = (Button)findViewById(R.id.btn_sigleItems);
        Button btn_multiItems = (Button)findViewById(R.id.btn_multiItmes);

        btn_items.setOnClickListener(this);
        btn_sinigleItems.setOnClickListener(this);
        btn_multiItems.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        int id  = view.getId();
        switch ( id )
        {
            case R.id.btn_items : showAlertDialog1(); break;
            case R.id.btn_sigleItems : showAlertDialog2 (); break;
            case R.id.btn_multiItmes : showAlertDialog3 (); break;
        }
    }

    private void showAlertDialog1() {
        final String[] cars = new String[] { "SM3", "SM5", "SM7", "SONATA", "AVANTE"};
        new AlertDialog.Builder(this).setTitle("경고창")
                .setItems(cars, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Toast.makeText(Dialog2Activity.this, "cars : " + cars[i], Toast.LENGTH_SHORT).show();
                    }
                }).setNeutralButton("닫기",null).show();
    }

    private void showAlertDialog2() {
        final String[] cars = new String[] { "SM3", "SM5", "SM7", "SONATA", "AVANTE"};
        new AlertDialog.Builder(this).setTitle("경고창")
                .setSingleChoiceItems(cars, -1,new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Toast.makeText(Dialog2Activity.this, "cars : " + cars[i], Toast.LENGTH_SHORT).show();
                    }
                }).setNeutralButton("닫기",null).show();
    }

    private void showAlertDialog3() {
        final String[] cars = new String[] { "SM3", "SM5", "SM7", "SONATA", "AVANTE"};
        new AlertDialog.Builder(this).setTitle("경고창")
                .setMultiChoiceItems(cars, null,new DialogInterface.OnMultiChoiceClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i, boolean b) {
                        Toast.makeText(Dialog2Activity.this, "cars : " + cars[i], Toast.LENGTH_SHORT).show();
                    }
                }).setNeutralButton("닫기",null).show();
    }
}
