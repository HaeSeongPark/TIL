package com.rhino.study.touchevent;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

public class LoginDialogActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_dialog);

        Button btn_dialog = (Button)findViewById(R.id.btn_dialog);
        btn_dialog.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showAlertDialog();
            }
        });
    }

    private void showAlertDialog() {
        LayoutInflater vi = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        LinearLayout loginLayout = (LinearLayout)vi.inflate(R.layout.logindialog,null);

        final EditText id = (EditText)loginLayout.findViewById(R.id.edit_id);
        final EditText pw = (EditText)loginLayout.findViewById(R.id.edit_pw);

        new AlertDialog.Builder(this)
                .setTitle("로그인")
                .setView(loginLayout)
                .setNeutralButton("확인", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        Toast.makeText(LoginDialogActivity.this,
                                 "ID : " + id.getText().toString() + "\n"
                                +"PW : " + pw.getText().toString(), Toast.LENGTH_SHORT)
                                .show();
                    }
                }).show();
    }
}
