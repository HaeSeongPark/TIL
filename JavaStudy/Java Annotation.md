# Java Annotation
## annotation이란
* 컴파일러나 다른 프로그램에 유용한 정보를 주는 일종의 주석?
* '@ ~~~'와 같은 형식으로 사용
* 주석처럼 프로그램 자쳉에는 아무런 영향이 없다.
* 새로운 annotation을 정의할 때는 '메타' annotation을 사용


## 표준애너테이션
애너테이션 | 설명
------------ | -------------
@Override | 컴파일러에게 오버라이딩하는 메서드라는 것을 알린다.
@Deprecated | 앞으로 사용하지 않을 것을 권장하는 대상에 붙인다.
@SuppressWarnings | 컴파일러의 특정 경고메시지가 나타나지 않게 해준다.
@SafeVarargs | 지네릭스 타입의 가변인자에 사용한다.(JDK1.7)
@FunctionalIterface| 함수형 인터페이라스는 것을 알린다.(JDK1.8)
@Native | native메서드에서 참조되는 상수 앞에 붙인다.(JDK1.8)
@Target (메타)|애너테이션이 적용가능한 대상을 지정하는데 사용
@Documented (메타) | 애너테이션 정보가 javadoc으로 작성된 문서에 포함하게 된다.
@Inherited(메타) | 애너테이션이 자손 클래스에 상속되도록 한다.
@Retention(메타) | 애너테이션이 유지되는 범위를 지정하는데 사용
@Repearable(메타) | 애너테이션을 반복해서 적용할 수 있게 한다.(JDK1.8)


### @Override
* 메서드 앞에만 붙일 수 있는 애너테이션
* 조상 메서드를 오버라이딩하는 것이라는 걸 컴파일러에게 알려줌
```java
	class Child extends Parent{
    	@Override
        void parentmethod(){}
   }
   //컴파일러가 같은 이름의 메서드가 조상에 있는지 확인하고 없으면, 에러메시지를 출력
   //실수방지를 위해서 해주는 것 추천
```

### Deprecated
* 더 이상 사용되지 않는 필드나 메서드에 사용
* 대체됐으니 더 이상 사용하지 않는 것을 권하는 의미
```java
	//java.util.Date의 getDate()
    int getDate()
    	Deprecated
        As of JDK version 1.1, replaced by Calendar.get(Calendar.DAY_OF_MONTH)
    //Calendar클래스의 get()을 사용하라는 얘기
    //Deprecated가 붙은 필드나 메서드를 사용하면 소스코드에서 중간줄이 그어진다.
    //왠만하면 사용하지 말길...
```

### FunctionalInterface
* '함수형 인터페이스'를 선언할 때 이 annotation을 붙이면 올바르게 '함수형 인터페이스'를 선언했는지 체크해준다.
```java
	@FunctionalInterface
    public interface Runnalbe{
    	public abstract void run();
    }
```

### SuppressWarnings
* 컴파일러가 보여주는 경고메시지가 나타나지 않게 하는 annotation
* 경고메시지종류
    - deprecation : @Deprecated가 붙은 대상을 상요해서 발생하는 경고 무시
    - unchecked : 지네릭스로 타입을 지정하지 않았을 때 발생하는 경고 무시
    - rawtypes : 지네릭스를 사용하지 않아서 발생하는 경고 무시
    - varargs : 가변인자의 타입이 지네릭 타입일 때 발생하는 경고 무시
```java
	@SuppressWarnings("unchecked")  // 지네릭스와 관련된 경고를 억제
    ArrayList list = new ArrayList(); //지네릭 타입을 지정하지 않았음
    list.addd(obj); // 여기서 경고가 발생
    //복수
    @SuppressWarnings({"deprecation","unchecked","varargs"})
```
* 경고메시지 알아내기

`-Xlint`
`javac -Xlint AnnotationTest.java`

[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/AnnotationEx3.java)
```java
	@SuppressWarnings({"deprecation","unchecked"})
    public static void main(String args[]){
    	...
    }
```

