# java oop1 Construcotr
# 5 생성자

## 5.1 생성자란
* 인스턴스가 생성될 때마다 호출되는 '인스턴스 초기화 메서드'
* 인스턴스 변수의 초기화 또는 인스턴스 생성시 수행할 작업에 사용
* 몇가지 조건을 제외하고는 메서드와 같다.
* 모든 클래스에는 반드시 하나 잇아의 생성자가 있어야 한다.
* 인스턴스 초기화 : 인스턴스 변수에 적절한 값을 저장하는 것
```java
	Card c= new Card();
    // 1. 연산자 new에 의해서 메모리(heap)에 Card클래스의 인스턴스가 생성
    // 2. 생성자 Card()가 호출돼 수행된다.
    // 3. 연산자 new의 결과로, 생성된 Card인스턴스의 주소가 반환돼 참조변수 c에 저장
```

## 5.2 생성자의 조건
* 생성자의 이름은 클래스의 이름과 같아야 한다.
* 생성자는 리턴값이 없다.(void는 쓰지 않음. 모든 생성자는 리턴값이 없기 때문에(
```java
	클래스이름(타입 변수명, 타입 변수명, ...){
    	// 인스턴스 생성시 수행될 코드
        // 주로 인스턴스 변수의 초기호 코드를 적는다.
     }
     
     class Card{
     	...
        Card() { // 매개변수가 없는 생성자
         // 인스턴스 초기화 작업
        }
        Card(String kind, int number) { // 매개변수가 있는 생성자
         // 인스턴스 초기화 작업
       }
   }
```

## 5.3 기본 생성자
* 매개변수가 없는 생성자
* 클래스에 생성자가 하나도 없으면 컴파일러가 기본 생성자를 추가한다.
* 생성자가 하나라도 있으면 컴파일러는 기본 생성자를 추가하지 않는다.
```java
	클래스 이름() {}
    Card() {} // 컴파일러에 의해 추가된 Card클래스의 기본 생성자. 내용이 없다.
```
> 모든 클래스에는 반드시 하나 이상의 생성자가 있어야 한다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/ConstructorTest.java)

## 5.4 매개변수가 있는 생성자
```java
	class Car{
    	String color;
        String gearType;
        int door;
        
        Car() {}
        Car(String c, String g, int d){	//생성자
        color = c;
        gearType = g;
        door = d;
        }
     }
     
     Card c = new Car();
     c.color = "white";
     c.gearType = "auto";
     c.door = 4;
     -----------
     Car c = new Car("white","auto",4);
```

## 5.5 생성자에서 다른 생성자 호출하기 : this()
* this()
  - 생성자, 같은 클래스의 다른 생성자를 호출할 때 사용
  - 다른 생성자 호출은 생성자의 첫 문장에서만 가능 : 생성자 내에서 초기화 작업도중에 다른 새엉자를 호출하게 되면, 호출하기 이전의 추기화 작업이 무의미해질 수 있기 때문
```java
Car(){
	color = "white";
    gearType = "auto";
    door = 4;
 }
 // 재사용성을 높인 코드
 Car() {
 	this("white","auto",4);
  // Car(:"white", "auto", 4);
  }
    
```

## 5.6 참조변수 this
* this : 인스턴스 자신을 가리키는 참조변수, 인스턴스의 주소가 저장돼 있음. 모든 인스턴스 메서드에 지역변수로 숨겨진 채로 존재
```java
        Car(String color, String gearType, int door){	//생성자
        this.color = color;
        this.gearType = gearType;
        this.door = door;
        }
```
## 5.7 생성자를 이용한 인스턴스의 복사
* 인스턴스간의 차이는 인스턴스변수의 값 뿐 나머지는 동일하다
* 생성자에서 참조변수를 매개변수로 받아서 인스턴스변수들의 값을 복사한다.
* 똑같은 속성값을 갖는 독립적인 인스턴스가 하나 더 만들어진다.
```java
	Car(Car c){
    	this(c.color, c.gearType, c.door);
     }
```

# 6. 변수의 초기화

## 6.1 변수의 초기화
* 변수를 선언하고 처음으로 값을 저장한느 것
* 멤버변수(인스턴스, 클래스변수)와 배열은 각 타입의 기본값으로 자동초기화되므로 초기화를 생략할 수 있다.
* 지역변수는 사용전에 꼭!!! 초기화를 해주어야 한다.

## 6.2 멤버변수의 초기화
1. 명시적 초기화(explicit initialization)
```java
	class Car{
    	int door = 4;  // 기본형 변수의 초기화
        Engine e = new Engine(); // 참조형 변수의 초기화
    }
```
2. 생성자(constructor)
```java
        Car(String color, String gearType, int door){	//생성자
        this.color = color;
        this.gearType = gearType;
        this.door = door;
        }
```
3. 초기화 블럭(initialization block)
* 인스턴스 초기화 블럭 : {}
* 클래스 초기화 블럭 : static {}

## 6.3 초기화 블럭(initailization block)
* 클래스 초기화 블럭
  - 클래스변수의 복잡한 초기화에 사용되며 클래스가 로딩될 때 실행된다.
* 인스턴스 초기화 블럭
   - 생성자에서 공통적으로 수행되는 작업에 사용되며 인스턴스가 생성될 때마다(생성자보다 먼저) 실행된다.
```java
	class InitBlock{
    	static { /* 클래스 초기화 블럭입니다. */}
        { /* 인스턴스 초기화블럭 입니다. */ }
    }
    
    class StaticBlockTest{
    	static int[] arr = new int[10]; // 명시적 초기화
        static {
        	for(int i=0; i<arr.length;i++){
            	arr[i] = (int)(Math.random()*10) + 1;
                }
           }
        }
```
## 6.4 멤버변수의 초기화 시기와 순서
* 클래스변수초기화 시점 : 클래스가 처음 로딩될 때 단 한 번
* 인스턴스변수 초기화 시점 : 인스턴스가 생성될 때 마다
```java
	class InitTest{
    	static int cv = 1;  // 명시적 초기화
        int iv = 1; // 명시적 초기화
        
        static { cv = 2 ; } // 클래스 초기화 블럭
        { iv = 2; } // 인스턴스 초기호 ㅏ블럭
        
        InitTest() { // 생성자
        	iv = 3;
         }
      }
      
      InitTest it = new InitTest();
        
```

![멤버변수의 초기화 시기와 순서](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%EB%A9%A4%EB%B2%84%EB%B3%80%EC%88%98%EC%9D%98%20%EC%B4%88%EA%B8%B0%ED%99%94%20%EC%8B%9C%EA%B8%B0%EC%99%80%20%EC%88%9C%EC%84%9C.png)

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/BlockTest.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/StaticBlockTest.java)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/ProductTest.java)
[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/DocumentTest.java)
