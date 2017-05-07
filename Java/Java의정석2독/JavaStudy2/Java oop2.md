> 출처 : 자바의 정석

# Java oop2
## 1. 상속
### 1.1 상속의 정의
* 기존의 클래스를 재사용해서 새로운 클래스를 작성하는 것
* 두 클래스를 조상과 자손으로 관계를 맺어주는 것
* 자손은 조상의 모든 멤버를 상속받는다.(생성자, 초괴화블럭 제외)
* 자손의 멤버개수는 조상보다 적을 수 없다.(같거다 많다.)
```java
	class 자손클래스 extends 조상클래스{
	 //...
    }
    
    class Point{
    	int x;
        int y;
    }
     
    class Point3D{                       class Point3D extends Point{
    	int x;									int z;
        int y;                     ->		}
        int z;
     }
```

### 1.2 클래스간의 관계 : 상속 관계
* 공통부분은 조상에서 관리하고 개별부분은 자손에서 관리한다.
* 조상의 변경은 자손에 영향을 미치지만, 자손의 변경은 조상에서 아무런 영향을 미치지 않는다.
```java
	class Parent {}
    class Child extends Parent{}
    class Child2 extends Parent{}
    class GrandChild extends Child{}
```

### 1.2 클래스간의 관계 : 포함관계
* 한 클래스의 멤버변수로 다른 클래스는 선언하는 것
* 작은 단위의 클래스를 먼저 만들고, 이 들을 조합해서 하나의 커다란 클래스를 만든다.
   

```java
    class Point{
    	int x;
        int y;
    }
    									
    class Point3D extends Point{           class Point3D extends Point{
        int z;                                  Point c = new Point();
     }											int r;
     											}
```

