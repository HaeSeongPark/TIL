package com.rhino.study.thisisanroid;

import android.app.Fragment;
import android.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import static android.R.attr.id;

// ① 백스택 변화를 감지하는 리스너 인터페이스를 상속받는다.
public class MainActivity extends AppCompatActivity implements FragmentManager.OnBackStackChangedListener{

    TextViewerFragment mTextViewerFragment = null;
    ImageViewerFragment mImageViewerFragment = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.e("rhino","Activity onCreate()");

        // ① 액티비티에 사용될 레이아웃을 생성한다. 레이아웃 좌측 영역에 배치될
        //    메뉴 리스트 프래그먼트는 액티비티 레이아웃 XML에 정적으로 정의되어
        //    있어서, 액티비티 레이아웃 생성시 같이 생성 및 추가된다.
        setContentView(R.layout.activity_main);


        mTextViewerFragment = TextViewerFragment.newInstance();
        mImageViewerFragment = ImageViewerFragment.newInstance();
        // ① 프래그먼트를 remove 해버리면 findFragmentById, findFragmentByTag 함수
        //    등으로 찾을 수 없다. 따라서 한번 생성한 프래그먼트를 참조할 수 있도록
        //    멤버 변수로 저장해둬야한다.
        // -----------------------------------------
        //    hide 추가
        //    액티비티 레이아웃 우측에 나타날 수 있는 뷰어 프래그먼트를 미리 추가하고,
        //    당장 보여지지 말아야 할 추가한 프래그먼트는 감춘다.

        //   태그 추가
        //   ① 프래그먼트를 생성하고 추가할 때, add 함수의 세 번째 인자로 프래그먼트
        //   태그를 설정한다.
//        getFragmentManager()
//                .beginTransaction()
//                .add(R.id.viewer_fragment_container, textViewerFragment,"Text_VIEWER")
//                .add(R.id.viewer_fragment_container, imageViewerFragment,"IMAGE_VIEWER")
//                .remove(imageViewerFragment)
////                .hide(mImageViewerFragment)
////                .detach(mImageViewerFragment)
//                .commit();


        // savedInstanceState 번들이 널이라는 것은 해당 앱이 강제 종료 후
        // 재시작된 것이 아니라는 의미다. 따라서 이 경우 화면 좌측의 텍스트뷰어
        // 프래그먼트를 추가해준다.
        // 참고로 만일 savedInstanceState 번들이 널이 아니라면 강제 종료 후
        // 재시작하는 과정이므로 텍스트뷰어 프래그먼트를 추가하면 안된다.
        // 그 이유는 프래그먼트매니저가 자동으로 해당 프래그먼트를 생성 후 추가해주기
        // 때문이다.
        if(savedInstanceState == null) {
            //  최초 보여질 텍스트뷰어 프래그먼트만 추가해둔다.
            getFragmentManager().beginTransaction()
                    .add(R.id.viewer_fragment_container, mTextViewerFragment, "TEXT_VIEWER")
                    .commit();
        }

        // ③ 액티비티 레이아웃 좌측에 리스트 메뉴 프래그먼트에서 아이템을 선택했을 때
        //    이벤트를 처리하기 위한 리스너를 구현 및 등록한다.
        ListMenuFragment listMenuFragment = (ListMenuFragment)
                getFragmentManager().findFragmentById(R.id.menu_fragment);

        listMenuFragment.setOnListItemClickListener(new ListMenuFragment.OnListItemClickListener()
        {
            @Override
            public void onItemClick(int itemType)
            {
                // ④ 액티비티 우측 영역 프래그먼트 컨테이너에 현재 보여지고 있는
                //    프래그먼트를 참조한다. 만일 선택된 아이템이 현재 보여지고 있는
                //    프래그먼트라면 아무 처리도 하지 않고 끝내고, 아니라면
                //    보여줘야 할 프래그먼트를 생성해둔다.
//                Fragment fragment = getFragmentManager().findFragmentById(R.id.viewer_fragment_container);


                // ② 특정 프래그먼트를 숨기거나 보이기 위해 각 프래그먼트 객체를
                //    찾고, 프래그먼트 객체를 반환받는다.


//                TextViewerFragment textViewerFragment = (TextViewerFragment)getFragmentManager()
//                        .findFragmentByTag("Text_VIEWER");
//                ImageViewerFragment imageViewerFragment = (ImageViewerFragment)getFragmentManager()
//                        .findFragmentByTag("IMAGE_VIEWER");
                //  remove한 프래그먼트는 찾을 수 없다. 따라서 주석처리한다.

                if(itemType == ListMenuFragment.ITEM_TYPE_TEXT_VIEWER &&
                        mTextViewerFragment.isVisible() == false)
                // 연속으로 중복된 프래그먼트 트랜잭션이 수행되지 않도록 수정
                {
                    getFragmentManager()
                            .beginTransaction()
                            .replace(R.id.viewer_fragment_container,mTextViewerFragment)
//                            .hide(imageViewerFragment)
//                            .show(textViewerFragment)
//                            .detach(imageViewerFragment)
//                            .attach(textViewerFragment)
//                            .addToBackStack("TEXT_VIEWER_BACKSTACK")
                            // ④ 백스택에 추가하지 않도록 주석처리한다
                            .commit();
                }
                else if (itemType == ListMenuFragment.ITEM_TYPE_IMAGE_VIEWER &&
                        mImageViewerFragment.isVisible() == false)
                // 연속으로 중복된 프래그먼트 트랜잭션이 수행되지 않도록 수정
                {
                    getFragmentManager()
                            .beginTransaction()
                            .replace(R.id.viewer_fragment_container,mImageViewerFragment)
//                            .hide(textViewerFragment)
//                            .show(imageViewerFragment)
//                            .detach(textViewerFragment)
//                            .attach(imageViewerFragment)
//                            .addToBackStack("IMAGE_VIEWER_BACKSTACK")
                            // ④ 백스택에 추가하지 않도록 주석처리한다
                            .addToBackStack(null)
                            .commit();

                }

//                // ⑤ 선택된 아이템에 해당하는 프래그먼트를 액티비티 우측에 배치한다.
//                getFragmentManager()
//                        .beginTransaction()
//                        .replace(R.id.viewer_fragment_container,fragment)
//                        .commit();
            }
        });
//      ③ 백스택 변화를 감지하는 리스너를 등록한다.
        getFragmentManager().addOnBackStackChangedListener(this);
    }
// ② 백스택 변화를 감지하는 리스너의 핸들러 함수를 구현한다
    @Override
    public void onBackStackChanged() {
        Toast.makeText(getApplicationContext(),
                        "Changed BackStack \n "
                        + "BackStack Enty Count : "
                        + getFragmentManager().getBackStackEntryCount(),Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onDestroy() {
        // ④ 등록된 백스택 리스너를 해제한다.
        getFragmentManager().removeOnBackStackChangedListener(this);
        Log.e("rhino","Activity onDestroy()");
        super.onDestroy();
    }

    @Override
    protected void onStart() {
        Log.e("rhino","Activity onStart()");
        super.onStart();
    }

    @Override
    protected void onRestart() {
        Log.e("rhino","Activity onReStart()");
        super.onRestart();
    }

    @Override
    protected void onResume() {
        Log.e("rhino","Activity onResume()");
        super.onResume();
    }

    @Override
    protected void onPause() {
        Log.e("rhino","Activity onPause()");
        super.onPause();
    }

    @Override
    protected void onStop() {
        Log.e("rhino","Activity onStop()");
        super.onStop();
    }
}
