# java.lang 패키지 Object Class
> java.lang패키지는 자바프로그래밍에 가장 기본이 되는 클래스들을 포함하고 있다. 그렇기 때문에 java.lang패키지의 클래스들은 import문 없이도 사용할 수 있다.

1 Object클래스
   * 모든 클래스의 최고 조상. 오직 11개의 메서드만을 가지고 있다.
   * notify(), wait() 등은 쓰레드와 관련딘 메서드이다.
   * equals(), hashCode(), toString()은 적절히 오버라이딩해야 한다.

Object클래스의 메서드 | 설 명
------------ | -------------
protected Object clone()| 객체 자신의 복사본을 반환
public boolean equals(Object obj)| 객체 자신과 객체 obj가 같은 객체인지 알려준다.(같으면 true)
protected void finalize()|객체가 소멸될 때 가비지 컬렉터에 의해 자동적으로 호출된다.  이때 수행돼야하는 코드가 있는 경우에만 오버라이딩한다.
public Class getClass()|객체 자신의 클래스 정보를 담고 있는 Class인스턴스를 반환
public int hashCode()|객체 자신의 해시코드를 반환한다.
public String toString()|객체 자신의 정보를 문자열로 반환
public void notify()|객체 자신을 사용하려고 기다리는 쓰레드를 하나만 깨운다.
public void notifyAll()|객체 자신을 사용하려고 기다리는 모든 쓰레드를 깨운다.
public void wait() | 다른 쓰레드가 notify()나 notifyAll()을 호출할 때까지 현재 쓰레드를 무한히 또는 지정된 시간(timeout, nanos)동안 기다리게 한다.
public void wait(long timeout)|  timeout은 천 분의 1초
public void wait(long timeout, int nanos)|   timeout은 천 분의 1초, nanos는 10의 9승 분의 1초

2 equals(Object obj)
 * 객체 자신과 주어진 객체(obj)를 비교한다. 같으면 true, 다르면 false
 * Object클래스에 정의된 equals()는 참조변수 값(객체의 주소)을 비교
 ```java
 	public boolean equals(Object obj){
    	return (this==obj);
    }
 ```
 * equals()를 오버라이딩해서 인스턴스변수의 값을 비교하도록 바꾼다.
 * 객체의 주소가 아닌 객체의 멤버변수 id를 비교(ex. 주민번호)
 ```java
 class Person{
 	long id;
 	public boolean equals(Object obj){
    	if(obj!=null && obj instanceof Person)
        	return id == ((Person)obj).id;
        else
        	return false;
       }
   }
 ```
 
 3 hashCode()
 * 객체의 해시코드(int타입의 정수)를 반환하는 메서드(해시함수)
 * 다량의 데이터를 저장&검색하는 해싱기법에 사용된다.
 * Object클래스의 hashCode()는 객체의 내부주소를 반환한다.
```java
   public class Object{
   	public native int hashCode();
  ```
  * equals()를 오버라이딩하면, hashCode()도 같이 오버라이딩 해야한다. 
  * equals()의 결과가 true인 두 객체의 hash code는 같아야 하기 때문
```java
String str1 = new String("abc");
String str2 = new String("abc");
print(str1.equlas(str2)); // true
print(str1.hasCode()); // 12345;
print(str2.hasCode(); // 12345;
// String클래스는 문자열의 내용이 같으면, 동일한 해시코드를 반환하도록 hashCode메서드가 오버라딩돼 있다. 
따라서 문자열의 내용이 같은 str1과 str2에 대해 hashCode()를 호출하면 항상 동일한 해시코드값을 얻는다.

System.identityHashCode(System.idntityHashCode(str1)); // 12345
System.identityHashCode(System.idntityHashCode(str2)); // 54321

// 반면에 System.identityHashCode(Object x)는 Object클래스의 hashCode메서드처럼 객체의 주소값으로 해시코드를 생성한다. 
//따라서 모든 객체에 대해 상상 다른 해시코드 값을 반환한다. 
//그래서 str1과 str2가 해시코드는 같지만 서로 다른 객체라는 것을 알 수 있다.
```
 
 
 4 toString()
 * 객체의 정보를 문자열(String)로 제공할 목적으로 정의된 메서드
 * Object클래스의 toString()
 ```java
 	public String toString(){
    	return getCalss.getName() +"@" + Integer.toHexString(hashCode());
    }
    
    //적절히 오버라이딩해야 한다.
    
    public String toString(){
    	return "kind : " + kind + ", number : " + number;
    }
 ```
 
 
 5 clone()
 * 객체 자신을 복제(clone)해서 새로운 객체를 생성하는 메서드
 * cloneable인터페이스를 구현한 클래스의 인스턴스만 복제할 수 있다.
 * Object클래스에 정의된 clone()은 인스턴스변수의 값만을 복제한다.
 * 인스턴스가 참조형일 때, 참조하는 객체도 복제되게 오버라이딩 해야함.
 ```java
 class Point implements Cloneable{
    int x;
    int y;
    Point(int x, int y){
    	this.x = x;
        this.y = y;
     }
    public String to String(){
    	return "x="+x +", y=" + y;
    }
    public Object clone(){
    	Object obj = null;
        try{
        	obj = super.clone(); // clone은 반드시 예외처리를 해줘야 한다,
        } catch(CloneNotSupportedException e){}
        return obj;
    }
 }
class CloneEx1{
	main(){
    	Point original = new Point(3,5);
        Point copy = (Point)original.clone();
        print(original);      // x=3, y=5
        print(copy);         // x=3, y=5

      }
 }
 ```
 
