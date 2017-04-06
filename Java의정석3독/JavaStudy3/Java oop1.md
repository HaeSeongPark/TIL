# Java oop1
## 1. 객체, 인스턴스
```java
	객체 : 속성과 메서드로 정의
    class Tv{
    	String color; // 색깔
        boolean power; // 전원상태(on/off)
        int channel; // 채널
        
        void power() { power = !power;} // 전원 on/off
        void channelUp { channel++;} // 채널 높이기
        void channelDown { channel--; }
     }
     
     Tv t;
     t = new Tv();
  // Tv t = new Tv();
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%EC%9D%B8%EC%8A%A4%ED%84%B4%EC%8A%A4%EC%9D%98%20%EC%83%9D%EC%84%B1%EA%B3%BC%20%EC%82%AC%EC%9A%A9.png)

```java
	class Time{
    	int hour;
        int minute;
        int second;
    }
    
    Time t = new Time();
    t[0] = new Time();
    t[1] = new TIme();
    t[2] = new Time();
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%ED%81%B4%EB%9E%98%EC%8A%A4%EC%9D%98%20%EB%98%90%20%EB%8B%A4%EB%A5%B8%20%EC%A0%95%EC%9D%98.png)

## 2. 변수와 메서드
* 변수의 선언위치가 변수의 종류와 범위를 결정한다.
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%EC%84%A0%EC%96%B8%EC%9C%84%EC%B9%98%EC%97%90%20%EB%94%B0%EB%A5%B8%20%EB%B3%80%EC%88%98%EC%9D%98%20%EC%A2%85%EB%A5%981.png)
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%EC%84%A0%EC%96%B8%EC%9C%84%EC%B9%98%EC%97%90%20%EB%94%B0%EB%A5%B8%20%EB%B3%80%EC%88%98%EC%9D%98%20%EC%A2%85%EB%A5%982.png)

* 클래스 변수, static
    - 같은 클래스의 모든 인스턴스들이 공유하는 변수
    - 인스턴스 생성없이 '클래스이름.클래스변수명'으로 접근
    - 클래스가 로딩될 때 생성되고 프로그램이 종료될 때 소멸
* 인스턴스변수
    - 각 인스턴스의 개별적인 저장공간. 인스턴스마다 다른 값 저장가능
    - 인스턴스생성 후, '참조변수.인스턴스변수명'으로 접근
    - 인스턴스를 생서할 때 생성되고, 참조변수가 없을 때 가비지컬렉터에 의해 자동 제거됨
 * 지역변수
    - 메서드 내에 선언, 메서드의 종료와 함께 소멸
    - 조건문, 반복문의 블럭{} 내에 선언된 지역변수는 블럭을 벗어나면 소멸
 > 인스턴스변수는 인스턴스가 생성될 때마다 생성되므로 인스턴스마다 각기 다른 값을 유지할 수 있지만, 클래스변수는 모든 인스턴스가 하나의 저장공간을 공유하므로 항상 공통된 값을 갖는다.

* 메서드
 ![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/%EB%A9%94%EC%84%9C%EB%93%9C.png)
 
 ## 3. return문
 * 메서드가 정상적으로 종료되는 경우
     - 메서드의 블럭{}의 끝에 도달했을 때
     - 메서드의 블럭{}을 수행하는 도중 return문을 만났을 때
 * return문
    - 현재 실행중인 메서드를 종료하고 호출한 멧드로 되돌아 간다.
 ```java
 	// 1.  반환값이 없는 경우 : return문만 써주면 된다.
 		return;
    // 반환값이 있는 경우 : retrun문 뒤에 반환값을 지정해 주어야 한다.
    	return 반환값;
        // 이 때 반환타입과 return타입이 같아야 한다.
 ```
 * return문은 가급적이면 최소화 하기

## 4. 간단한 JVM의 메모리구조
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch6%20oop1/jvm%EC%9D%98%20%EB%A9%94%EB%AA%A8%EB%A6%AC%EA%B5%AC%EC%A1%B0.png)

* 메서드영역(Method Area)
   - 클래스 정보와 클래스변수가 저장된느 곳
 * 호출스택(Call Stack)
    - 메서드의 작업공간, 메서드가 호출되면 메서드 수행에 필요한 메모리 공간을 할당받고 메서드가 종료되면 사용하던 메모리를 반환
* 힙(Heap)
   - 인스턴스가 생성되는 공간. new 연산자에 의해서 생성되는 배열과 모두 여기에 생성

* 호출스택의 특징
   - 메서드가 호출되면 수행에 필요한 메모리를 스택에 할당받는다.
   - 메서드가 수행을 마치면 사용했던 메모리를 반환
   - 호출스택의 제일 위에 있는 메서드가 현재 실행중인 메서드
   - 아래에 있는 메서드가 바로 위의 메서드를 호출한 메서드
 
 ## 5. 기본형 매개변수와 참조형 매개변수
 * 기본형 매개변수 : read only

