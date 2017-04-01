
# 다형성
1 다형성이란?
* 여러 가지 형태를 가질 수 있는 능력
* 하나의 참조변수로 여러 타입의 객체를 참조할 수 있는 것. 즉, 조상타입의 참조변수로 자손타입의 객체를 다룰 수 있는 것이 다형성.
```java
	class Tv{...}
    class CaptionTv extends Tv{...}
    
    Tv t = new CaptionTv();
    
    //이 경우 실제 인스턴스가 CaptionTv타입이라 할지라도, 
    //참조변수 t로는 CaptionTv의 인스턴스의 모든 멤버를 사용할 수 없다.
   // Tv클래스의 멤버들만 사용할 수 있다.
```
* 조상타입의 참조변수로 자손타입의 인스턴스를 참조할 수 있지만, 반대로 자손타입의 참조변수로 조상타입의 인스턴스를 참조할수는 없다.

2 참조변수의 형변환
* 서로 상속관계에 있는 타입간의 형변환만 가능
* 자손 타입에서 조상타입으로 형변환하는 경우, 형변환 생략가능
* `자손타입 -> 조상타입 (Up-casting) : 형변환 생략가능`
* `조상타입 -> 자손타입 (Down-casting) : 형변환 생략불가`
```java
	class Car{...}
    class FireEngine extends Car{...}
    class Ambulance extends Car{...}
    
    FireEngine f;
    Ambulance a;
    
    a = (Ambulance)f; // 에러. 상속관계가 아닌 클래스간의 형변환 불가
    
    Car car = null;
    FireEngine fe = new FireEngine();
    FireEngine fe2 = null;
    
    car = fe; // car = (Car)fe; // 조상 = 자손 // 조상 <- 자손 // 형변환 생략 가능 (업캐스팅) // car = (Car)fe;
    fe2 = (FireEngine)car // 자손 = 조상 // 자손 <- 조상 // 형변환 생략 불가 (다운캐스팅) // fe2 = (Fireengine)car;
```

* 참조변수가 참조하고 있는 인스턴스의 자손타입으로 형변환을 하는 것은 허용되지 않는다. 참조변수가 가리키는 인스턴스의 타입이 무엇인지 확인하는 것이 중요하다.
```java
	Car car = new Car();
    Car car2 = null;
    FireEngine fe = null;
    
    fe = (FireEngine)car ; // 컴파일은 되지만 실행시 에러발생
    					   // 조상타압의 인스턴스를 자손타입의 참조변수로 참조하려고 함
    car2 = fe;
```
[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/ClassCastingTest1.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/ClassCastingTest2.java)

3 instanceof연산자
 * 참조변수가 참조하는 인스턴스의 실제 타입을 체크한는데 사용.
 * 이항연산자이며 피연산자는 참조형 변수와 타입. 연산 결과는 true, false,
 * instanceof의 연산결과가 true이면, 해당 타입으로 형변환이 가능
 
 ```java
 	void doWork(Car c){
    	if(c instanceof FireEngine){
        	FireEngine fe = (FireEngine) c;
        } else if ( c instanceof Ambulance){
        	Ambulance a = (Ambulance)c;
        }
  }
 ```

4 참조변수와 인스턴스변수의 연결 
 * 멤버변수가 중복정의된 경우, 참조변수의 타입에 따라 연결되는 멤버변수가 달라진다.`참조변수타입에 영향 받음`
 * 메서드가 중복정의된 경우, 참조변수의 타입에 관계없이 항상 실제 인스턴스의 타입에 정의된 메서드가 호출된다.`참조변수타입에 영향받지 않음`
* [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/BindingTest.java)
* [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/BindingTest2.java)
* [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/BindingTest3.java)

5 매개변수의 다형성
* 참조형 매개변수는 메서드 호출시, 자신과 같은 타입 또는 자손 타입의 인스턴스를 넘겨줄 수 있다.
```java
	class Product{...}
    class Tv extends Product{}
    class Computer extends Product{}
    class Audio extends Product{}
    
    void buy(Product p){...}
    
    buy(new Tv()); / buy(new Computer()); / buy(new Audio()); 가능...
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/PolyArgumentTest.java)

6 여러 종류의 객체를 배열로 다루기
* 조상타입의 배열에 자손들의 객체를 담을 수 있다. (크기고정)
```java
											Product p[] new Product[3];
Product p1 = new Tv();                      p[0] = new Tv();
Product p2 = new Computer();          ->	p[1] = new Computer();
Product p3 = new Audio();					p[2] = new Audio();
	
```

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/PolyArgumentTest2.java)

* Vector를 이용 : Vector : 동적으로 크키가 관리되는 객체배열   (크키 고정 x)

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/PolyArgumentTest3.java)
