> 출처 : edwith 안드로이드 초급강의 - 한동호강사님

# 툴바
* Toolbar was introduced in Android Lollipop, API 21 release and is the spiritual successor of the ActionBar. It's a ViewGroup that can be placed anywhere in your XML layouts. Toolbar's appearance and behavior can be more easily customized than the ActionBar. - code path
* 툴바는 안드로이디 롤리팝(API21)때 만들어 졌고 툴바는 액션바의 정신적인(?) 후속작입니다. 
* 툴바는 뷰 그룹입니다. 놓여질 수 있는 어디에나 여러분의 XML layout에 툴바의 외형과 행동은 쉽습니다 커스터마이징(개인화 자기 마음에 들게 하는 거) actionBar보다.앱 화면 맨 위에 제목영역?

## 툴바 추가하는 방법
### 순서
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EB%A5%BC%20%EC%B6%94%EA%B0%80%ED%95%98%EB%8A%94%20%EB%B0%A9%EB%B2%95.PNG)

### 0. 라이브러리추가(기본적으로 최신으로 돼 있음, 없으면 추가)

![라이브러리추가](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%951.PNG)

### 1. 액션바제거
* 기본적으로 액션바가 설정돼 있습니다. 
* 5.0 부터는 이 액션바를 제거할 수 있습니다.

![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%952.PNG)

### 2. 툴바를 포함한 app_bar.xml작성
* 액션바 자리에 올 툴바 레이아웃을 작성
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%953.PNG)

### 3. layout.xml에서 `<include>`를 사용하여 툴바를 추가
* 해당 액티비티 레이아웃에 버튼 배치 하듯이 toolbar를 include해서 배치

![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%954.PNG)

### 4. 액티비티에서 findViewById를 사용하여 툴바 객체 생성
* 버튼 가져오는 것과 같이 툴바를 가져와서

### 5. 생성한 객체를 setSupportActionBar()메소드의 인자로 지정하여 호출
* 액션자리에 툴바를 사용한다고알려줌
 
### 6. 툴바 객체나 getSupportActionBar()를 사용해서 속성 수정
* 5에서 직접 만든 툴바를 action바로 등록했으니 기존에 action바로 했던 기능들을 사용할 수 있음
* getSupportActionBar().setDisplayHomeAsUpEnabled(true); 는 뒤로가기(<-)버튼 누르면 홈으로 이동하는 기능 적용한 것

![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%955_1.PNG)

![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/%ED%88%B4%EB%B0%94%EC%B6%94%EA%B0%80%EB%B0%A9%EB%B2%955_2.PNG)

### toolbar_menu.xml
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/toolbar_menu.xml.PNG)


### 결과
![](https://github.com/HaeSeongPark/TIL/blob/master/img/android/videotogif_2017.05.28_16.33.05.gif)
