package com.rhino.study.touchevent;

import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import static android.icu.lang.UCharacter.GraphemeClusterBreak.V;

public class DetailsFragment extends Fragment {
    public static DetailsFragment newInstance(int position)
    {
        DetailsFragment df = new DetailsFragment();

        Bundle args = new Bundle();
        args.putInt("position",position);
        df.setArguments(args);
        return df;
    }

    public int getPosition()
    {
        return getArguments().getInt("position",0);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.detail_view,container,false);
        TextView textView = (TextView)v.findViewById(R.id.details);
        textView.setText(BookInfo.DETAILS[getPosition()]);
        return v;
    }
}
