# 생성자(constructor)

1.생성자란?
* 인스턴스가 생성될 때 호출되는 '인스턴스 초기화 메서드
* 생성자의 이름은 클래스의 이름과 같아야한다
* 생성자는 리턴 값이 없어야 한다.
```java
	//클래스 이름(타입 변수명, 타입 변수명,...){
    //인스턴스 생성 시 수행될 코드,
    //주로 인스턴스 변수의 초기화 코드를 적는다.
    
    class Card()
    {
    	Card(){...} // 매개변수가 없는 기본 생성자
        Card(String k, int num){...}//매개변수가 있는 생성자
    }
```
```java
Card c = new Card();
1.연사자 new에 의해서 메모리(heap)에 Card클래스의 인스턴스가 생성된다
2.생성자 Card()가 호출되어 수행된다
3.연산자 new의 결과로, 생성된 Card의 인스턴스의 주소가 반환되어 참조변수 c에 저장된다.
```
2.기본 생성자
* 모든 클래스에는 반드시 하나 이상의 생성자가 정의 돼 있어야 한다.
* 기본 생성자는 컴파일러가 기본으로 생성해준다. 단, 클래스에 정의된 생성자가 하나도 없어야한다.

3.this(),this
* this 
 > 인스턴스 자신을 가리키는 참조변수, 인스턴스의 주소가 저장돼 있다. 모든 인스턴스메서드에 지역변수로 숨겨진 채로 존재한다.

* this(), this(매개변수)
 > 생성자, 같은 클래스의 다른 생성자를 호출할 때 사용

```java
Car() {                          Car(){
color = "white";                      this("white","auto",4);
gearType = "auto";                    }
door = 4;
}
```
```java
Car(String c, Stirng g, int d) {             Car(String c, Stirng g, int d) {
color = c;                                      this.color = color;
gearType = g;                                   this.gearType = gearType;       
door = d;                                       this.door = door;
}                                             }
```
