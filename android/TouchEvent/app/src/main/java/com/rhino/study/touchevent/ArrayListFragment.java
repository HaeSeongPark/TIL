package com.rhino.study.touchevent;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ListFragment;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

/**
 * Created by rhinoPHS
 *
 * 가로 세로 모드 전환할 때 클릭하 한 게 남아있는데 v4 때문에 그러나
 v4는 api11이전 버전 지원할려는 거고
 그냥은 11이후버전용이니까
 **/
public class ArrayListFragment extends ListFragment {
    private static String[] NUMBERS = new String[]{"1","2","3","4","5","6","7","8","9"};

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        setListAdapter(new ArrayAdapter<String>(getActivity(),
                android.R.layout.simple_list_item_activated_1,NUMBERS));
                // activated는 선택했을 때 효과를 가지고 있는 것
        getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        getListView().setItemChecked(position,true);
        // 사용자가 선택한 것에 대한 것만 처리
    }
}
