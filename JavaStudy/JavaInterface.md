# 인터페이스(interface)
1 인터페이스란
* 일종의 추상클래스, 추상클래스(미완성 설계도)보다 추상화 정도가 높다.
* 설계 구현된 것이 전혀 없는 기본 설게도.(알맹이 없는 껍데기)
* 추상메서드와 상수만을 멤버로 가질 수 있다.
* 인스턴스를 생성할 수 없고, 클래스 작성에 도움을 줄 목적으로 사용
* 미리 정해진 규칙에 맞게 구현하도록 표준을 제시하는데 사용


2 인터페이스 작성
* `class` 대신 `interface`를 사용하다는 것 외에는 클래스 작성과 동일
* 구성요서(멤버)는 추상메서드와 상수만 가능
  - 모든 멤버변수는 public static final 이어야 하며, 생략가능
  - 모든 메서드는 public abstrace이어야 하며, 생략 가능
```java
	interface 인터페이스이름{
    	public static final 타입 상수이름 = 값;
        public static abstract 메서드이름(매개변수목록);
     }
```
> 예


```java
	interface PlayingCard{
    	public static final int SPADE = 4;
        final int DIAMOND = 3; // public static fianl int DIAMOND = 3;
        static int HEART = 2; // public static final int HEART = 2;
        int CLOVER = 1;       // public static final int CLOVER =1;
        
        public abstract String getCardNumber();
        String getCardKind(); // public abstract String getCardKind();
```

3 인터페이스의 상속
* 인터페이스도 클래스처럼 상속이 가능
* 다중상속 허용
* Object클래스와 같은 최고 조상이 업음
```java
	interface Movable{...}
    interface Attackable{...}
    
    interface Fightable extends Movable, Attackable{...}
```
4 인터페이스의 구현
* 인터페이스를 구현하는 것은 클래스를 상속받는 것과 같다. 단 `extends` 대신 `implements` 사용
```java
	class 클래스이름 implements 인터페스이름{
    	인터페이스에 정의된 추상메서드를 구현해야 한다.
    }
```
* 인터페이스에 정의된 추상메서드를 완성해야 한다.
```java
	interface Fightable{
    	void move(int x, int y);
        void attack(Unit u);
    }
    
	class Fighter implements Fightable{
    	public void move(int x, int y){...}
        public void attack(Unit u){...}
    }
```
* 만약 구현하는 인터페이스의 메서드 중 일부만 구현한다면, abstract를 붙여서 추상클래로 선언해야 한다.
```java
abstract class Fighter implements Fightable{
	public void move(int x, int y){...}
}
```
* 상속과 구현이 동시에 가능
```java
abstract class Fighter implements Fightable{
class Figher extends Unit implements Fightable{
	    public void move(int x, int y){...}
        public void attack(Unit u){...}
}
```
5 인터페이스를 이용한 다형성
* 인터페이스 타입의 변수로 인터페이스를 구현한 클래스의 인스턴스를 참조 가능
```java
	class Fighter implements Fightable{...}
    
    Fighter f = new Fighter();
    Fightable f = new Fighter();
```
* 인터페이스를 메서드의 매개변수 타입으로 지정할 수 있다.
```java
	void attack(Fightable f){ // Fightable인터페이스를 구현한 클래스의 인스턴스를 매개변수로 받는 메서드
 		...
   }
```

* 인터페이스를 메서드의 리턴타입으로 지정할 수 있다.
```java
	Fightable method() { // Fightable인터페이스를 구현한 클래스의 인스턴스를 반환
 		...
        return new Fighter();
   }
```
6 인터페이스의 장점
 - 개발시간을 단축시킬 수 있다.
    - 일단 인터페이스가 작성되면, 이를 사용해서 프로그램을 작성하는 것이 가능. 메서드를 호출하는 쪽에서는 메서드의 내용에 관게없이 선엄부만 알면 되기 때문
 - 표준화가 가능
    - 프로젝트에 사용되는 기본 틀을 인터페이스로 작성한 다음, 개발자들에게 인터페이스를 구현하여 프로그램을 작성하도록 함으로써 보다 일관되고 프로그램의 개발이 가능
  - 서로 관계없는 클래스들에게 관계를 맺어 줄 수 있다.
    - 서로 상속관계에 있지도 않고, 같은 조상클래스를 가지고 있지 않는 서로 아무런 관계도 없는 클래스들에게 하나의 인터페이스를 공통적으로 구현하다록 함으로써 관계를 맺어 줄 수 있다.
  - 독립적인 프로그래밍이 가능하다.
    - 인터페이스를 이용하면 클래스의 선언과 구현을 분리시킬 수 있기 때문에 실제구현에 독립적인 프로그램을 작성하는 것이 가능. 클래스와 클래스간의 직접적인 관계를 인터페이스를 이용해서 간접적인 관게로 변경하면, 한 클래스의 변경이 관련된 다른 클래스에 영향을 미치지 않는 독립적인 프로그래밍 가능

>[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InterFaceTest3.java)

7 인터페이스의 이해
 * 인터페이스는 두 대상(객체) 간의 '연결, 대화, 소통'을 돕는 '중간 역할'을 한다.
 * 선언(설계)와 구현을 분리시키는 것을 가능케 한다.
 ```java
 	class B{
    	public void method(){
        	System.out.println("methodInB");
            }
     }
 ```
> 인터페이스 활용
 ```java
 	interface I{
    	public void method();
    }
 	class B implemetns I{
    	public void method(){
        	System.out.println("methodInB");
            }
     }
 ```
 * 인터페이스를 이해하려면 두 가지를 기억
   - 클래스를 사용하는 쪽과 클래스를 제공하는 쪽이 있다.
   - 메서드를 사용하는 쪽에서는 사용하려는 메서드의 선언부만 알면 된다.
```java
	직접적인 관계의 두 클래스(A-B)                   간접적인 관계의 두 클래스(A-I-B)
    class A{                                         class A{
    	public void methodA(B b){                     public void methodA(I i){
        	b.methodB(); 									i.methodB();
            }												}
      }												}
    class B{										class B implemetns I{
    	public void methodB(){							public void methodB(){
        	...										     	...
            }												}
       }											}
            
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaInterface.PNG)

```java
	public class Time{
    	private int hour;
        ...
        public int getHour(){...}
        public void setHour(int h){...}
        ....
    }
```
> 인터페이스 이용


```java
	public interface TimeIntf{

        public int getHour();
        public void setHour(int h);
        ....
    }
```
