> 출처 :  https://kairo96.gitbooks.io/android/ch2.8.html
# Intent
* 컴포넌트에 액션 데이터 등을 전달하는 메시지 객체
## Intent 객체의 구성요소
* Action(액션) : 수행할 액션 이름(ex : ACTION_DIAL)
* Data(데이터) : 수행할 데이터의 URI(ex : tel:)
* Category(카테고리) : 수행할 액션에 대한 추가적인 정보
* Type(타입) : 수행할 인텐트 데이터의 명시적인 타입(MIME 타입)(video/mpeg)
* Component name(컴포넌트 이름) : 대상 컴포넌트의 완전한 클래스 이름
* Extras(추가 정보) : 인텐트를 다루는 컴포넌트에 추가적으로 전달할 한 쌍의 키/값
* 이 구성요소들을 활용하면 다른 애플리케이션의 액티비티를 실행하거나 데이터를 전달해줄 수 있다.
* 이 중에서 가장 중요한 요소는 Action이다. 액션은 액티비티와 브로드캐스트 액션으로 구분할 수 있다.
* ![intent_action](https://github.com/HaeSeongPark/TIL/blob/master/img/android/Intent_Actions.PNG)
* 참고로, conent://contacts/people/1는 주소록에서 식별자가 1인 사람에 대한 정보를 가리키며
* tel:0101234568는 전화번호 0101235678을 가리킨다.
* 다음 코드는 인텐트를 사용해서 데이터를 전달하고 받는 코드
```java
// 인텐트 전달
Intent intent = new Intent(this, IntentCallee.class);  
intent.putExtra("name", "gildong");  
intent.putExtra("age", 30);  
startActivity(intent);

// 인텐트 수신
Intent intent = getIntent();  
String name = intent.getStringExtra("name");  
int age = intent.getIntExtra("age", 20);
```
> 더 자세한 사항 : http://developer.android.com/reference/android/content/Intent.html

## IntentFilter
* 특정 인텐트를 받을지 말지를 정의하는 역할을 수행
* 인텐트 필터에 android.intent.action.MAIN와 android.intent.category.HOME을 선언하면
* 해당 컴포넌트는 홈 애플리케이션이 돼 디바이스가 시작될 때 자동으로 시작될 수 있는 애플리케이션이 된다.
* AndroidManifest.xml를 보면 intent-filter의 사용예를 볼 수 있음
> 더 자세한 사항 : https://kairo96.gitbooks.io/android/ch2.8.html
