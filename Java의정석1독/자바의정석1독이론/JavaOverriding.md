# 오버라이딩(overriding)
1. 오버라이딩인란?
   * 조상클래스로부터 상속받은 메서드의 내용을 상속받는 클래스에 맞게 변경하는 것을 오버라이딩이라고 한다.
   * 
 ```java
class Point{                      
   	int x;                          
    int y;
    
      String getLocation(){
          return "x :" + x + ", "y : " + y;
      }
    }
    
class Point3D extends Point{
	int x;
    String getLocation(){
          return "x :" + x + ", "y : " + y + ", z : " + z;
}
   ```
   
2. 오버라이딩의 조건
   * 선언부(이름, 매개변수, 리터타입)가 같아야 한다.
   * 접근제어자를 좁은 범위로 변경할 수 없다.  : 조상의 메서드가  protected라면, 범위가 같거나 넓은 protected나 public으로만 변경가능
   * 조상클래스의 메서드보다 많은 수의 예외를 선언할 수 없다.
```java
 class Parent{
 	void parentMethod() throws IOException, SQLEXception{...}
 }
 class Child extends Parent{
 	void parentMethod() throws IOException{...}
}
 class Child2 extends Parent{
 	void parentMethod() throws Exception{...} //에러
 }
// 단순히 선언된 예외의 개수의 문제가 아니다. 분명 조상클래스에 정의된 메서드보다 예외계수가 적지만, Exception은 모든 예외의 최고 조상이므로 가장 많은 개수의 예외를 던질 수 있다. 따라서 조건을 만족하지 못한다.
   ```



3 오버로딩 vs. 오버라이딩
   * 오버로딩(overloading) : `기존에 없는 새로운 메서드를 정의하는 것(new)`
   * 오버라이딩(overriding) : `상속받은 메서드의 내용을 변경하는 것(modify)`

```java
 class Parent{
 	void parentMethod(){}
 }
 
 class Child extends Parent{    
 	void parentMethod() {} // 오버라이딩
    void parentMethod(int i) // 오버로딩
    
    void childMethod(){}
    void childMethood(int i){} // 오버로딩
    void childMethod(){}// 에러, 중복정의
 }

   ```




4  super : 참조변수
   * super : `this와 같음. 조상의 멤버와 자신의 멤버를 구별하는데 사용`
   * this : `인스턴스자신을 가리키는 참조변수. 인트선트의 주소가 저장돼 있음. 모든 인스턴스 메서드에 지역변수로 숨겨진 채로 존재`

 ```java
class Point{                      
   	int x;                          
    int y;
    
      String getLocation(){
          return "x :" + x + ", "y : " + y;
      }
    }
    
class Point3D extends Point{
	int x;
    String getLocation(){
          return super.getLcation + ", z : " + z;
}
   ```
 * [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/SuperTest.java)
 * [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/SuperTest2.java)
 
5 super() : 조상의 생성자
  * 자손클래스의 인스턴스를 생성하면, 자손의 멤버와 조상의 멤버가 합쳐진 하나의 인스턴스가 생성된다.
  * 조상의 멤버들도 초기화되어야 하기 때문에 자손의 생성자의 첫 문장에서 조상의 생성자를 호출해야 한다.
* Object클래스를 제외한 모든 클래스의 생성자 첫 줄에는 생서자(같은 클래스의 다른 생성자 또는 조상의 생성자)를 호출해야 한다.
```java
  class Point{                                         class Point extends Object{
  	int x;                                                int x;
    int y;                                                int y;
    Point (){                                             Point (){
       this(0,0);										     this(0,0);
     }    													}
    Point(int x, int y){							        Point(int x, int y){
    	this,x = x;												super(); //Object();
        this.y = y;                                             this.x = x;
      }                                                         this.y = y;	
      														}
  }                                                 
    
   ```
   
 * [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/SuperConstructor.java)
