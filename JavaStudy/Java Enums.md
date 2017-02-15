# Java Enums
### 열거형이란 :
* 관련 있는 상수들의 집합 (출처 : http://www.nextree.co.kr/p11686/)
* JDK1.5부터 추가
* 열거형이 갖는 값뿐만 아니라 타입까지 관리하기 때문에 보다 논리적인 오류를 줄일 수 있다.
```java
	class Card{
    	enum Kind  { CLOVER, HEART, DIAMOND, SPADE } // 열거형 KInd를 정의
        enum Value { TWO, THREE, FOUR } // 열거형 Value를 정의
        
        final Kind kind; // 타입이 int가 아닌 Kind
        final Value value; 
   }
   
   if(Card.CLOVER == Card.TWO) // true지만 false이어야 의미상 맞음.
   if(Card.Kind.CLOVER == Card.Value.TWO) // false. 값은 갖지만 타입이 다름
```
* 상수값이 바뀌면, 해당 상수를 참조하는 모든 소스를 다시 컴파일해야 하지만,
* 열거형 상수를 사용하면, 기존으 소스를 다시 컴파일하지 않아도 된다.!!!

### 열거형의 정의와 사용
```java
	enum 열거형이름 { 상수명1, 상수명2, ...}
    
    enum Direction { EAST, SOUTH, WEST, NORTH }
    
    // '열거형.상수명'으로 사용
    // 열거형 상수간의 비교에는 '==, compareTO()' 사용가능.
    // '<', '>'와 같은 비교연산자는 사용할 수 없다.
    
    class Unit {
    	int x, y; // 유닛의 위치
        Direction dir; // 열거형을 인스턴스 변수로 선언
        
        void init(){
        	dir = Direction.EAST; // 유닛의 방향을 EAST로 초기화
          }
    }
    
    if(dir==Direction.EAST){
    	x++;
     } else if(dir>Direction.WEST) { //에러. 열거형 상수에 비교연산자 사용불가
     } else if(dir.compareTO(Direction.WEST) > 0 ){
     	...  비교대상이 같으면 0, 왼쪽이 크면 양수, 오른쪽이 크면 음수를 반환
     }
     
     // switch문의 조건식에도 열거형을 사용할 수 있다.
     void move(){
     	switch(dir){
        	case EAST: x++; // Direction.EAST라고 쓰면 안 된다. 상수으 이름만!
            	break;
            case WEST: x--;
            	break;
            case SOUTH: y++;
            	break;
            case NORTH: y--;
            	break;
       }
    }
```

##### 모든 열거형의 조상 : java.lang.Enum
* Enum클래스에 정의된 메서드

메서드 | 설명
------------ | -------------
Class<E> getDeclaringClass() | 열거형의 Class객체를 반환
String name() | 열거형 상수의 이름을 문자열로 반환
int ordinal() | 열거형 상수가 정의된 순서를 반환(0부터시작)
T valueOf(Class<T> enumType, String name) | 지정된 열거형에서 name과 일치하는 열거형 상수를 반환
```java
	Direction[] dArr = Direction.values();
    
    for(Direction d : dArr) // for(Direction d : Direction.value())
    	System.out.printf("%s=%d%n", d.name(), d.ordinal());
   --------------------------------------------------------------------
   Direction d = Direction.valueOf("WEST");
   
   System.out.println(d); //WEST
   System.out.println(Direction.WEST == Direction.valueOf("WEST"));//true
        
```
[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/EnumEx1.java)


### 열거형에 멤버 추가하기
* 열거형 상수의 값이 불규칙적인 경우에는 열거형 상수의 이름옆에 원하는 값을 괄호()와 함께 적어주면 된다.
* 지정된 값을 저장할 수 있는 인스턴스 변수와 생성자를 추가해야한다.
* 열거형 상수를 모두 정의한 다음에 다른 멤버들을 추가해야한다.
* 열거형 상수의 마지막에 ';'도 적어줘야한다.
```java
	enum Direction { EAST(1), SOUTH(5), WEST(-1), NORTH(10) ;
    
    priavte final int value; // 정수를 저장할 필드(인스턴스 변수)를 추가
    // 반드시 final을 추가해야할 필요는 없지만 value는 열거형 상수의 값을 저장하기 위한 것이므로 추가 
    Direction(int value) { this.value = value;} // 생성자를 추가
    
    public int getValue() { return value; } // 외부에서 값을 얻을 수 있게 추가
 }
 
 Direction d = new Direction(1) // 에러. 열거형의 생성자는 외부에서 호출불가
 // 열거형의 생성자는 묵시적으로 private이다.
```

[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/EnumEx2.java)

##### 열거형에 추상 메서드 추가하기
* 열거형에 추상 메서드를 선언하면 각 열거형 상수가 이 추상 메서드를 반드시 구현해야 함
```java
	enum Transportation {
    	Bus(100) { int fare(int distance) { return distance*BASIC_FARE;}},
        TRAIN(150) { int fare(int distance) { return distance*BASIC_FARE;}},
        SHIP(100) { int fare(int distance) { return distance*BASIC_FARE;}},
        AIRPLANE(300) { int fare(int distance) { return distance*BASIC_FARE;}};
        
        abstract int fare(int distance); // 거리에 따른 요금을 계산하는 추상 메서드
        
        protected fianl int BASIC_FARE; // protected로 해서 각 상수에서 접근 가능
        
        Transportation(int basicFare){            // private Transportation(int basicFare){
        	BASIC_FARE = baiscFare;
        }
        public int getBasicFare() { return BASIC_FARE;}   
```
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/EnumEx3.java)


### 열거형의 이해
```java
	class Direction { EAST, SOUTH, WEST, NORTH }
    -------------------------
    class Direction {
    	static final Direction EAST = new Direction("EAST");
    	static final Direction SOUTH = new Direction("SOUTH");
    	static final Direction WEST = new Direction("WEST");
    	static final Direction NORTH = new Direction("NORTH");
        
        private String name;
        
        private Direction(String name){	
        	this.name = name;
            }
      }
       
       
       //Directoin클래스의 static 상수 4개의 값은 객체의 주소이고,
       //이 값은 바뀌지 않는 값이므로 '=='로 비교가 가능
```

* Enum 흉내
```java
	abstract class MyEnum<T extends MyEnum<T>> implements Comparable<T>{
    	static int id = 0; // 객체에 붙일 일련번호(0부터 시작)
        
        int ordinal;
        String name="";
        
        public int ordinal() { return ordinal;}
        MyEnum(String name){
        	this.name = name;
            ordianl = id++; // 객체를 생성할 때마다 id의 값을 증가
       }
       public int compareTo(T t){
       		return ordinal - t.ordinal();
       }
       
       // 클래스에 '<T extends MyEnum<T>>'는 타입T가 MyEnum<T>와 같이 선언한 이유는
       // MyEnum<T>와 같이 선언했다면, compareTo()에서 타입 T에 ordinal()이 정의됐는지 확인 수 없기 때문
       // '<T extends MyEnum<T>>'는 타입T가 MyEnum<T>의 자손이어야 하므로 ordinal()이 정의돼 있는 것이 분명하다
```
*  또한 추상메서드를 추가하면 클래스 앞에도 'abstract'를 붙여줘야 하고, 각 static상수들도 추상메서드를 구현해주어야 한다
```java
	abstract class Direction extends MyEnum{
    	static final Direction EAST = new Direction("EAST) { //익명클래스
        	Point move(Point p) {...}
         };
     ...
     
     private String name;
     
     private Direction(String name){
     	this.name = name;
     }
     
     abstract Point move(Point p);
  }
```

[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/EnumEx4.java)
