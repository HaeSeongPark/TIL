package com.rhino.study.touchevent;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ListFragment;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

/**
 * Created by rhinoPHS
 * 액티비티에서 프래그먼트에 데이터 전달하기
 **/
public class ArrayListFragment3 extends ListFragment {
    public String[] getNumbers()
    {
        return getArguments().getStringArray("numbers");
    }


    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setListAdapter(new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_list_item_activated_1,getNumbers()));
                // activated는 선택했을 때 효과를 가지고 있는 것
        getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        getListView().setItemChecked(position,true);
        // 사용자가 선택한 것에 대한 것만 처리
    }
}
