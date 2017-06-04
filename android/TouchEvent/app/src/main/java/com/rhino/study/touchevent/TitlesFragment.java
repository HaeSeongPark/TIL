package com.rhino.study.touchevent;

import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import static com.rhino.study.touchevent.R.id.details;

public class TitlesFragment extends ListFragment {
    boolean isDual;

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setListAdapter(new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_list_item_activated_1,BookInfo.TITLES));

        View detailsFrame = getActivity().findViewById(details);
        // detailsFrame을 찾아 올 수 있을 때는 태블릿(가로일 때 뿐)
        // 따라서 null이 아니면 태블릿(가로모드)이다.
        // 게다가 보여지고 있다면까지 해서 확실하게
        isDual = detailsFrame != null && detailsFrame.getVisibility() == View.VISIBLE;
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        super.onListItemClick(l, v, position, id);

        if(isDual)
            showFragment(position);
        else
            showActivity(position);
    }

    private void showFragment(int position)
    {
        DetailsFragment details = (DetailsFragment)getFragmentManager().findFragmentById(R.id.details);

        if(details == null || details.getPosition() != position)
        {
            details = DetailsFragment.newInstance(position);
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            ft.replace(R.id.details, details);
            ft.setCustomAnimations(android.R.anim.fade_in, android.R.anim.fade_out,
                    android.R.anim.fade_in, android.R.anim.fade_out);
            ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            ft.commit();
        }
    }

    private void showActivity(int position)
    {
        Intent intent = new Intent();
        intent.setClass(getActivity(),DetailsActivity.class);
        intent.putExtra("position",position);
        startActivity(intent);
    }

}