[[기본형 매개변수 관련 소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/PrimitiveParamEx.java)
 * 참조형매개변수 : read&write
 
[[참조형 매개변수 관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/ReferenceParamEx.java)
[[참조형 매개변수 관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/ReferenceParamEx2.java)
[[참조형 매개변수 관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch6_oop1/ReferenceParamEx3.java)
## 6. 재귀호출
* 메서드 내에서 자기 자신을 반복적 호출
* 반복문으로 바꿀 수 있으며 반복문보다 성능이 나쁨
* 대신 이해하기 쉽고 간결한 코드를 작성할 수 있다.
* 팩토리얼, 제곱, 트리운행, 풀도목록표시 등
```java
		long factorial(int n){
    	long result = 0;
        if(n==1) result = 1;
        else result = n * factorail(n-1);
        return result;
        }
```

## 7. 클래스메서드(static메서드)와 인스턴스 메서드
* 인스턴스메서드
   - 인스턴스 생성 후, '참조변수.메서드이름()'ㅇ로 호출
   - 인스턴스변수나 인스턴스메서드와 관련된 작업을 하는 메서드
   - 메서드 내에서 인스턴스 변수 사용가능
 * 클래스(static)메서드
    - 객체생성없이 '클래스이름.메서드이름()'으로 호출
    - 인스턴스변수나 인스턴스메서드와 관련없는 작업을 하는 메서드
    - 메서드 내에서 인스턴스변수 사용불가
    - 메서드 내에서 인스턴스변수 사용하지 않는다면 static을 붙이는 것 고려!!!
  ```java
  	class MyMath2{
   		long a, b;
       long add() { return a + b; }
       static long add(long a, long b) { return a + b; }
       
       print(MyMath2.add(200L, 100L);
       MyMath2 mm = new MyMath2(); // 인스턴스 생성
       mm.a = 200L;
       mm.b = 100L;
       print(mm.add()); // 인스턴스 메서드 호출
 ```
 ## 8. 멤버간의 참조와 호출
 * 같은 클래스의 멤버간에는 객체생성이나 참조변수 없이 참조할 수 있다.
 * 하지만 static멤버들은 인스턴스멤버들을 참조할 수 없다.
 * static멤버가 존재할 때 인스턴스멤버가 존재하지 않을 수 있기 때문이다.
 ```java
 		class TestClass{
    	void instanceMetod() // 인스턴스 메서드
        static void staticMethod() // static 메서드 (클래스 메서드)
        
        void instanceMethod2() { // 인스턴스 메서드
           instanceMethod(); // 인스턴스메서드에서 다른 인스턴스 메서드 호출 가능
           staticMethod(); // 인스턴스메서드에서 다른 static메서드 호출 가능
         }
        
        static void staticMethod2() { //static 메서드
           instanceMethod(); // static 메서드에서 다른 인스턴스 메서드 호출 불가
           staticMethod(); // static 메서드에서 다른 static메서드 호출 가능
         }
         
   class TestClass2{
    	int iv; // 인스턴스 변수
        static int cv; // 클래스 변수
        
        void instacneMethod() { // 인스턴스 메서드
         print(iv) // 인스턴스 변수 사용가능
         print(cv) // 클래스변수 사용할 수 있다.
       }
       
       static void staticMethod(){ // static메서드
       	print(iv); // 인스턴스변수 사용 불가
        print(cv) //  클래스 변수 사용 가능
     }
 ```
 
 ## 9. 메서드 오버로딩
 * 메서드 오버로딩
     - 하나의 클래스에 같은 이름의 메서드를 여러 개 생성하는 것(new)
 * 조건
    - 메서드의 이름이 같아야 한다.
    - 매개변수의 개수 또는 타입이 달라야 한다.
    - 리턴타입은 오버로딩을 구현하는데 아무런 영향이 없다.
```java
	/ 오버로딩 올바른 예
	int add(int a, int b) { return a+b;}
    long add(long a, long b) { return a+b;}
    int add(int[] a){
    	int result = 0;
        for(int i=0; i<a.length; i++){
        	result += a[i];
            }
            return result;
      }
      
// 오버로딩 올바르지 않은 예
  int add(int a, int b) {}
  int add(int x, int y){}
  // 매개변수의 이름이 다른 것은 오버로딩이 아니다.

  int add(int a, int b) {}
  long add(int a, int b){}
  // 리턴타입은 오버로딩의 성립조건이 아니다.

  // 오버로딩시 주의
  long add(int a, long b) {}
  long add(long a, int b) {}
  // 위 경우 오버로딩은 성립하나 사용지 주의해야 한다.
  // add(3,3)과 같이 호출하면 두개에 다 들어갈 수 있으므로 컴파일 에러
  // add(3,3L)은 첫 번째, add(3L,3)은 두 번째 메서드에 들어간다.
```

## 9.1 가변인자(varargs)와 오버로딩
* 타입... 변수명
```java
	public PrintStream printf(String format, Object...args){...}
```
* 가변인자는 제일 마지막에 선언해야 함
```java
   String concatenate(String s1, String s2){...}
   String concatenate(String s1, String s2, String s3){...}
   String concatenate(String s1, String s2, String 34, String s4){...}
   // 위 3개 메서도는 아래와 같이 한 줄로 가능
  -> String concatenate(String...str) {...}
   
   concatenate() // 인자 없음
   concatenate("a") // 인자 하나
   concatenate("a","b") // 인자 둘
   concatenate(new String[]{"A","B"} // 배열도 가능
 // 가변인자는 내부적으로 배열 사용
 
 concatenate(String...srt)  == concatenate(String[] str)
 // 위 두 문장은 같다
 // 단 매개변수의 타입을 배열로하면, 인자를 지정해 줘야하기 때문에 인자생략 불가
 concatenate(String[] str)
 concatenate(null); // 인자로 nuull을 지정
 concatenate(new String[0] // 인자로 배열을 지정
 concatenate(); // 에러. 인자가 필요함
```
* 가변인자를 매개변수로 하는 메서드는 가급적 오버로딩하지 않는 것이 좋다.

## 10 변수의 초기화
* 클래스(static)변수, 인스턴스변수는 자료형에 맞는 기본값으로 초기화 되지만
* 지역변수는 사용하기 전에 반드시 초기화해야 한다.
* 초기화 방법
  - 명시적 초기화
  - 생성자
  - 초기화블럭 : 인스턴스, 클래스

### 10.1 명시적 초기화
* 선언과 동시에 초기화는 것
```java
	class Car{
    	int door = 4;
        Engine e = new Engine();
        //...
     }
```
### 10.2 초기호 블럭
* 복잡한 초기화할 때 사용
```java
	class InitBlock{
    	static { /* 클래스 초기화 블럭. */ }
        { /* 인스턴스 초기화 블럭 */ }
-----------------------------

    Car() {   
      count++;    //중복
      serialNo = count; //중복
      color = "white";                                     
      gearType = "Auto";                                     
    }
    Car(Stirng color, String geartType) {   
      count++; //중복
      serialNo = count; //중복
      this.color = color;                                     
      this.gearType = gearType;                                     
    }  

//아래와 같이 생성자에서 공통으로 수행돼야 하는 코드는 인스턴스 초기화 블럭에 넣는다.

    {
    	count++;
        serialNo = count;
    }
    
    Car() {   
      color = "white";                                     
      gearType = "Auto";                                     
    }
    Car(Stirng color, String geartType) {   
      this.color = color;                                     
      this.gearType = gearType;                                     
}  
        	
```

### 10.3 멤버변수의 초기화 시기와 순서
* 클래스 변수의 초기화 시점 : 클래스가 처음 로딩될 때 단 한번
* 클래스 변수의 초기화 순서 : 기본값 -> 명시적초기화 -> 클래스 초기화 블럭
* 인스턴스변수의 초기화 시점 : 인스턴스가 생성될 때마다
* 인스턴스변수의 초기화 순서 : 기본값 -> 명시적초기화 -> 인스턴스초기화블럭 -> 생성자
```java
class InitTest{
     static int cv =1;  // 명시적초기화
     int iv = 1;  // 명시적초기화

     static { cv = 2; }  // 클래스초기화블럭

     { iv = 2; }  // 인스턴스초기화 블럭

     InitTest() { iv = 3; } // 생성자
   
   }
       1.  cv : 0,기본값 : cv가 메모리(method area)에 생성되고 기본값 저장
       2.  cv : 1,명시적 초기화 
       3.  cv : 2,클래스 초기화 블럭
       4.  iv : 0,기본값 : InitTest의 인스턴스가 생성되면 iv가 메모리(heap)에 존재하게 된다.
       5.  iv : 1,명시적초기화
       6.  iv : 2,인스턴스 초기화 블럭
       7.  iv : 3, 생성자
```
* 클래스변수 초기화(1~3) : 클래스가 처음 메모리에 로딩될 때 차례대로 수행됨
* 인스턴스변수 초기화(4~7) : 인스턴스가 생성될 때마다 차례대로 수행됨
* 클래스변수는 항상 인스턴스 변수보다 먼저 생성되고 초기화 됨
