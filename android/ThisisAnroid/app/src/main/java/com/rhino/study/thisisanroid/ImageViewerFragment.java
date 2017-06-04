package com.rhino.study.thisisanroid;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

/**
 * Created by rhinoPHS
 **/
public class ImageViewerFragment extends Fragment implements View.OnClickListener{

    private static final int REQUEST_CODE_REQUEST_IMAGE_URI = 1;

    // ① 이미지 뷰어 프래그먼트 객체를 생성하는 함수다.
    public static ImageViewerFragment newInstance()
    {
        ImageViewerFragment f = new ImageViewerFragment();

        return f;
    }

    // ② 부모 액티비티는 해당 프래그먼트를 구동하고, 액티비티에 추가될 프래그먼트의
    //    레이아웃을 onCreateView 함수의 반환값으로 요구한다.
    //    따라서 해당 프래그먼트는 onCreateView 재정의 함수에서 자신의 레이아웃을
    //    생성하고 반환한다.
    @Override
    public View onCreateView(LayoutInflater inflater,
                             ViewGroup container,
                             Bundle savedInstanceState )
    {
        View view =  inflater.inflate( R.layout.fragment_image_viewer, container, false);

        //1. 이미지 URI를 요청하는 버튼에 클릭 리스너를 설정한다.
        Button requestUriBtn = (Button)view.findViewById(R.id.request_image_uri_btn);
        requestUriBtn.setOnClickListener(this);
        return view;
    }

    @Override
    public void onClick(View v) {

        // 2. 실행할 프래그먼트를 객체를 생성한다.
        SelectUriFragmnet selectUriFragmnet = SelectUriFragmnet.newInstance();

        // 3. 실행될 프래그먼트에 전달할 인자 값을 설정
        // 전달할 값은 요청할 Uri의 타입
        // 실행되는 프래그먼트를 해당 타입을 보고 이미지 혹은 텍스트의 Uri를 반환

        Bundle argsBundle = new Bundle();
        argsBundle.putString("UriType","image");
        selectUriFragmnet.setArguments(argsBundle);

        // 4. 실행될 프래그먼트에 실행하는 프래그먼트 객체와 요청 코드를 설정
        // 이후 실행되는 프래그먼트는 이 설정으로 실행되는 프래그먼트는 자신을 실행한
        // 프래그먼트를 참조하거나 실행한 프래그먼트의 요청코드를 참조할 수 있다.

        selectUriFragmnet.setTargetFragment(this, REQUEST_CODE_REQUEST_IMAGE_URI);

        // 5. 화면 우측에 새로운 프래그먼트를 실행한다.
        // 그런데 중요한 것은 addToBackStack 함수를 트랜잭션에 포함하는 것이다.
        // 백스택에 트랜잭션을 추가해야만 실행되는 프래그먼트가 종료되고
        // 그 결과를 실행한 프래그먼트가 받을 수 있기 때문

        getFragmentManager().beginTransaction()
                .add(getId(), selectUriFragmnet)
                .addToBackStack(null)
                .commit();

    }
    /*
        6. 실행된 프래그먼트의 결과를 받기 위한 함수를 정의 한다.
            이 함수는 실행된 프래그먼트가 종료 시점에 호출하게 된다.
            따라서 이 함수명을 변경해도 실행된프래그먼트가 변경된 함수를 호출하면 되니
            꼭 onActivityResult함수명을 사용하지 않아도 된다.
            하지만 프래그먼트가 액티비티의 결과를 받는 코드와 동일하게 구조를 일치시키면
            재사용성을 높일 수 있다.
     */
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {

        if(requestCode == REQUEST_CODE_REQUEST_IMAGE_URI &&
                resultCode == Activity.RESULT_OK)
        {
            // 7. 실행된 프래그먼트 Uri 결과를 받아 텍스트뷰에 출력

            String responseUri = data.getStringExtra("ResponseUri");
            TextView tv = (TextView)getView().findViewById(R.id.show_response_image_uri_tv);
            tv.setText(responseUri);
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
}
