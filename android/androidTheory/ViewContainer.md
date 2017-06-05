> 출처 : edwith 안드로이드 초급강의 - 한동호강사님

# ViewContainer
*  뷰 컨테이너(View Container)는 다른 View들을 포함하고 있거나 포함할 수 있는 View를 말하며, 일반적으로 ViewGroup을 상속하면서 Layout이 아닌 클래스를 지칭한다. 

## CardView
 * 카드 형태의 모양으로 일관되게 내용을 표현할 수 있는 위젯
 * FrameLayout을 상속받아 만들어졌다.
 * 카드 코너 라운드 설정
    - 레이아웃 : card_view:cardCornerRadius
    - 코드 : CardView.setRadius(float)
 * 카드 백그라운드 설정
    - 레이아웃 : card_view.cardBackgroudColor
    - 코드 : CardView.setCardBackgroundColor(int)
 * 카드 그림자 설정
     - 레이아웃 : card_view.cardElevation
     - 코드 : CardView.setMaxCardElevation(float)
     
> 소스 : https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/res/layout/activity_card_view.xml

## RecyclerView
* 기존 ListView나 gridView의 고정적인 뷰 형태를 벗어나 다양한 형태의 뷰를 만들 수 있도록 고안된 위젯
* 안드로이드 5.0(API 21)에 도입됐음
* ListView나 GridView의 성능 문제를 개선
* 다양한 커스터마이징이 가능함
* 레이아웃을 지정하여 다양한 모양을 표현할 수 있음

![RecyclerView.png](https://github.com/HaeSeongPark/TIL/blob/master/img/android/RecyclerView.PNG)

> 소스 : https://github.com/HaeSeongPark/TIL/tree/master/android/RecyclerView/app/src/main/java/com/rhino/study/recyclerview


## ViewFlipper
* 여러 화면을 한 화면에서 볼 수 있게 해주는 컨테이너
> 소스 : https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ViewFlipperActivity.java

## ViewPager
* 여러 화면을 한 화면에서 볼 수 있게 해주는 컨테이너
> 소스 : https://github.com/HaeSeongPark/TIL/blob/master/android/TouchEvent/app/src/main/java/com/rhino/study/touchevent/ViewPagerActivity.java
