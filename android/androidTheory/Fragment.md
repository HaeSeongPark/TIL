> 출처 : edwith 안드로이드 초급강의 - 한동호강사님

# Fragment
![fragment](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment.PNG)

![fragment2 하위 클래스와 관련클래스](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment2.PNG)

![fragment 액티비티에 추가하는 두 가지 방법.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment%20%EC%95%A1%ED%8B%B0%EB%B9%84%ED%8B%B0%EC%97%90%20%EC%B6%94%EA%B0%80%ED%95%98%EB%8A%94%20%EB%91%90%20%EA%B0%80%EC%A7%80%20%EB%B0%A9%EB%B2%95.PNG)

* 액티비티 내에서 독자적으로 동작할 수 있는 UI컴포넌트
* 작은 activity
## 특징
* 프래그먼트는 작은 액티비티이면서 액티비티 안에서 동작한다.
1. 프래그먼트는 액티비티와 분리해서 사용할 수 없다.
2. 프래그먼트는 액티비티의 생명주기 내에서 자신만의 생명주기를 가진다.
3. 액티비티가 중지됐다면 액티비티 내의 프래그먼트는 다시 시작할 수 없다.
4. 액티비티가 파기됐다면 액티비티 내의 프래그먼트들은 모두 파기된다.
5. 프래그먼트는 필요할 때 생성할 수 있으며 상태를 저장하고 복원할 수 있다.
6. Fragment 클래스의 모든 하위 클래스는 인자가 없는 public 생성자를 가지고 있어야 한다.(없으면 플래그먼트 상태 복원 시 런타임 예외가 발생할 수 있다.
7. 프래그먼트는 자신의 상태와 백스택을 가진다.
8. 프래그먼트는 UI없이도 존재할 수 있다.
9. 인자가 없는 public 생성자는 개발자가 임의로 생성자를 추가하지 않을 경우 자동 선언되는 디폴트 생성자
10. 백스택은 백 버튼을 클릭했을 때 보여줄 이전 프래그먼트를 저장하는 공간을 의미 

## 기본
[[FraggmentActivity.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity.java)
[[FraggmentActivity1.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity1.java)
[[FraggmentActivity2.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity2.java)

## 액티비티에서 프래그먼트에 데이터 전달하기
![fragment3](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment3%20%EC%95%A1%ED%8B%B0%EB%B9%84%ED%8B%B0%EC%97%90%EC%84%9C%20%ED%94%84%EB%9E%98%EA%B7%B8%EB%A8%BC%ED%8A%B8%EC%97%90%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%84%EB%8B%AC.PNG)
[[FraggmentActivity3.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity3.java)
[[ArrayListFragment3.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ArrayListFragment3.java)
## 프래그먼트에서 액티비티에 이벤트 전달
![fragment4 프래그먼트에서 액티비티에 이벤트 전달하기.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment4%20%ED%94%84%EB%9E%98%EA%B7%B8%EB%A8%BC%ED%8A%B8%EC%97%90%EC%84%9C%20%EC%95%A1%ED%8B%B0%EB%B9%84%ED%8B%B0%EC%97%90%20%EC%9D%B4%EB%B2%A4%ED%8A%B8%20%EC%A0%84%EB%8B%AC%ED%95%98%EA%B8%B0.PNG)
[[FraggmentActivity4.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity4.java)
[[ArrayListFragment4.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ArrayListFragment4.java)

## 한 개의 액티비티에 두 개의 프래그먼트
* 태블릿은 기본적으로 가로모드이다.
* [[FraggmentActivity5.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity5.java)
* [[TitlesFragment.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/TitlesFragment.java)
* [[DetailsFragment.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/DetailsFragment.java)
* [[BokkInfo.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/BookInfo.java)
* [[detail_view.xml]]()

## 프래그먼트로 태블릿(가로), 폰(세로) 동시 지원
![fragment5 프래그먼트를 사용하여 태블릿과 폰을 동시에 지원하기.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment5%20%ED%94%84%EB%9E%98%EA%B7%B8%EB%A8%BC%ED%8A%B8%EB%A5%BC%20%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC%20%ED%83%9C%EB%B8%94%EB%A6%BF%EA%B3%BC%20%ED%8F%B0%EC%9D%84%20%EB%8F%99%EC%8B%9C%EC%97%90%20%EC%A7%80%EC%9B%90%ED%95%98%EA%B8%B0.PNG)
* FraggmentActivity5.java의 xml 세로모드 하나 더 생성
* TitlesFragment.java 가로세로모드일 때 나누서 코딩
* [[FraggmentActivity5.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/FragmentActivity5.java)
* [[TitlesFragment.java]](https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/TitlesFragment.java)


## 프래그먼트의 백스택
![프래그먼트의 백스택](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment6%20%EB%B0%B1%EC%8A%A4%ED%83%9D.PNG)

## 프래그먼트 생명주기
![fragment7 프래그먼트 생명주기.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/android/fragment7%20%ED%94%84%EB%9E%98%EA%B7%B8%EB%A8%BC%ED%8A%B8%20%EC%83%9D%EB%AA%85%EC%A3%BC%EA%B8%B0.PNG)

