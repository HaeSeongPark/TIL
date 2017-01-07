# 변수의 초기화

1.변수의 초기화?
* 변수를 선언하고 처음으로 값을 저장하는 것. 
* 멤버변순는 초기화하지 않아도 자동적으로 변수의 자료형에 맞는 기본값으로 초기화가 이루어짐
* 지역변수는 사용하기 전에 반드시 초기화해야 한다.
* 타입별 기본값

자료형 | 기본값
------------ | -------------
boolean|false
char|'\u000'
byte,short,int|0(zero)
long | 0(zero)L
double|0.0d 또는 0.0 (zero)
참조형 변수 | null

2.명시적 초기화(explicit initialization)
```java
class Car{
  int door=4;        //기본형 변수의 초기화
  Engine e = new Engin(); //참조형 변수의 초기화
  ...
  }
```

3.초기화 블럭(initialization block)
* 클래스(static) 초기화 블럭
 > 클래스변수의 복잡한 초기화에 사용된다.

* 인스턴스 초기화 블럭
 > 인스턴스변수의 복잡한 초기화에 사용된다.

```java
class IniBlock{
	static {...} // 클래스 초기화 블럭
    {...} // 인스턴스 초기화 블럭
```
```java
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
//위와 같이 생성자에서 공통으로 수행돼야 하는 코드는 인스턴스 초기화 블럭에 넣는다.
```

```java
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
4.멤버변수의 초기화 시기와 순서
* 클래스변수의 초기화 시점
 > 클래스가 처음 로딩될 때 단 한번 초기화

* 클래스변수의 초기화 순서 : 기본값
 > 명시적 초기화 -> 클래스 초기화 블럭

* 인스턴스변수의 초기화 시점
 > 인스턴스가 생성될 때마다 각 인스턴스별로 초기화가 이루어진다.

* 클래스변수의 초기화 순서 : 기본값
 > 명시적 초기화 -> 클래스 초기화 블럭
 
 ```java
 	class InitTest{
    static int cv =1;
    int iv = 1;
    
    static { cv = 2; }
    
    { iv = 2; }
    
    InitTest() { iv = 3; }
    
        1.  cv : 0,기본값 : cv가 메모리(method area)에 생성되고 기본값 저장
        2.  cv : 1,명시적 초기화 
        3.  cv : 2,클래스 초기화 블럭
        4.  iv : 0,기본값 : InitTest의 인스턴스가 생성되면 iv가 메모리(heap)에 존재하게 된다.
        5.  iv : 1,명시적초기화
        6.  iv : 2,인스턴스 초기호 블럭
        7.  iv : 3, 생성자
 ```
* 클래스변수는 초기화(1~3) : 클래스가 처음 메모리에 로딩될 때 차레대로 수행됨
* 인스턴스변수 초기화(4~7) : 인스턴스를 생성할 때 차례대로 수행됨
> 클래스 변수는 항상 인스턴스 변수보다 먼저 생성되고 초기화 된다.
