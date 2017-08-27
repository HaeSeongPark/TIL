package com.rhino.study.myalarm;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.IBinder;
import android.util.Log;

public class RingtonePlayService extends Service {

    MediaPlayer media_song;
    int start_id;
    boolean isRunning;

    public RingtonePlayService() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    public int onStartCommand(Intent intent, int flags, int startId){
        Log.e("rhino","in startcommand of RingtonePlayService" + startId + ":" + intent);

        String state = intent.getExtras().getString("extra");

        Log.e("rhino", "state : " + state);

        NotificationManager notify_manager = (NotificationManager)getSystemService(NOTIFICATION_SERVICE);
        Intent intent_main_activity = new Intent(this.getApplicationContext(), MainActivity.class);
        // set up a pending intent
        PendingIntent pendingIntent_main_activity = PendingIntent.getActivity(this,0,intent_main_activity,0);

        // make the notification parameteers
        Notification notification = new Notification.Builder(this)
                .setContentTitle("An alarm is going off!")
                .setContentText("Click me!!!")
                .setContentIntent(pendingIntent_main_activity)
                .setAutoCancel(true)
                .setSmallIcon(R.mipmap.ic_launcher_round)
                .build();



//        assert state != null;
        if(state.equals("alarm on"))
            start_id = 1;
        else
            start_id = 0;

        if(!this.isRunning && start_id == 1)
        {
            // music start
            Log.e("rhino","there is no music and you want start");
            media_song = MediaPlayer.create(this,R.raw.beegees_howdeepisyourlove);
            media_song.start();
            this.isRunning = true;
            this.start_id = 0;


            notify_manager.notify(0,notification);

        }
        else if(this.isRunning && start_id == 0)
        {
            // music stop
            Log.e("rhino","there is  music and you want stop");
            media_song.stop();
            media_song.reset();
            this.isRunning = false;
            this.start_id = 0;

        }
        else if(!this.isRunning && start_id == 0)
        {
            // do nothing
            Log.e("rhino","there is no music and you want stop");
            this.isRunning = false;
            this.start_id = 0;
        }
        else if(this.isRunning && start_id == 1)
        {
            Log.e("rhino","there is music and you want start");
            this.isRunning = true;
            this.start_id = 1;
        }

        return START_NOT_STICKY;
    }

    @Override
    public void onDestroy() {
        Log.e("rhino","on Destroy called in RingtonPlayService");
        this.isRunning = false;
        super.onDestroy();
    }
}