> 위 annotation은 해당 대상에만 애너테이션을 붙여서 경고의 무시범위를 최소화하는게 좋다.

### SafeVarargs
* 메서드에 선언된 가변인자의 타입이 `non-reifialbe`타입일 경우, 해당 메서드를 선언하는 부분과 호출하는 부분에서 "uncheked"경고가 발생. 
* 해당 코드에 문제가 없다면 이 경고를 억제하기 위해 '@SafeVarargs'를 사용
* 이 애넡이션은 생성자와 static이나 final이 붙은 메서드에만 붙일 수 있다. 즉, 오버라이드될 수 있는 메서드에는 상요할 수 없다.
* 컴파일 후에도 제거되지 않는 지네릭 타입을 reifiable타입
* 컴파일 후에 제거되는 지네릭타입을 non-reifialbe타입
* 지네릭 타입 대부분은 컴파일 시에 제거되므로 non-refiable타입
```java
	//java.util.Arrays의 asList()
    //가변인자인 동시에 지네릭 타입
    public static<T> List<T> asList(T...a){
    	return new ArrayList<T>(a) // ArrayList(E[] array)를 호출. 경고발생
        
        //메서드에 선언된 타입T는 컴파일 과정에서 Object로 바뀐다. 즉, Object[]가 된다.
        //Object[]에는 모든 타입의 객체가 들어있을 수 있으므로, 이 배열로 ArrayList<T>를 생성하는 것은 위험하다고 경고
        
        //그러나 asList()가 호출되는 부분을 컴파일러가 체크해서 타입 T가 아닌 다른 타입이 들어가지 못하게 할 것이므로 위의 코드는 문제가 없다.
        //이럴 때 메서드 앞에 '@SafeVarargs'를 붙여서 '이 메서드의 가변인자는 타입 안정성이 있다.'고 컴파일러에게 알려서 경고가 발생하지 않도록 한다.
    }
```
* 가능하면 @SafeVarargs와 @SuppressWarnings를 같이
    - @SafeVarargs를 붙이면, 이 메서드를 호출하는 곳에서 발생하는 경고도 억제
    - 반면 @SuppressWarnings("unchecked")로 경고를 억제하면 메서드가 호추뢰는 곳에도 붙여야 한다.
    - @SafeVarargs로 'unchecked'경고는 억제할 수 있지만, 'varargs'경고는 억제할 수 없다.
 ```java
 	@SafeVarargs         // 'unchecked'경고를 억제
    @SuppressWarnings("varargs") // 'varargs'경고를 억제
    public static<T> List<T> asList(T...a){
    	return new ArrayList<>(a);
  }
 ```
 [[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/AnnotationEx4.java)


## 메타 annotation
* annotation을 위한 annotation
* annotation의 적용대상이나 유지기간을 지정하는데 사용
### @Target
* 애너테이션이 적용가능한 대상을 지정하는데 사용
```java
	@Target({TYPE,FIELD,METHOD,PARAMETER,CONSTRUCTOR, LOCAL_VARIABLE})
    @Retention(RetentionPolicy.SOURCE)
    public @interface SuppressWarnings{
    	String[] value();
   }
```
* 애너테이션 적용대상의 종류
* 
대상 타입 | 의미
------------ | -------------
ANNOTATION_TYPE | 애너테이션
CONSTRUCTOR | 생성자
FIELD | 필드(멤버변수, ENUM상수)
LOCAL_VARIABLE | 지역변수
METHOD |메서드
PACKAGE | 패키지
PARAMETER | 매개변수
TYPE | 타입(클래스, 인터페이스,ENUM_
TYPE_PARAMETER|타입 매개변수(JDK1.8)
TYPE_USE|타입이 사용되는 모든 곳(JDK.18)

```java
	import static java.lang.annotation.ElementType.*;
    
    @Target({FIELD,TYPE,TYPE_USE}) // 적용대상이 FIELD, TYPE, TYPE_USE
    public @interface MyAnnotation{} // MyAnnotation을 정의
    
    @MyAnnotation // 적용대상이 TYPE인 경우
    class MyClass{
    	@MyAnnotaiton // 적용대상이 FIELD인 경우
        int i;
        @MyAnnotation // 적용대상이 TYPE_USE인 경우
        MyClass mc;
   }
```
### @Retention
* 애너테이션이 유지되는 기간을 지정

유지 정책 | 의미
------------ | -------------
SOURCE | 소스 파일엠나 존재, 클래스파일에는 존재하지 않음
CLASS | 클래스 파일에 존재. 실행시에 사용불가. 기본값
RUNTIME | 클래스 파일에 존재. 실행시에 사요요가능

* @Override나 @SuppressWarnings처럼 컴파일러에 의해 사용되는 애너테이션은유지 정책이 SOURCE이다. 컴파일러는 직접 작성할 것이 아니라면, 이 유지정책은 사용할 일이 없다.
```java
	@Target(ElementType.METHOD)
    @Retention(RetentionPolicy.SOURCE)
    public @interface Override{}
```
* 유지 정책을 RUNTIME으로 하면, 실행 시에 '리플렉션'을 통해 클래스 파일에 저장된 애너테이션의 정보를 읽어서 처리 가능
* @FunctionalInterface는 @Override처럼 컴파일러가 체크해주는 애너테이션이지만, 실행 시에도 사용되므로 RUNTIME으로 돼 있다.
```java
	@Documented
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.TYPE)
    public @interface FunctioonalInterface{}
```
### @Documented
* 애너테이션에 대한 정보가 javadoc으로 작성한 문서에 포함되도록 한다.
* 자바에서 제공하는 기본 애너테이션 중에 @Override와 @SuppressWarnings를 제외하고는 모두 붙어있다.
```java
	@Documented
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.TYPE)
    public @interface FunctionalInterface{}
```

### @Inherited
* 애너테이션이 자손 클래스에 상속되도록 한다. '@Inherited'가 붙은 애너테이션을 조상 클래스에 붙이면, 자손 클래스도 이 애너테이션이 붙은 것과 같이 인식
```java 
	@Inherited   //@SupperAnno가 자손까지 영향 미친다.
    @interface SupperAnno{}
    
    @SuperAnno
    class Parent{}
    
    class Child extends Parent{} // Child에 애너테이션이 안 붙었지만, 붙은 것으로 인식
   
```
### @Rpeatable
* 보틍은 하나의 대상에 한 종류의 에너티이션을 붙인다.
* '@Repeatable'이 붙은 애너테이션은 여러 번 붙을 수 있다.
```java
	@Repeatable(ToDOs.class)   //Todo애너테이션을 여러 번 반복해서 쓸 수 있게 한다.
    @interface ToDo{
    	String value();
     }
    //////////////////////
    @ToDO("delete test codes.")
    @ToDo("override inherited methods")
    class MyClass{
    	...
    }
    
    // 같은 이름의 애너테이션이 여러 개가 하나의 대상에 적용될 수 있기 때문에
    // 하나로 묶어서 다룰  수 있는 애너테이션도 추가로 정의
    
    @interface ToDOs{ // 여러 개의 ToDo애너테이션을 담을 컨테이너 애너테이션 ToDos
    	ToDO[] value(); // ToDo애너테이션 배열타입의 요소를 선언. 이름이 반드시 value이어야 함
    }
    @Repeatable(ToDos.class) // 괄호 안에 컨테이너 애너테이션을 지정해야 함
    @interface ToDo{
    	String value();
    }
```

### @Native
* 네이티브 메서드에 의해 참조되는 상수필드에 붙이는 애너테이션
* `@Native public static final long MIN_VALUE = 0x80000000000000000000L;`
* 네이티브 메서드는 jVM이 설치된 OS의 메서드를 말한다.
*  네이티브 메서드는 보통 C언어로 작성된다.
*  자바에서는 메서드의 선언부만 정의하고 구현은 하지 않는다.
```java
	public class Object{
    	private static native void registerNatives(); // 네이티브 메서드
        
    static {
    	registerNatives(); // 네이티브메서드 호출
       }
       
       protected native Object clone() throws CloneNotSupportedException;
       ...
    }
```

## 애너테이션 타입 정의하기
* 애너테이션 사용자 정의
```java
	@interface 애너테이션 이름{
    	타입 요소이름(); // 애너테이션의 요소를 선언
        ....
     }
```
#### 애너테이션의 요소
* 애너테이션 내에 선언된 메서드를 애너테이션의 요소라고 한다.
* 애너테이션에도 인터페이스처럼 상수를 정의할 수 있지만, 디폴트 메서드를 정의할 수 없다.
```java
	@interface TestInfo{
    	int count();
        String testedBy();
        String[] testTools();
        TestType testType(); // enum TestType{FIRST,FIANL}
        DateTime testDate(); // 자신이 아닌 다른 애너테이션(@DateTime)을 포함할 수 있다.
     }
     
     @interface DateTime{
     	Stirng yymmdd();
        String hhmmss();
     }
```
* 애너테이션의 요소는 반환값이 있고 매개변수는 없는 추상 메서드의 형태를 갖는다.
* 애너테이션을 적용할 때 이 요소들의 빠짐없이 지정해야 한다.
* 요소의 이름도 같이 적어주므로 순서는 상관없다.
```java
	@TestInfo{
    	count = 3,
        testedBy="Kim",
        testTools={"JUnit", "AutoTester"},
        testType = TestType.FIRST,
        testDate = @DateTime(yymmdd="160101", hhmmss="235959")
     }
     public class NewClass{...}
```
* 애너테이션의 각 요소는 기본값을 가질 수 있다.
* 기본값으로 null을 제외한 모든 리터널이 가능
```java
	@interface TestInfo{
    	int count() default 1; // 기본값을 1로 지정
    }
    @TestInfor //@TestInfo(count = 1) 과 동일
    public class NewClass {...}
```
* 애너테이션 요소가 하아이고 이름이 value인 경우
```java
	@interface TestInfo{
    	String value();
     }
     @TestInfo("passed") //@TestInfo(value="passed")와 동일
     class NewClass{...}
```
* 요소의 타입이 배열인 경우, 괄호{}를 사용해서 여러 개의 값을 지정할 수 있다.
```java
	@interface TestInfor{
    	String[] testTools();
     }
     
     @Test(testTools="JUnit", "AutoTester"})   // 값이 어러 개
     @Test(testTools="JUnit")   // 값이 하나일 때는 괄호{}생략가능
     @Test(testTools={})        // 값이 없을 때는 괄호{}가 반드시 필요
```
* 기본값을 지정할 때도 마찬가지로 괄호{}를 사용할 수 있다.
```java
@interface TestInfo{
	String[] info() default {"aaa","bbb"}; // 기본값이 여러 개인 경우. 괄호{}사용
    String[] infor2() default "ccc"; // 기본값이 하나인 경우. 괄호 생략가능
	
    @TestInfo     // @TestInfor(info={"aaa","bbb"}, infor2="ccc")와 동일
    @TestInfo(info2={}) //@TestInfo(info={"aaa","bbb"}, info2="ccc")와 동일
    class NewClass{...}
```
### 마커 애너테이션
`public @interface Override{}` 정의된 요소가 하나도 없는 것

### 애너테이션 요소의 규칙
* 요쇼의 타입은 기본형, String, enum, 애너테이션, Class만 허용
* ()안에 매개변수를 선언할 수 없다.
* 예외를 선언할 수 없다.
* 요소를 타입 매개변수로 정의할 수 없다.
```java
	@interface AnnoTest{
    	int id = 100; // OK. 상수 선언. static final int id = 100;
        String major(int i, int j); // 에러. 매개변수를  선언할 수 없음
        String minor() throws Exception; // 에러. 예외를 선언할 수 없음
        ArrayLiist<T> list(); // 에러. 요소를 타입 매개변수로 정의 할 수 없음
```
 [[관련소스5]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/AnnotationEx5.java)











