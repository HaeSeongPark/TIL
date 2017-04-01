# 상속(inheritance)
1. 상속이란
   * 기존의 클래스를 재사용해서 새로운 클래스를 작성하는 것
   * 두 클래스를 조상과 자손으로 관계를 맺어주는 것
   * 자손은 조상의 모든 멤버를 상속받는다. 단, 생성자와 초기화블럭 제외
   * 자손의 멤버개수는 조상보다 적을 수 없다. (같거나 많다.)
   ```java
   class 자손클래스 extends 조상클래스{...}
   
   class Point3D{
   	int x;
    int y;
    int z;
    }
   
   class Point{                        class Point3D extends Point{
   	int x;                                int x;
    int y;                              }
    }
   ```
   
2. 클래스간의 상속 관계
   * 공통부분은 조상에서 관리하고 개별부분은 자손에서 관리
   * 조상의 변경은 자손에 영향을 미치지만, 자손의 변경은 조상에 아무런 영향을 미치지 않는다.

```java
 class Parent{}
 class Child extends Parent{}
 class Child2 extends Parent{}
 class GrandCild extends Child{}
   ```
 ![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Inheritance2.PNG)
 

2-2. 클래스간의 포함 관계
   
   * 한 클래스의 멤버변수로 다른 클래스를 선언하는 것
   * 작은 단위의 클래스를 먼저 만들고, 이 들을 조합해서 하나의 커다란 클래스르 만든다.

```java
 class Circle{
 int x;
 int y;
 int r;
 }
 
 class Circle{                            class Point{
 Point c = new Point();                      int x;
 int r;                                      int y;
 }                                          }
   ```
   
   
   

3 클래스간의 관계결정하기 상속 or 포함
   * 상속관계 `~은 ~이다. (is -a)`
   * 포함관계 `~은 ~을 가지고 있다. (has-a)`
   * 원(Circle)은 도형(Shape)이다. (A Circle is a Shape) : 상속관계
   * 원(Circle)은 점(Point)를 가지고 있다. (A Circle has a Point) : 포함관계

```java
 class Circle{
 int x;
 int y;
 int r;
 }
 
 class Circle{                            class Point{
 Point c = new Point();                      int x;
 int r;                                      int y;
 }                                          }
   ```




4 단일상속
   * 자바는 단일상속만 허용

```java
class TVCR extends TV,VCR{...} // 이와 같은 표현은 허용되지 않는다.

//비중이 높은 클래스 하나만 상속관계로, 나머지는 포함관계로 한다.
class TvTVCR{                                           class TVCR extends TvTVCR{
	boolean power;                                   VCR vcr = new VCR();
    int channel;                                     int counter = vcr.counter;
    
    void power() {power = !power;}                   void play(){
    void channelUp() {++channel;}                      vcr.play();
    void channelDown(){--channel;}                    }
    }                                                  ...
     
    class VCR{                                       }
    boolean power;
    int counter = 0;
    void power() {power = !power;}
    void play(){...}
    void stop{...}
   }
    
   ```
   [[풀소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/TVCR.java)
 
 
5 Object클래스 : 모든 클래스의 최고조상
  * 조상이 없는 클래스는 자동적으로 Object클래스를 상속받게 된다.
  * 상속계층도의 최상위에는 Object클래스가 위치한다.
  * 모든 클래스는 Object크래스에 정의된 11개의 메서들를 상속받는다.
  * toString(), equals(Onject obj), hasCode(). ...
```java
  class Tv{...}                                    class Tv extends Object
                                                    {...} 
  class CaptionTv extends Tv{...}                   class CaptionTv extends Tv{...}
    
   ```
