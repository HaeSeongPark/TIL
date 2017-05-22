package com.rhino.study.touchevent;

import android.content.Context;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

/**
 * Created by rhinoPHS
 **/
public class MyView extends View {
    public MyView(Context context) {
        super(context);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if(event.getAction() == MotionEvent.ACTION_DOWN)
        {
            Log.e("tag","MyView.onTouchEvent");
            return false;
        }
        return true;
    }
}
