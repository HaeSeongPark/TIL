> 출처 : 자바의 정석

# Java.lang.ObjectClass

## 1.1 Object클래스
* 단 11개의 메서드만 가지고 있는 모든 클래스의 최고 조상.
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch9_java.lang/java.lang.ObjectClass_methods.png)

### 1.2 equals(Object obj)
* 객체 자신과 주어진 객체(obj)를 비교한다. 같으면 true, 다르면 false.
* Object클래스의 정의된 equals()는 참조변수 값(객체의 주소)을 비교한다.
* 따라서 적절히 오버라이딩해서 작성해야 한다.
```java
	public boolean equals(Object obj){
    	return (this==obj);
   }
   ---------------오버라이딩
   class Person{
   	long id;
    
    public  boolean equals(Object obj){
    	if(obj!=null && obj instanceof Person){
           // obj가 Object타입이므로 id값을 참조하기 우해서는 Person타입으로 형변환이 필요
           return id == ((Person)obj).id;
         } else {
         	// 타입이 Person이 아니면 값을 비교할 필요도 없다.
            return false;
        }
   }
   
   Person(long id){
   	this.id = id;
    }
 }
```
### 1.3 hashCode()
* 해싱기법에 사용되는 '해시함수'를 구현한 것
* 객체의 해시코드(int타입의 정수)를 반환하는 메서드
* 다량의 데이터를 저장&검색하는 해싱기법에 사용된다.
* Object클래스의 hashCode()는 객체의 내부주소를 반환
```java
	public class Object{
       ...
    public native int hashCode();
  }
```
* equals()를 오버라이딩하면, hashCode()도 같이 오버라이딩 해야한다.
* equals()이 결과가 true인 두 객체의 hashCode는 같아야 하기 때문
* String 클래스는 문자열의 내용이 같으면 동일한 해시코드를 반환하도록 오버라이딩돼 있다.
* System.identityHashCode(Object obj)는 Object클래스의 hashCode메서드처럼 객체의 주소값으로 해시코드를 생성하기 때문에 모든 객체에 대해 항상 다른 해시코드값을 반환

```java
	String str1 = new String("abc");
    String str2 = new String("abc");
    print(str1.equals(str2)); // true
    print(str1.hashCode()); // 96354
    print(str2.hashCode()); // 96354
    print(System.identityHashCode(str1)); 27134973 // 이 값은 실행할때마다 달라질 수 있다.
    print(System.identityHashCode(str2)); 1284693
```

### 1.4 toString()
* 객체의 정보를 문자열(String)로 제공할 목적으로 정의된 메서드
```java
	public String toString(){
    	return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }
```
* 적절히 오버라이딩해서 써야 한다.
```java
	// 오버라이딩할 때 접근제어자 주의!!!
    // Object클래스의 toString메서드의 접근제어자가 public이므로
    // 무조건 public으로, 조상 메서드를 오버라이딩 할 때 접근제어자는 접근 범위가 같거나 넓게...
    public String toString(){
    	return "kind : " + kind + ", number : " + number;
     }
```

### 1.5 clone()
* 객체 자신을 복제(clone)해서 새로운 객체를 생성하는 메서드
* Cloneable 인터페이스를 구현한 클래스의 인스턴스만 복제할 수 있다.
* Object클래스에 정의된 clone()은 인스턴스변수의 값만을 복제한다.
* 인스턴스가 참조형일 때, 참조하는 객체도 복제되게 오버라이딩해야함!!!(1.7 얕은 복사와 깊은 복사 참조)
* clone()을 사용하려면, 먼저 복제할 클래스가 Cloneable인터페이스를 구현해야 하고,
* clone()을 오버라이딩하면서 접근 제어자를 protected에서 public으로 변경해야 한다.
* 그래야만 상속관계가 없는 다른패키지의 다른 클래스에서 clone()을 호출 할 수 있다.
```java
	public class Object{
    	 ...
         protected native Object clone() throws CloneNotSupportedException;
         ...
    }

	class Point implements Cloneable{
    	...
        public Object obj = null;
        try{
        	obj = super.clone();
        } catch(CloneNotSupportedException e){}
        return obj;
    }
```
* 인스턴스의 데이터를 보호하기 위해서 사용
* Cloneable인터페이스가 구현돼 있다는 것은 크래스 작성자가 복제를 허용한다는 의미.

### 1.6 공변 반환타입
* JDK1.5부터 '공변 반환타입'이 추가 됐다.
* 오버라이딩할 때 조상메서드의 반환타입을 자손 클래스의 타입으로 변경하는 것
```java
	public Point clone(){
    	Object obj = null;
        try {
        	obj = super.clone();
        } catch ( CloneNotSupportedException e){}
        return (Point)obj;
    }
    								     공변반환타입
    Point copy = (Point)original.clone();  --> Point copy = original.clone();
```
* 배열, java.util 패키지의 Vector, ArrayList, LinkedList, HashSet, TreeSet, HashMap, ThreeMap, Calendar, Date와 같은 클래스들이 이와 같은 방식으로 복제가 가능하다.

### 1.7 얕은 복사와 깊은 복사
* 객체를 복사할 때 원본과 복제본이 같은 객체를 공유하는 것 : 얕은 복사
    - 원본을 변경하면 복사본도 변경
* 객체를 복사할 때 원본이 참조하고 있는 객체까지 복제하는 것 : 깊은 복사
    - 원본을 변경해도 복사본에는 영향이 없음
```java
	// 얕은 복사
    public Circle shallowCopy(){
    	Object obj = null;
        try{
        	obj = super.clone();
        } catch ( CloneNotSupportedException e){}
        
        return (Circle)obj;
  }
  // 깊은 복사
    public Circle shallowCopy(){
    	Object obj = null;
        try{
        	obj = super.clone();
        } catch ( CloneNotSupportedException e){}
        
        Circle c = (Circle(obj;
        c.p = new Point(this.p.x, this.p.y);
        return c;
  }
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.ObjectClass.shallowdeep.png)

### 1.8 getClass()
* 자신이 속한 클래스의 Class객체를 반환하는 메서드
* Class 객체는 클래스의 모든 정보를 담고 있으며, 클래스당 단 1개만 존재
* 클래스파일(*.class)이 메모리에 로드될 때 생성

![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch9_java.lang/classLoader.png)

* 클래스로더
   - 클래스로더는 실행 시에 필요한 클래스를 동적으로 메모리에 로드하는 역할
   - 클래스 파일을 읽어서 사용하기 편한 형태로 저장해 놓은 것이 클래스 객체
   
* Class객체를 얻는 방법
```java
	Class cObj = new Card().getClass(); // 생성된 객체로 부터 얻는 방법
    Class cObj = Card.class; // 클래스 리터럴(*.class)로 부터 얻는 방법
    Class cObj = Class.forName("Card");
```

* Class객체를 이용하면 클래스에 정의된 멤버의 이름이나 개수 등. 클래스에 대한 모든 정보를 얻을 수 있기 때문에 Class객체를 통해서 객체를 생성하고 메서드를 호출하는 등 보다 동적인 코드를 작성할  수 있다.
```java
	Card c = new Card(); // new 연산자를 이용해서 객체 생성
    Card c = new Card.class.newInstance(); // Class객체를 이용해서 객체 생성
    // newInstance()는 InstantiationException을 발생할 수 있으므로 예외처리가 필요하다.
```
* 동적으로 객체를 생성하고 메서드를 호출하는 방법에 대해 더 알고 싶다면, 'reflection API'검색
* Java API문서에서 Class클래스를 찾아보면 클래스의 정보를 얻을 수 있는 많은 메서드가 정의돼 있다.



