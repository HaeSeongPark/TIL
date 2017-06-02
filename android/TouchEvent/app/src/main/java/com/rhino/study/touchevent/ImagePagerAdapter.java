package com.rhino.study.touchevent;

import android.content.Context;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

/**
 * Created by rhinoPHS
 *
 * 왜 안 뜰까...?
 **/
public class ImagePagerAdapter extends PagerAdapter {
    Context context;

    int[] images = new int[] {R.mipmap.ic_launcher, R.mipmap.ic_launcher_round, R.drawable.flag3,
                              R.drawable.flag4, R.drawable.flag5, R.drawable.flag6 };

    public ImagePagerAdapter(Context context) {
        this.context = context;
    }

    @Override
    public int getCount() {
        return images.length;
    }

    @Override
    public boolean isViewFromObject(View view, Object object) {
        return view == ((ImageView)object);
    }

    // 아이템 생성, 중요
    @Override
    public Object instantiateItem(ViewGroup container, int position) {
        ImageView imageView = new ImageView(context);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setImageResource(images[position]);
        ((ViewPager)container).addView(imageView);
        // 이미지뷰를 현재 콘테이너에 추가 ( 콘테이너는 현재 뷰페이저)
        return imageView;
    }

    //아이템제거, 중요
    @Override
    public void destroyItem(ViewGroup container, int position, Object object) {
        ((ViewPager)container).removeView((ImageView)object);
    }
}