### 1.3 클래스간의 관계결정하기. 상속 vs 포함
* 가능한 한 많은 관계를 맺어주어 재사용성을 높이고 관리하기 쉽게 한다.
* 'is -  a'와 'has - a'를 가지고 문장을 만들어 본다.
```java
	Circle은 Point이다. 		  : Circle is a Point.
    Circle은 Point를 가지고 있다. : Circle has a Point.
    
    상속관계 : '~은 ~이다.(is-a)'
    포함관계 : '~은~을/를 가지고 있다.(has-a)'
                                             Cricle과 Point는 포함관계가 자연스러움
      class Point3D extends Point{           class Point3D extends Point{
        int z;                                  Point c = new Point();
     }											int r;
     									   }
```
[[관련소스 : DrawShpae.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/DrawShape.java)
[[관련소스 : DeckTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/DeckTest.java)

### 1.4 단일상속
* Java는 단일상속만 허용
```java
	class TVCR extends TV,VCR{  // 이와 같은 표현은 허용하지 않는다.
    		//...
       }
```
* 비중이 높은 클래스 하나만 상속관게로, 나머지는 포함관계로 한다.
```java
	class Tv{
    	boolean power;
        int channel;
        
        void power() { power = !power;}
        void channelUp() { ++channel; }
        void channelDown() { --channel; }
   }
   class VCR{
   	boolean power;
    int counter = 0;
    void play() {}
    void stop() {}
    void rew() {}
    void ff() {}
 }
 
 class TVCR extends Tv{
 	VCR vcr = new VCR();
    int counter = vcr.counter;
    
    void play(){
    	vcr.play();
    }
 }
```

### 1.5 Object클래스 : 모든 클래스의 최고조상
* 조상이 없는 클래스는 자동적으로 Object클래스를 상속받게 된다.
* 상속계층도의 최상위에는 Object클래스가 위차한다.
* 모든 클래스는 Object클래스에 정의된 11개의 메서드를 상속받는다.
* ex) toString(), equals(Object obj) 등
```java
	class Tv{
    	//...
     }
     
     class CaptionTv extends Tv{
     	...
     }
     
     Object ⊂ Tv ⊂ CaptionTv
```

## 2. 오버라이딩
### 2.1 오버라이딩
* 조상클래스로부터 상속받은 메서드의 내용을 상속받는 클래스에 맞게 변경한느 것을 오버라이딩이라고 한다.
```java
 	class Point{
    	int x;
        int y;
        
        String getLocation(){
        	return "x :" + x + ", y :" + y;
         }
    }
    
    class Point3D extends Point{
    	int z;
        String getLocatio() {  // 오버라이딩
        	return "x :" + x + ", y" + y +, z" + z;
            }
      }
```
### 2.2 오버라이딩의 조건
* 선언부가 같아야 한다.(이름, 매개변수, 리턴타입)
* 접근제어자를 좁은 범위로 변경할 수 없다.
* 조상의 메서드가 protexted라면, 범위가 같거나 넓은 protected나 public으로만 변경할 수 있다.
* 조상클래스의 메서드보다 많은 수의 예외를 선언할 수 없다.
```java
	class Parent {
    	void parentMethod() throws IOException, SQLException{
        	...
            }
      }
      
      class Child extends Parent {
      	void parentMethod() throws IOException {
        	...
            }
          }
	  class Child extends Parent {
      	void parentMethod() throws Exception{ // 에러
        	...
          }
       }
```

### 2.3 오버로딩 vs 오버라이딩
* 오버로딩(overloading) : 기존에 없는 새로운 메서드를 정의한느 것(new)
* 오버라이딩(overriding) : 상속받은 메서드의 내용을 변경하는 것(change)
```java
	class Parent {
    	void parentMethod() {}
    }
    class Child extends Parent{
    	void parentMethiod() {}     // 오버라이딩
        void parentethod(int i) {}  // 오버로딩
        
        void childMethod() {}
        void childMethod(int i) {} // 오버로딩
        void childMethod() {} // 에러!!!  중복정의
``` 

### 2.4 super
* this
   - 인스턴스 자신을 가리키는 참조변수, 인스턴스의 주소가 저장돼있음
   - 모든 인스턴스 메서드에 지역변수로 숨겨진 채로 존재
* super
   - this와 같음. 조상의 멤버와 자신의 멤버를 구별하는 데 사용
  
 [[관련소스 : SuperTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/SuperTest.java) [[관련소스 : SuperTest2.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/SuperTest2.java)
 
 ### 2.5 super() : 조상의 생성자
  * 자손클래스의 인스턴스를 생성하면, 자손의 멤버와 조상의 멤버가 합쳐진 하나의 인스턴스가 생서오딘다.
  * 조상의 멤버들도 초기화돼야 하기 때문에 자손의 생성자의 첫 문장에서 조상의 생성자를 호출해야 한다.
* Object클래스를 제외한 모든 클래스의 생성자 첫 줄에는 생성자(같은 클래스의 다른 생성자 또는 조상의 생성자)를 호출해야 한다.
* 그렇지 않으면 컴파일러가 자동적으로 'super();'를 생성자의 첫 줄에 삽입한다.
* 조상 클래스의 멤버변수는 조상의 생성자에 의해 초기화되도록 해야 한다.

[[관련소스 : PointTest.java]]()  [[관련소스 : PointTest2.java]]()

## 3.package와 import
### 3.1 package
* 서로 관련된 클르새와 인터페이스의 묶음.
* 클래스가 물리적으로 클래스파일(*.class)인 것처럼, 패키지는 물리적으로 폴더
* 패키지는 서브패키지를 가질 수 있으며, '.'으로 구분
* 클래스의 실제이름(full name)은 패키지명이 포함된 것이다.
* rt.jar는 Java API의 기본 클래스들을 압축한 파일

### 3.2 패키지의 선언
 * 패키지는 소스파일에 첫 번째 문장(주석 제외)으로 단 한 번 선언한다.
 * 하나의 소스파일에 둘 이상의 클르새가 포함된 경우, 모든 같은 패키지에 속한다. 단, public클래스는 단 하나만 허용
 * 모든 클래스는 하나의 패키지에 속하며, 패키지가 선언되지 않은 클래스는 자동적으로 이름없는 패키지에 속하게 된다.

### 3.3 import문
* 사용할 클래스가 속한 패키지를 지정하는데 사용.
* import문을 사용하면 클래스를 사용할 때 패키지명을 생략할 수 있다.
```java
	class ImportTest{
    	java.util.Date today = new java.util.Date();
        ...
     }
     ---------------
     import java.util.*;
     class ImportTest{
     	Date today = new Date();
     }
    
```
* java.lang패키지의 클래스는 import하지 않고도 사용할 수 있다.
### 3.4 import문의 선언
* import문은 패키지문과 클래스선언 사이에 선언
```java
1.package
2.import문
3.클래스선언

import 패키지명.클래스명;
or
improt 패키지명.*;
```
[[관련소스 : ImportTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/ImportTest.java)

* import문은 컴파일 시에 처리되므로 프로그램의 성능에 아무런 영향을 미치지 않는다.
* 다음의 두 코드는 서로 의미가 다르다.
```java
	import java.util.*;
    import java.text.*;
    ----
    import java.*;
```
* 이름이 같은 클래스가 속한 두 패키지를 import할 때는 클래스 앞에 패키지명을 붙여줘야 한다.
```java
	import java.sql.*; // java.sql.Date
    import java.util.*; // java.util.Date
    
    public class ImportTest{
    	public static void main(String[] args) {
        	java.util.Date today = new java.util.Date();
            }
        }
```

### 3.5 static import문
* import문을 사용하면 클래스의 패키지명을 생략할 수 있는 것과 같이 static import문을 사용하면 static멤버를 호출할 때 클래스 이름을 생략할 수 있다.
* 특정 클래스의 static멤버를 자주 사용할 때 편리하고 코드도 간결해진다.
```java
	import static java.lang.Integer.*; // Integer클래스의 모든 static메서드 사용
    import static java.lang.Math.random; // Math.random()만. 괄호 안 붙임
    import static java.lang.System.out; // System.out을 out만으로 참조가능
    
    System.out.println(Math.random()); -> out.println(random());
```

[[관련소스 : StaticImportEx1.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/StaticImportEx1.java)


## 4. 제어자(modifiers)
### 4.1 제어자란
* 클래스, 변수, 메서드의 선언부에 사용돼 부가적인 의미를 부여한다.
* 제어자는 크게 접근 제어자와 그 외의 제어자로 나뉜다.
* 하나의 대상에 여러 개의 제어잘르 조합해서 사용할 수 있으나, 접근제어자는 단 하나만 사용할 수 있다.
```java
	접근 제어자 : public, protected, default, private
    그 외 : static, final, abstract, native, transient, synchronized, volatile, strictfp
```

### 4.2 static : 클래스의, 공통적인
* static이 사용될 수 있는 곳  : 멤버변수, 메섣, 초기화 블럭

![staic.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/static.png)

```java
	class StaticTest{
    	static int width = 200;
        static int height = 120;
        
        static { // 클래스 초기화 블럭
        	// static 변수의 복잡한 초기화 수ㅐㅎㅇ
          }
        static int max(int a, int b){
        	return a > b ? a : b;
            }
    }
```

### 4.3 fianl : 마지막의, 변경될 수 없는
* fianl이 사용될 수 있는 곳 : 클래스, 메서드, 멤버변수, 지역변수

![final.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/fianl.png)
```java
	final class FianlTest{ // 조상이 될 수 없는 클래스
    	final int MAX_SIZE = 10; // 값을 변경할 수 없는 멤버변수(상수)
        final void getMaxSize() {  // 오버라이딩할 수 없는 메서드(변경불가)
        	final int LV = MAX_SIZE; // 값을 변경할 수 없는 지역변수(상수)
            return MAX_SIZE;
           }
      }
```

### 4.4 생성자를 이용한 fianl 멤버변수 초기화
* final이 붙은 변수는 상수이므로 보통은 선언과 초기화를 동시에 하지만, 인스턴스변수의 경우 생성자에서 초기화 할 수 있다.
```java
class Card{
	final int NUMBER;             // 상수지만 선언과 함께 초기화 하지 않고
    final String KIND;            // 생성자에서 단 한번만 초기화할 수 있다.
    static int width = 100;
    static int height = 250;
    
    Card(String kind, int num) {
    	KIND = kind;
        NUMBER = num;
     }
     
     Card() {
     	this("HEART",1);
        }
        
     public String toString() {
     	return KIND + " "+ NUMBER;
        }
    }
    
    main(String args[]){
    	Card c = new Card("HEART", 10);
        //c.NUMBER = 5; 에러!!!
        print(c.KIND);
        print(c.NUMBER);
```	

### 4.5 abstract - 추상의, 미완성의
* abstract가 사용될 수 있는 곳 : 클래스, 메서드
```java
	abstract class AbstractTest{ // 추상 클래스(추상 메서드를 포함한 클래스)
    	abstract void move();  // 추상 메서드(구현부가 없는 메서드)
      }
```

### 4.6 접근제어자(access modifier)
* 멤버 또는 클래스에 사용돼, 외부로부터의 접근을 제한한다.
* 접근 제어자가 사용될 수 있는 곳 : 클래스, 멤버변수, 메서드, 생성자
* private : 같은 클래스내에서만 접근 가능
* protected : 같은 패키지 내에서, 그리고 다른 패키지의 자손클래스에서 접근이 가능
* public : 접근 제한이 전혀 없다.

![access modifier.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/access%20modifier.png)
![access modifier2.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/access%20modifier2.png)

### 4.7 접근 제어자를 이용한 캡슐화
* 접근 제어자를 사용하는 이유
    - 외부로부터 데이터를 보호하기 위해서
    - 외부에는 불필요한, 내부적으로만 사용되는, 부분을 감추기 위해서
```java
	public class Time{
    	private int hour;
        private int minute;
        private int second;
        
        public int getHour() { return hour; }
        public void setHOur(int hour){
      	  if( hour < 0 || hour > 23 ) return;
          this.hour = hour;
       }
       
       ...
    }
```
[[관련소스 : TimeTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/TimeTest.java)

### 4.8생성자의 접근 제어자
* 일반적으로 생성자의 접근 제어자는 클래스의 접근 제어자와 일치 한다.
* 생성자에 접근 제어자를 사용ㅎㅁ으로써 인스턴스의 생성을 제한할 수 있다.
```java
	final class Singleton{
    	private static Singleton s = new Singleton();
        private Singleton(){ //생성자
        	...
        }
        public static Singleton getInstance() {
        	if(s==null) {
            	s= new Singleton();
             }
             return s;
        }
        ...
    }
    
    Singleton s = new Singleton() ; // 에러
    Singleton s = Singleton.getInstance();
```

### 4.9 제어자의 조합
대상 | 사용가능한 제어자
------------ | -------------
클래스 | public, (default), fianl, abstract
메서드| 모든 접근 제어자, fianl, abstract, static
멤버변수 | 모든 접근 제어자, fianl, static
지역변수 | final

* 메서드에 static과 abstract를 함께 사용할 수 없다.
   - static메서드는 몸통(구현부)이 있는 메서드에만 사용할 수 있기 때문
* 클래스에 abstract와 final을 동시에 사용할 수 없다.
   - 클래스에 사용되는 final은 클래스를 확장할 수 없다는 의미이고, abstract는 상속을 통해서 완성돼야 한다는 의미이므로 서로 모순되기 때문
* abstract메서드의 접근제어가자 private일 수 없다,
   - abstract메서드는 자손클래스에서 구현해주어야 하는데 제어자가 private이면, 자손클래스에서 접근할 수 없기 때문
* 메서드에 private과 final을 같이 사용할 필요는 없다.
   - 접근 제어자가 private인 메서드는 오버라이딩될 수 없기 때문.

## 5. 다형성(Ploymoriphism)
### 5.1 다형성이란
* 하나의 참조변수로 여러 타입의 객체를 참조할 수 있는 것
```java
	class Tv{
    	boolean power;
        int channel;
        void power() {...}
        void channelUp() {...}
        void channelDown(0 {...}
     }
     
     class CaptionTv extends Tv{
     	String text;
        void caption()
     }
     
     CaptionTv c = new CaptionTv();
     Tv        t = new CaptionTv();
```
![polymorphism.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/Polymorphism.png)

* 조상타입의 참조변수로 자손타입의 인스턴스를 참조할 수 있지만, 반대로 
* 자손 타입의 참조변수로 조상타입의 인스턴스를 참조할 수는 없다.
```java
	Tv t = new CaptionTv();
    CaptionTv c = new Tv();
```
![polymorphism2.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/Polymorphism2.png)

### 5.2 참조변수의 형변환
* 서로 상속관계에 있는 타입간의 형변환만 가능하다.
* 자손 타입 -> 조상타입(Up-casting) : 형변환 생략가능
* 자손타입 <- 조상타입(Down-casting) : 형변환 생략 불가
```java
	 class Car{
     	String color;
        int door;
        
        void drive() {...}
        void stop() {...}
     }
     class FireEngine extends Card{	
     	void water() {...}
      }
      class Ambulance extends Car{	
      	void siren() {...}
    }
    
    main(){
    	Car car = null;
        FireEngine fe = new FireEngine();
        FireEngine fe2 = null;
        
        fe.water();
        car = fe;  // car = (Car)fe;   조상 <- 자손
      //car.water(); 에러
      	fe2 = (FireEngine)car; // 자손 <- 조상
        fe.water();
     }
```

### 5.3 instanceof연산자
* 참조변수가 참조하는 인스턴스의 실제 타입을 체크하는데 사용
* 이상연산자이며 피연산자는 참조형 변수와 타입. 연산결관느 true, false.
* instanceof의 연산결과가 true이면, 해당 타입으로 형변환이 가능하다.
* 어떤 타입에 대한 instanceof연산의 결과가 true라는 것은 검ㅅ한 타입으로 형변환이 가능하다는 것을 뜻한다.

```java
	void doWork(Car c) {
    	if ( c instanceof FireEngine){
        	FireEngine fe = (FireEngine)c;
            fe.water();
        } else if ( c instanceof Ambulance) {
        	Ambulance a = (Ambulance) c;
            a.siren();
            //...
         }
         ...
       }
```
[[관련소스 : InstanceofTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InstanceofTest.java)

### 5.4 참조변수와 인스턴스변수의 연결
* 멤버변수가 중복정의된 경우, 참조변수의 타입에 따라 연결되는 멤버변수가 달라진다.(참조변수타입에 영향받음)
* 메서드가 중복정의된 경우 참조변수의 타입에 관계없이 항상 실제 인스턴스의 타입에 정의된 메서드가 호출된다.(참조변수타입에 영향받지 않음)
```java
	class Parent {	
    	int x = 100;
        void method() {
        	print("Parent Method");
            }
       }
       
       class Child extends Parent {
       	int x = 200;
        
        void method() {
        	print("Child Method");
          }
       }
```
![참조변수와 인스턴스변수의 연결.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/%EC%B0%B8%EC%A1%B0%EB%B3%80%EC%88%98%EC%99%80%20%EC%9D%B8%EC%8A%A4%ED%84%B4%EC%8A%A4%EB%B3%80%EC%88%98%EC%9D%98%20%EC%97%B0%EA%B2%B0.png)

### 5.5 여러 종류의 객체를 하나의 배열로 다루기 1
* 참조형 매개변수는 메서드 호출시, 자신과 같은 타입 또는 자손타입의 인스턴스를 넘겨줄 수 있다.
* 조상타입의 배열에 자손들의 객체를 담을 수 있다.
```java
	Product p[] = new Product[3];
    p[0] = new Tv();
    p[1] = new Computer();
    p[2] = new Audio();
    
    class Buyer{
    	int money = 1000;
        int bonusPoint = 0;
        Product[] cart = new Product[10];
        
        int i=0;
        
        void buy(product p){
        	if(money < p.price){
            	System.out.println("잔액부족");
                return;
             }
             
             money -= p.price;
             bonusPoint += p.bonusPoint;
             cart[i++] = p;
           }
       }
       
       class Computer extends Product{...}
       class Tv extends Product{...}
       
       Buyer buyer = new Buyer();
       buyer.buy(new Tv());
       buyer.buy(new Computer());
```
[[관련소스 : PolyArgumentTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/PolyArgumentTest.java)

### 5.5 여러 종류의 객체를 하나의 배열로 다루기 2
* Vector를 이용
![Vector.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/Vector.png)

[[관련소스 : PolyArgumentTest3.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/PloyArgumentTest3.java)


## 6. 추상클래스(abstract class)
### 6.1 추상클래스란?
* 클래스가 설계도라면 추상클래스는 '미완성 설계도'
* 추상메서드(미완성 메서드)를 포함하고 있는 클래스
* 추상메서드 : 선언부만 있고 구현부(몸통, body)가 없는 메서드
```java
	abstract class Player{
    	int currentPos;
    	Player(){
        	currentPos = 0;
        }
        abstract void play(int pos);
        abstract void stop();
        void play(){
        	play(currentPos); // 추상메서드를 사용할 수 있다.
          }
          ...
       }
```
* 일반 메서드가 추상메서드를 호출할 수 있다.(호출할 때 필요한 건 선언부)
* 완성된 설계도가 아니므로 인스턴스를 생성할 수 없다.

### 6.2 추상메서드(abstract method)란?
* 선언부만 있고 구현부(몸통, body)가 없는 메서드
```java
	// 주석을 통해 어떤 기능을 수행할 목적으로 작성하였는지 설명한다.
    abstract 리턴타입 메서드이름();
    
    // 지정된 위치(pos)에서 재생을 시작하는 기능이 수행되도록 작성한다.*/
    abstract void play(int pos);
```
* 꼭 필요하지만 자손마다 다르게 구현될 것으로 예상되는 경우에 사용
* 추상클래스를 상속받는 자손클래스에서 추상메서드의 구현부를 완성해야 한다.
```java
	abstract class Player {
    	...
        abstract void play(int pos);
        abstract void stop();
        ...
     }
     
     class AudioPlayer extends Player{
     	void play(int pos) {...}
        void stop() {...}
      }
      
      abstract class AbstractPlayer extends Player{
      	void play(int pos) {...}
     }
```

### 6.3 추상클래스
* 여러 클래스에 공통적으로 사용될 수 있는 추상클래스를 바로 작성하거나 기존클래스의 공통부븐을 뽑아서 추상클래스를 만든다.
```java
	class Marine{
    	int x, y;
        void move(int x, int y) {...}
        void stop() {...}
        void stimPack() {...}
     }
     class Tank{
     	int x, y;
        void move(int x, int y) {...}
        void stop() {...}
        void changeMode() {...}
     }
     
     class Dropship[
     	int x, y;
        void move(int x, int y) {...}
        void stop() {...}
        void load() {...}
        void unload() {...}
   }
   
   abstract class Unit{
   	int x, y;
    abstract void move(int x, int y);
    void stop() { ...}
    }
    
	class Marine exntends Unit{
        void move(int x, int y) {...}
        void stimPack() {...}
     }
     class Tank{
        void move(int x, int y) {...}
        void changeMode() {...}
     }
     
     class Dropship[
        void move(int x, int y) {...}
        void load() {...}
        void unload() {...}
   }
   
   Unit[] group = new Unit[4];
   group[0] = new Marine();
   ...
   
   group[0].move(100,200); -> 추상메서드가 호출되는 것이 아니라 각 자손들에 실제로 구현된 move(int x, int y)가 호출된다.
```

## 7. 인터페이스
### 7.1 인터페이스란?
* 일종의 추상클래스. 추상클래스보다 추상화 정도가 높다.
* 실제 구현된 것이 전혀 없는 기본설계도
* 추상메서드와 상수만을 멤버로 가질 수 있다.
* 인스턴스를 생성할 수 없고, 클래스 작성에 도움을 줄 목적으로 사용된다.
* 미리 정해진 규칙에 맞게 구현하도록 표준을 제시하는데 사용
### 7.2 인터페이스의 작성
* 'class'대신 'interface'를 사용한다는 것 외에는 클래스 작성고 동일하다.
```java
	interface 인터페이스이름{
    	public static final 타입 상수이름 = 값;
        public abstract 메서드이름(매개변수목록);
     }
```
* 하지만 구성요소(멤버)는 추상멧드와 상수만 가능하다.
* 모든 멤버변수는 public static final 이어야 하며, 이를 생략할 수 있다.
* 모든 메서드는 public abstract이어야 하며, 이를 생략할 수 있다.
```java
	interface PlayingCard{
    	public static final int SPADE = 4;
        final int DIAMOND = 3; // public static fianl int DIAMOND = 3;
        static int HEART = 2; // public static final int CLOVER = 1;
        int CLOVER = 1;      // public static final int CLOVER = 1;
        
        public abstract String getCardNumber();
        String getCardKind(); // public abstract String getCardKind();
      }
```

### 7.3 인터페이스의 상속
* 인터페이스는 인터페이스로부터만 상속 받을 수 있으며, 다중상속이 가능함
* 인터페이스는 Object클래스와 같은 최고 조상이 없다.
```java
	interface Movalbe{
    	void move(int x, int y);
      }
    interface Attackable{
    	void attck(Unit u);
     }
     
   interface Fightable extends Movable, Arrackable{}
```
### 7.4 인터페이스의 구현
* 인터페이스를 구현하는 것은 클래스를 상속받는 것과 같다. 다만, 'extends'대신 'implements'를 사용
```java
	class 클래스이름 implements 인터페이스이름{
    	...
     }
```
* 인터페이스에 정의된 추상메서드를 완성해야 한다.
```java
	class Fighter implements Fightable{
    	public void move() {...}
        public void attack() {...}
     }
     interface Fightable{
     	void move(int x, int y);
        void attack(Unit u);
     }
```
* 만일 구현하는 인터페이스의 메서드 중 일부만 구현한다면, abstract를 붙여서 추상클래스로 선언해야 한다,
```java
	abstract class Fighter implements Fightable{
    	public void move(){...}
    } 
```

* 상속과 구현이 동시에 가능하다.
```java
	class Fighter extends Unit implemetns Fightable{
    	public void move(int x, int y){...}
        public ovid attack(Unit u){...}
```

### 7.5 인터페이스를 이용한 다형성
* 인터페이스 타입의 변수로 인터페이스를 구현한 클래스의 인스턴스를 참조할 수 있다.
```java
	class Fighter extends Unit implements Fightable{
    	public void move(int x, int y) {...}
        public void attack(Fightable f) {...}
        
        Fightable f = (Fightable)new Fighter();
        Fightable f = new Fighter();
```
* 인터페이스를 메서드의 매개변수 타입으로 지정할 수 있다.
```java
	void attack(Fightable f) { // Fightable인터페이스르 구현한 클래스의 인스턴스를  매겨변수로 받는 메서드
    ...
  }
```
* 인터페이스를 메서드의 리턴타입으로 지정할 수 있다.
```java
	Fightable method() { Fightable인터페이스를 구현한 클래스의 인스턴스를 반환
        ...
        return new Fighter();
    }
```

### 7.6 인터페이스의 장점
* 개발시간을 단축시킬 수 있다.
   - 일단 인터페이스가 작성되면, 이를 사용해서 프로그램을 작성하는 것이 가능하다.
 메서드를 호출하는 쪽에서는 메서드의 내용에 관계없이 선언부만 알면 되기 때문이다. 그리고 동시에 다른 한 쪽에서는 인터페이스를 구현하는 클래스를 작성하도록하여, 인터페이스를 구현하는 클래스가 작성될 때까지 기다리지 않고도 양쪽에서 동시에 개발을 진행할 수 있다.
 *  표준화가 가능하다.
     - 프로젝트에 사용되는 기본 틀을 인터페이스로 작성한 다음, 개발자들에게 인터페이스를 구현하여 프로그램을 작성하도록 함으로써 보다 일관되고 정형화된 프로그램의 개발이 가능하다.
  * 서로 관계없는 클래스들에게 관계를 맺어 줄 수 있다.
    - 서로 상속관계에 있지도 않고, 같은 조상클래스를 가지고 있지 않은 서로 아무런 관계도 없는클래스들에게 하나의 인터페이스를 공통적으로 구현하도록 함으로써 관계를 맺어 줄 수 있다.
  * 독립적인 프로그래밍이 가능하다.
    * 인터페이스를 이용하면 클래스의 선언과 구현을 분리시킬 수 있기 떄문에 실제 구현에 독립적인 프로그램을 작성하는 것이 가능하다. 클래스와 클래스간의 직접적인 관계를 인터페이스를 이용해서 간접적인 관계로 변경하면, 한 클래스의 변경이 관련된 다른 클래스에 영향을 미치지 않는 돍립적인 프로그래밍이 가능하다.

[[관련소스 : RepairableTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/RepairableTset.java)

### 7.7 인터페이스의 이해
* 인터페이스는
    - 두 대상(객체) 간의 '연결, 대화, 소통'을 돕는 '중간 역할'을 한다.
    - 선언(설계)와 구현을 분리시키는 것을 가능하게 한다.
 * 인터페이스를 이해하려면 먼저 두 가지를 기억하자.
    - 클래스를 사용하는 쪽과 클래스는 제공하는 쪽이 있다.
    - 메서드를 사용하는 쪽에서는 사용하려는 메서드의 선언부만 알면 된다.

![인터페이스의 이해2.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch7%20oop2/%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4%EC%9D%98%20%EC%9D%B4%ED%95%B42.png)

### 7.8 디폴트 메서드와 static메서드
* JDK1.8부터 디폴트 메서드와 static메서드도 추가할 수 있게 됐다.
* 디폴트 메서드
    - 추상 메서드의 기본적인 구현을 제공하는 메서
    - 추상 메서드가 아니기 때문에 디폴트 메서드가 새로 추가되어도 해당 인터페이스를  구현한 클래스를 변경하지 않아도 되나.
    - 디폴트 메서드 앞에 키워드 default를 붙인다.
    - 추상메서드와 달리 일반 메서드처럼 몸통{}이 있어야 한다.
```java
	interface MyInterface{
    	void method();
        default void newMethod(){}
```
* 디폴트 메서드가 기존의 메서드와 이름이 중복돼 충돟라는 경우
1. 여러 인터페이스의 디폴트 메서드 간의 충돌
    - 인터페이스를 구현한 클래스에서 디폴트 메서드를 오버라이딩해야 한다.

2.디폴트 메서드와 조상 클래스의 메서드 간의 충돌
   - 조상클래스의 메서드가 상속되고, 디폴트 메서드는 무시된다.

[[관련소스 : DefaultMethodTest.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/DefaultMethodTest.java)

## 8. 내부 클래스 
### 8.1 내부클래스
* 클래스 내에 선언된 클래스
* 외부, 내부 클래스 간에 긴밀한 관계가 있을 때 사용
* 두 클래스 멤버 들간에 서로 쉽게 접근할 수 있다
* 코드의 복잡성을 줄일 수 있다.
```java
	class A {
    	class B{
        }
     }
```

### 8.2 내부 클래스의 종류와 특징
내부 클래스 | 특징
------------ | -------------
인스턴스 클래스 | 외부 클래스의 멤버변수 선언위치에 선언하며, 외부 클래스의 인스턴스멤버처럼 다루어진다. 주로 외부 클래스의 인스턴스멤버들과 관련된 작업에 사용될 목적으로 선언
스태틱클래스| 외부 클래스의 멤버변수 선언위치에 선언하며, 외부 클래스의 static멤버처럼 다루어진다. 주로 외부 클래스의 static멤버, 특히 static메서드에서 사용될 목적으로 선언
지역 클래스 | 외부 클래스의 메서드나 초기화블럭 안에 선언하며, 선언된 영역 내부에서만 사용될 수 있다.
익명 클래스 | 클래스의 선언과 객체의 생성을 동시에 하는 이름없는 클래스(일회용)

### 8.3 내부 클래스의 선언
```java
	class Outer{
    	class InstanceInner{}
        static class StaticInner{}
        void myMethod(){
        	class LocalInner{}
          }
       }
```
### 8.4 내부 클래스의 제어자와 접근성
* 내부클래스도 클래스이기 때문에 abstract나 final과 같은 제어자를 사용할 수 있을 뿐만 아니라, 멤버변수들처럼 private, protected과 접근제어자도 사용이 가능하다.

[[관련소스 : InnerEx1.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx1.java)
[[관련소스 : InnerEx2.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx2.java)
[[관련소스 : InnerEx3.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx3.java)
[[관련소스 : InnerEx4.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx4.java)
[[관련소스 : InnerEx5.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx5.java)

### 8.5 익명클래스
* 클래스의 선언과 객체의 생성을 동시에 한다.
* 단 한 번만 사용될 수 있고 오직 하나의 객체만을 생성할 수 있는 일회용 클래스이다.
```java
	new 조상클래스이름(){
    	//멤버 선언
      }
      new 구현인터페이스이름(){
      	//멤버 선언
      }
      
      b.addActionListener(new ActionListener(){
      	public void actionPerformed(ActionEvent e) {
        	 print("dff");
             } // 익명클래스 끝
        );
        
```
[관련소스 : InnterEx8.java](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch7_oop2/InnerEx8.java)# 
