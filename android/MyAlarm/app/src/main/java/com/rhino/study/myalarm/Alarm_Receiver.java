package com.rhino.study.myalarm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class Alarm_Receiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Log.e("rhino","We are in Alarm_Receiver");

        Intent service_intent = new Intent(context, RingtonePlayService.class);
        context.startService(service_intent);
    }
}
