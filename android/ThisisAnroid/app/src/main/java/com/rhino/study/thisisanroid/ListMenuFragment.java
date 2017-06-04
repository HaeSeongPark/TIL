package com.rhino.study.thisisanroid;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

/**
 * Created by rhinoPHS
 **/
public class ListMenuFragment extends Fragment implements AdapterView.OnItemClickListener {

    ListView mListView = null;
    OnListItemClickListener mListItemClickListener = null;

    public static final int ITEM_TYPE_TEXT_VIEWER = 1;
    public static final int ITEM_TYPE_IMAGE_VIEWER = 2;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_menu_list, container, false);

        mListView = (ListView)v.findViewById(R.id.listview);

        // ① 리스트 클릭 리스너를 설정한다.
        mListView.setOnItemClickListener(this);
        return v;
    }

    // ② 해당 프래그먼트를 사용하는 액티비티에서 리스트 아이템 클릭시 그 이벤트를
    //    수신받기 위한 리스너 인터페이스를 정의한다.
    //    이 리스너를 통해 해당 프래그먼트는 독립적으로 동작될 수 있다.

    public interface OnListItemClickListener {
        void onItemClick(int itemType);
    }

    // ③ 외부에서 해당 프래그먼트에서 발생되는 리스트 아이템 클릭 이벤트 수신받기 위한
    //    리스너를 등록함수다.
    public void setOnListItemClickListener(OnListItemClickListener ln)
    {
        mListItemClickListener = ln;
    }


    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
        int itemType = 0;

        switch ( position )
        {
            case 0 : itemType = ITEM_TYPE_TEXT_VIEWER; break;
            case 1 : itemType = ITEM_TYPE_IMAGE_VIEWER; break;
        }

        if(mListItemClickListener != null)
        {
            mListItemClickListener.onItemClick( itemType );
        }
    }
}
