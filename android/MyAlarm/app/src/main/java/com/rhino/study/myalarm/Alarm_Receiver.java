package com.rhino.study.myalarm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import static android.icu.lang.UCharacter.GraphemeClusterBreak.L;

public class Alarm_Receiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        String get_your_string = intent.getExtras().getString("extra");

        Log.e("rhino","We are in Alarm_Receiver" + "key : " + get_your_string);

        Intent service_intent = new Intent(context, RingtonePlayService.class);
        service_intent.putExtra("extra",get_your_string);
        context.startService(service_intent);
    }
}
