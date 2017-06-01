> 출처 : edwith 안드로이드 초급강의 - 한동호강사님

# Toast
* A toast provides simple feedback about an operation in a small popup
* basic Toast
* [[ToastActivity.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ToastActivity.java)
* setGravity
* ![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/Toast.setGravity.PNG)
* [[ToastLayoutActivity.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ToastLayoutActivity.java)
* context
   - 가장 중요한 데이터를 가지고 있는 집합체
   - context를 넣어줘야 뷰를 생성할 수 있음
   - 보통 this에 들어가는 자리가 context자리
   - context는 액티비티, 서비스, 콘텐트프로바이드, 리시버가 가지고 있음
* 인플레이션
   - ![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/Inflation.PNG)
   - xml를 익어서 자바에서 쓸 수 있게 객체화 해준다.
   - findViewById도 내부적으로 인플레이션을 사용
   - findViewById는 안드로이에서 자동으로 해준다.
   - 우리가 새로 만든 xml은 인플레이션을 사용해서 가져와야 한다.