6 공변 반환타입
 * 오버라이딩할 때 조상 메서드의 반환타입을 자손 클래스의 타입으로 변경하는 것
 ```java
 	   public Point clone(){
    	Object obj = null;
        try{
        	obj = super.clone(); // clone은 반드시 예외처리를 해줘야 한다,
        } catch(CloneNotSupportedException e){}
        return (Point)obj;
    }
    
    //
    
   Point copy = (Point)original.clone();  ->       Point copy = original.clone();
 ```
 
7 얕은 복사와 깊은 복사
 * clone()은 단순히 객체에 저장된 값을 그대로 복제할 뿐, 객체가 참조하고 있는 객체까지 복제하지는 않는다. 
   기본형 배열인 경우에는 아무런 문제가 없지마녀, 객체배열을 clone()으로 복제하는 경우에는 원본과 복제본이 같은 객체를 
   공유하므로 완전한 복제라고 보기 어렵다. 이러한 복제를 `얕은복사`라고 한다.
 * 얕은 복사에서는 원본을 변경하면 복사본에 영향을 받는다.
 * 반면 원본이 참조하고 있는 객체까지 복제하는 것을 `깊은복사`라고 한다.
 * 깊은 복사에서는 원본을 변경해도 복사본에 영향을 미치지 않는다.
 * 얕은 복사 & 깊은 복사
 ```java
 	class Circle implemetns Cloneable{
    	Point p;
        double r;
       
       Circle(Point p, double r){
       		this.p = p;
            this.r = r;
       }
 
     public Circle shallowCopy() { //얕은 복사
        Object obj = null;
        
        try{
        	obj = super. clone(); // 조상인 Object의 clone()을 호출한다.
        } catch (CloneNotSupportedException e) []
        
        return (Circle)obj;
     }
     
     public Circle deepCopy() { //깊은 복사
        Object obj = null;
        
        try{
        	obj = super. clone(); // 조상인 Object의 clone()을 호출한다.
        } catch (CloneNotSupportedException e) []
        
        Circle c = (Circle)ob;
        c.p = new Point(this.p.x,this.p.y);
        
        return c;
     }
 }
======================
Circle c1 = new Circle(new Point(1,1),2.0);
Circle c2 = c1.clone(); // 얕은 복사
 ```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.ObjectClass.shallowdeep.png)

8 getClass()
 * 자신이 속한 클래스의 Class객체를 반환하는 메서드
 * Class객체는 클래스의 모든 정보를 담고 있으며 클래스당 단 1개만 존재
 * 클래스파일(*.class)이 로드될때 생성된다.
 * Class 객체를 얻는 방법
   - Class cObj = new Card().getClass(); // 생성된 객체로 부터 얻는 방법
   - Class cObj = Card.class; // 클래스 리터럴(*.class)로 부터 얻는 방법
   - Class cObj = Class.forName("Card"); // 클래스 이름으로 부터 얻는 방법
   ```java
   	Card c = new Card(); // new 연산자를 이용해서 객체 생성
    Card c = Card.class.newInstance(); // Class객체를 이용해서 객체 생성
    //동적으로 객체 생성 : 리플렉션
   ```
   - forName() 특정 클래스 파일, 예를 들어 db 드라이더를 메모리에 올릴 때 주로 사용
 *  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/ClassEx1.java)
