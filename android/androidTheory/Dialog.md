> 출처 : edwith 안드로이드 초급강의 - 한동호강사님

# Dialog

* 토스트처럼 사용자의 시야를 가리는 팝업창
* 다이얼로그는 토스트와는 다르게 사용자의 선택을 기다리므로 사용자가 반드시 어떤 반응을 해야 한다.
* 기본적으로 다이얼로그는 타이틀과 메시지 그리고 버튼으로 구성
* 사용자가 꼭 봐야 하고 의견을 물어볼경우
* 간단한 메시지를 보여줘야하느 경우는 토스트 (사용자가 보지 않아도 되지만 보면 좋을 때)
* SMS통지는 지금 안 봐도 되지만 나중에 한 번 꼭 확인 해야하는 것
* 기본 Dialog
* [[DialogActivity.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/DialogActivity.java)
* [[DialogList]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/Dialog2Activity.java)

```android
	Toast.makeText(Dialog2Activity.this, "cars : " + cars[i], Toast.LENGTH_SHORT).show();
```

* Dialog2Activity.this 여기는 context가 들어가는 자리 context는 activity가 가지고 있다.


* [[LoginDialog]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/LoginDialogActivity.java)
```android
	LayoutInflater vi = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    LinearLayout loginLayout = (LinearLayout)vi.inflate(R.layout.logindialog,null);
    
    final EditText id = (EditText)loginLayout.findViewById(R.id.edit_id);
    final EditText pw = (EditText)loginLayout.findViewById(R.id.edit_pw);
 ```
 * 그냥 findVoiewById가 아니라 인플레이트(xml을 객체로)한 loginLayout.findViewById임
