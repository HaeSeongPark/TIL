# Activity
* 액티비티는 사용자 인터페이스 화면을 관리하는 컴포넌트이다.
* 액티비티 역할을 하기 위해서는 액티비티 클래스를 상속해야 하며,
* 액티비티가 기본적으로 가지고 있는 생명주기 메소드를 재정의해서 원하는 기능을 구현해야 한다.
```java
    public class HelloWorld extends Activity {
        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.main);
        }
    }
```
* 액티비티의 onCreate() 메소드에서는 setContentView() 메소드를 호출하고 있다. setContentView() 메소드는 주어진 R.layout.main을 가지고 화면 구성을 한다. 

## 액티비티 특징
* 액티비티의 크기는 상태바(Status Bar) 영역을 제외한 화면 전체로 고정
* 원하는 위치에 원하는 크기로 변경할 수 없음
* 두 개의 액티비티를 동시에 보여줄 수 없음
* 다른 애플리케이션의 액티비티를 불러낼 수 있음
* 액티비티 내에는 프래그먼트를 추가하여 화면을 분할하여 별도로 조작할 수 있음

## 액티비티의 생명주기
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/Activity_lifecycle.jpg)

메소드 | 설명  | 다음 메소드 
------------ | ------------- | ----------
onCreate()| 액티비티가 생성될 때 사용자 인터페이스 초기화에 사용  | onStart()
onRestart() | 액티비티가 멈췄다가 다시 시작되지 바로 전에 호출 됨  | onStart()
onStart() | 액티비티가 사용자에게 보여지기 바로 직전에 호출 | onResume() 또는 onStop()
onResume() | 액티비티가 사용자와 상호작용하기 바로 전에 호출 | onPaause()
onPause() | 다른 액티비티가 보여질 때 호출됨. 데이터 저장, 슬레드 중지 등의 처리를 하기에 적당한 메소드 | onResume() 또는 onStop()
onStop() | 액티비티가 더이상 사용자에게 보여지지 않을 때 호출됨. 메모리가 부족할 경우에는 onStop() 메소드가 호출되지 않을 수도 있음 | onRestart()또는 onDestory()
onDestroy() | 액티비티가 소멸될 때 호출됨. finish() 메소드가 호출되거나 시스템이 메모리 확보를 위해 액티비티를 제거할 때 호출됨 | 없음

* onStop(), onDestroy()는 호출되지 않을 수도 있음

## 액티비티 종류
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/kindOfActivity.PNG)
