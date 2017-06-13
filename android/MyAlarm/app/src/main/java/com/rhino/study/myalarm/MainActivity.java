package com.rhino.study.myalarm;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.TimePicker;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    AlarmManager alarm_manager;
    TimePicker alarm_timepicker;
    TextView set_text_alarm;
    Context context;
    Button btn_alarm_turn_on;
    Button btn_alarm_turn_off;
    Calendar calendar = Calendar.getInstance();
    Intent intent;
    PendingIntent pendingIntent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        this.context = this;

        init();
    }

    private void init() {
        alarm_timepicker = (TimePicker)findViewById(R.id.timePicker);
        alarm_manager = (AlarmManager)getSystemService(ALARM_SERVICE);
        set_text_alarm = (TextView)findViewById(R.id.txt_update);
        btn_alarm_turn_on = (Button)findViewById(R.id.btn_turn_on_alarm);
        btn_alarm_turn_off = (Button)findViewById(R.id.btn_turn_off_alarm);
        intent = new Intent(this.context, Alarm_Receiver.class);

    }

    public void turnOnAlarm(View v)
    {
        int hour = alarm_timepicker.getHour();
        int minute = alarm_timepicker.getMinute();

        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,minute);

        set_text_alarm.setText("Alarm set : "+ hour + ":" + (minute<10 ? "0"+minute : minute));

        intent.putExtra("extra","alarm on");
        pendingIntent = PendingIntent.getBroadcast(MainActivity.this,0,intent, PendingIntent.FLAG_UPDATE_CURRENT);
        alarm_manager.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(),pendingIntent);
    }
    public void turnOffAlarm(View v)
    {
        set_text_alarm.setText("AlarmOff!!!");

        alarm_manager.cancel(pendingIntent);

        intent.putExtra("extra","alarm off");

        // stop the ringtone;
        sendBroadcast(intent);
    }

}
