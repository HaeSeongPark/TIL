# 내부 클래스(inner class)
1 내부 크래스란?
* 클래스 내에 선언된 클래스
* 클래스 내에 클래스를 선언하는 이유는 두 클래스가 서로 긴밀한 관계이기 때문
* 내부 클래스의 장점
	- 내부 클래스에서 외부 클래스의 멤버들을 쉽게 접근할 수 있다.
	- 코드의 복잡성을 줄일 수 있다.(캡슐화)
```java
	class A { //외부 클래스
      ...
      class B{ // 내부클래스
      	...
       }
       ...
   }
```
2 내부 클래스의 종류와 특징

내부 클래스  종류     |     특징
----------------------| ---------------------------
instance  class   | 외부의 클래스의 멤버변수 선언위치에 선어하며, 외부 클래스의 인스턴스멤버처럼다루어 진다.                          주로 외부 클래스의 인스턴스 멤버들과 관련된 작업에 사용될 목적으로 선언
static class        |  외부 클래스의 멤버변수 선언위치에 선언하며, 외부 클래스의 static멤버처럼 다루어진다. 주로 외부 클래스의 static멤버, 특히 static메서드에서 사용될 목적으로 사용
local class | 외부 클래스의 메서드나 초기화블럭 안에 선어하며, 선언된 영역 내부에서만 사용될 수 있다.
anonymous class| 클래스의 선언과 객체의 생성을 동시에 한느 이름 없는 클래스

3 내부 클래스의 선언
```java
	class Outer{                               class Outer{
    	int iv = 0;                              class InstanceInner{}
        static int cv=0;						 static class StaticInner{}
        
        void myMethod(){					     void myMethod(){
        	int lv = 0;								class LocalInner{}
            }									   }
      }										    }
```

4 내부 클래스의 제어자와 접근성
 내부 클래스도 클래스이기 때문에 abstract나 final과 같은 제어자를 사용할 수 있을 뿐만 아니라, 멤버변수들처럼 private, protexted와 같은 접근제어자도 사용 가능
 ```java
	class Outer{          
         private class InstanceInner{}
		 protected static class StaticInner{}
        
		 void myMethod(){
			class LocalInner{}
	   		}
	   }
```
* [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx1.java)
*  [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx2.java)
*  [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx3.java)
*  [[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx4.java)
* [[관련소스5]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx5.java)


5 익명클래스
* 이름이 없다.
* 클래스의 선언과 객체의 생성을 동시에 하기 때문
* 그래서 한번만 사용될 수 있고 오직 하나의 객체만을 생성할 수 있는 일회용 클래스
```java
	new 조상클래스이름(){
    	//멤버 선언
    }
```
```java
	new 구현 인터페이스이름(){
    	//멤버 선언
    }
```
* [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx6.java)
*  [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx7.java)
*  [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/InnerEx8.java)
