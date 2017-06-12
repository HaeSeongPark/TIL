package com.rhino.study.myalarm;

import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;

public class RingtonePlayService extends Service {

    MediaPlayer media_song;

    public RingtonePlayService() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    public int onStartCommand(Intent intent, int flags, int startId){
        Log.e("rhino","in startcommand of RingtonePlayService" + startId + ":" + intent);

        media_song = MediaPlayer.create(this,R.raw.beegees_howdeepisyourlove);
        media_song.start();
        return START_NOT_STICKY;
    }

    @Override
    public void onDestroy() {
        Toast.makeText(this,"on Destroy called in RingtonePlayService",Toast.LENGTH_SHORT).show();
    }
}
