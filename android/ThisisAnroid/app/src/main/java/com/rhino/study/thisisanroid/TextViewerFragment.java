package com.rhino.study.thisisanroid;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Created by rhinoPHS
 **/

// ① 텍스트 뷰어 프래그먼트 객체를 생성하는 함수다.
public class TextViewerFragment extends Fragment implements View.OnClickListener{
    private static final int REQUEST_CODE_REQUEST_TEXT_URI = 1;

    // 복원1 텍스트 읽음 여부를 저장해두는 멤버변수 하나를 등록해둔다.
    //       이 값은 프래그먼트 복원 테스트를 위해 추가되었다.
    Boolean  mIsRead = false;

    // ② 텍스트 뷰어 프래그먼트 객체를 생성하는 함수다.
    public static TextViewerFragment newInstance()
    {
        TextViewerFragment f = new TextViewerFragment();
        return f;
    }

    // ③ 부모 액티비티는 해당 프래그먼트를 구동하고, 액티비티에 추가될 프래그먼트의
    //    레이아웃을 onCreateView 함수의 반환값으로 요구한다.
    //    따라서 해당 프래그먼트는 onCreateView 재정의 함수에서 자신의 레이아웃을
    //    생성하고 반환한다.
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        Log.e("rhino","Frament onCreateView()");

        // 복원2 텍스트뷰어 레이아웃에 포함된 두 가지 버튼에 클릭 리스너를 설정

        View view = inflater.inflate(R.layout.fragment_text_viewer,container,false);

        Button changeStringBtn = (Button)view.findViewById(R.id.check_read_state_btn);
        Button showStringBtn = (Button)view.findViewById(R.id.show_read_state_btn);
        changeStringBtn.setOnClickListener(this);
        showStringBtn.setOnClickListener(this);

        // uri 1 : 텍스트 uri를 요청하는 버튼에 클릭 리스너를 설정한다
        Button requestUriBtn = (Button)view.findViewById(R.id.request_text_uri_btn);
        requestUriBtn.setOnClickListener(this);

        return view;
    }
//  이거 쓰면 로그가 안 찍히는뎀... 아래 거는 디플됐고...
//    @Override
//    public void onAttach(Context context) {
//        Log.e("rhino","Frament onAttach()");
//        super.onAttach(context);
//    }
    @Override
    public void onAttach(Activity activity) {
        Log.e("rhino","Frament onAttach()");
        super.onAttach(activity);
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        Log.e("rhino","Fragment onSaveInstanceState()");

        // 복원고려 1 복원을 위해 멤버 변수를 저장한다.
        outState.putBoolean("mIsRead",mIsRead);
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        Log.e("rhino","Frament onCreate()");

        // 복원고려2 저장해둔 멤버변수를 복원한다.
        if(savedInstanceState != null)
            mIsRead = savedInstanceState.getBoolean("mIsRead",false);
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        Log.e("rhino","Frament onActivityCreated()");
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public void onStart() {
        Log.e("rhino","Frament onStart()");
        super.onStart();
    }

    @Override
    public void onResume() {
        Log.e("rhino", "Fragment 0nResume()");
        super.onResume(); }

    @Override
    public void onPause() {
        Log.e("rhino", "Fragment 0nPause()");
        super.onPause(); }

    @Override
    public void onStop() {
        Log.e("rhino", "Fragment 0nStop()");
        super.onStop(); }

    @Override
    public void onDestroyView() {
        Log.e("rhino", "Fragment onDestroyView()");
        super.onDestroyView(); }

    @Override
    public void onDestroy() {
        Log.e("rhino", "Fragment onDestroy()");
        super.onDestroy(); }

    @Override
    public void onDetach() {
        Log.e("rhino", "Fragment onDetach()");
        super.onDetach(); }

    @Override
    public void onHiddenChanged( boolean hidden ) {
        Log.e("rhino", "Fragment onHiddenChanged(" + hidden + ")");
        super.onHiddenChanged( hidden );
    }

    @Override
    public void onClick(View view) {
        switch ( view.getId())
        {
            // 복원3 텍스트 읽음 버튼을 누르면 프래그먼트 내부 멤버변수 mIsRead에 true
            //       값을 저장해둔다.
            case  R.id.check_read_state_btn :
                mIsRead = true;
                break;

            // 복원4 읽음 여부 확인 버튼을 누르면 프래그먼트 내부 멤버변수 mIsRead값을 토스트로 보여준다.
            case R.id.show_read_state_btn :
                Toast.makeText(getActivity(), "읽음 여부 : " + mIsRead,Toast.LENGTH_LONG).show();
                break;

            case R.id.request_text_uri_btn:
                // uri2 : 액티비를 실행하기 위한 인텐트를 생성
                // 인텐트를 생성할 때 인자로 실행될 액티비티의 클래스를 설정
                Intent intent = new Intent(getActivity(),SelectUriActivity.class);

                // uri3 : 실행될 액티비티에 전달할 값을 인텐트 엑스트라에 설정
                // 전달할 값은 요청할 Uri의 타입이다
                // 실행되는 프래그먼트를해당 타압일 보고 이미지 혹은 텍스트의 Uri를 반환
                intent.putExtra("UriType","text");

                //uri4 : 프래그먼트에서 액티비티를 실행하는 방법은
                //액티비티에서 다른 액티비티를 실행하는 방법과 같다.
                //따라서 startActivity함수로 액티비티를 실행할 수 있다.
                // 그런테 실행되는 액티비티로 부터 결과를 받아야 하기 때문에
                // startActivityForResult 함수를 사용
                startActivityForResult(intent, REQUEST_CODE_REQUEST_TEXT_URI);
                break;
        }
    }

    //uri5 : 실행된 액티비티 결과를 받기 위해 onActivityResult 함수를 재정의 한다.
    // 프래그먼트에서 실행한 액티비티의 결과를 받는 방법 역시 액티비티 간에 결과를
    // 받는 방법과 같다. 따라서 액티비티와 같이 onActivityResult함수만 재정의 하면 된다.
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(requestCode == REQUEST_CODE_REQUEST_TEXT_URI
                && resultCode == Activity.RESULT_OK)
        {
            //uri6 : 실행된 액티비티의 Uri 결과를 받아 텍스트뷰에 출력
            String responseUri = data.getStringExtra("ResponseUri");
            TextView tv = (TextView)getView().findViewById(R.id.show_response_text_uri);
            tv.setText(responseUri);
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
}
