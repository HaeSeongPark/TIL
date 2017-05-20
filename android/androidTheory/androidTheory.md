> 단계별 예제로 배우는 안드로이드 4.0 참조

> 그 외 참조는 따로 표시

# androidTheory
* 4대 컴포넌트
  - activity, service, broadcast receiver, content provider
  - 이 외에 인텐트 프레그먼트도 중요

## Activity
 * 사용자 인터페이스 화면을 구성한 컴포넌트
 
## Service
* 백그라운드에서 실행되는 컴포넌트. 시각적인 사용자 인터페이스를 가지지 않음

## broadcast Receiver
* 배터리 부족, 언어 설정 변경 등의 특정 브로드캐스트를 수신하거나 반응하는 컴포넌트.
* 시각적인 사용자 인터페이스를 가지지 않음

## Content Provider
* 어플리케이션 간의 ㄷ이터 공유를 위해 표준화된 인터페이스를 제공하는 컴포넌트

## widget 위젯
* 사용자의 스마트폰 홈화면에서 유저와 소통하는 장치(?), 앱의 데이터나 기능을 간단히 보여주는 용도로 사용됨

## 뷰컨테이너
 * View Container는 다른 View들을 포함하고 있거나 포함할 수 있는 View를 말하며,
 * 일반적으로 ViewGroup을 상속하면서 Layout이 아닌 클래스를 지칭

## 레이아웃
* 다른 View를 포함해서 화면을 구성할 수 있는 클래스를 지칭하며,
* 일반적으로 ViewGroup을 상속하며 클래스 이름이 Layout으로 끝나는 뷰를 말한다.


## 토스트
* A toast provides simple feedback about an operation in a small popup. - developer.andriod. api 가이드
* 토스트는 제공합니다. 간단한 피드백을 ~대해 동작에 작은 popup창에서
* 토스트는 작은 pop창안에서 동작에 대해 간단한 피드백을 제공합니다.

## 스낵바
* 토스트랑 비슷한 거 같은데, 안드로이드5.0때 도입된 Material Design에 하나인 듯, 
* 토스트는 단순 알림이라고 하면, 스낵바는 알림 + 기능(알림에서 버튼을 누를 수 있다든지 하는)

## 다이얼로그
* 대화상자는 사용자에게 결정을 내리거나 추가 정보를 입력하라는 프롬프트를 보내는 작은 창
* 프롬프트 : 입력대기하는 뭐 그런...


## intent
* 컴포넌트에 액션, 데이터 등을 전달하는 메시지 컴포넌트

## intent Filter
* 수신할 수 있는 인텐트를 정의하여 컴포넌트를 정의하는 역할을 하는 컴포넌트

## 툴바
* Toolbar was introduced in Android Lollipop, API 21 release and is the spiritual successor of the ActionBar. It's a ViewGroup that can be placed anywhere in your XML layouts. Toolbar's appearance and behavior can be more easily customized than the ActionBar. - code path
* 툴바는 안드로이디 롤리팝(API21)때 만들어 졌고 툴바는 액션바의 정신적인(?) 후속작입니다. 
* 툴바는 뷰 그룹입니다. 놓여질 수 있는 어디에나 여러분의 XML layout에 툴바의 외형과 행동은 쉽습니다 커스터마이징(개인화 자기 마음에 들게 하는 거) actionBar보다.앱 화면 맨 위에 제목영역?

## 프레그먼트
* 액티비티 내에서 독자적으로 동작할 수 있는 UI컴포넌트


## Notification
* 사용자에게 특정 이벤트를 알리는 컴포넌트

