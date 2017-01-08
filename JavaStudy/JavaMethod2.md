# 메서드의 선언과 구현

```
 반환타입 메서드이름 (타입 변수명, 타입 면수명, ...)   //선언부
 {
 	//메서드 호출시 수행될 코드                       //구현부
 }
```
```java
int add(int a, int b)                                //선언부
{
	int result = a+b;                                //구현부
    return result;                                   //반환타입 일치해야 한다.
 }
```

# 메서드 호출

```
    메서드 이름(값1, 값2, ...);
    int result = add(3,5);
```

# 리턴문
> 모든 메서드에는 적어도 하나의 return문이 있어야한다. 그러나 반환타입이 void인 경우, return문이 없어도 된다. 컴파일러가 자동으로 추가해주기 때문.

# 간단한 JVM의 메모리구조

1. Method Area
 > 프로그램 실행 중 어떤 클래스가 사용되면, JVM은 해당 클래스의 클래스파일을 읽어서 클래스변수를 포함한 **클래스**에 대한 정보를 저장

2. Heap
 > **인스턴스**가 생성되는 공간.

2. call stack
 > 메서드의 작업에 필요한 메모리 공간을 제공 메소드가 호출되면, 호출스택에 호출된 메서드를 위한 메모리가 할당되며, 이 메모리는 메서드가 작업을 수행할 동안 **지역변수**(매개변수 포함)들과 연산의 중간결과 등을 저장하는데 사용. 후에 메서드가 작업을 마치면 할당되었던 메모리공간은 반환돼 비워진다.
 

# 기본형 매개변수와 참조형 변수
* 기본형 매개변수 read only    [소스](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/PrimitiveParamEx.java)
* 참조형 매개변수 read & write [소스](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/ReferenceParamEx.java)

# 참조형 반환타입
> 매개변수뿐만 아니라 반환타입도 참조형이 될 수 있다. 반환타입이 참조형이라는 것은 반환하는 값의 타입이 참조형. 모든 참조형 타입의 값은 '객체의 주소'이므로 그저 정수값이 반횐되는 것일 뿐. [소스](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/ReferenceReturnEx.java)

# 재귀함수
> 매서드의 내부에서 메서드 자신을 다시 호출하는 것. recursive call  [소스](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/RecursiveCallFactorial.java)

```
논리적 간결함 : 몇 겹의 반복문과 조건문으로 복잡하게 작성된 코드가 재귀호출로 작성하면 단순한 구조로 바뀔 수 있다. 아무리 효율적이라도 알아보기 힘들게 작성하는 것보다 다소 비효율적이더라도 알아보기 쉽게 작성하는 것이 논리적 오류가 발생할 확률도 줄고 나중에 수정도 쉽다.

반복적인 작업을 처리한다면, 먼저 반복문으로 작성해보고 너무 복잡하면 재귀호출로 할 수 있는지 고민하기. 재귀호출은 매개변수 복사, 종료 후 복귀할 주소저장 등 비효율적이므로 재귀호출에 드는 비용보다 재귀호출의 간결함이 주는 이득이 충분히 큰 경우에만 사용하기
```

# 클래스 메서드(static)와 인스턴스 메서드

* 인스턴스 메서드는 인스턴스 변수와 관련된 작업을 하는 메서드
* 클래스메서드는 인스턴스와 관계없는(인스턴스 변수나 인스턴스 메서드를 사용하지 않는) 메서드
[[소스]](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/StaticAndInstanceMethod.java)

1.클래스를 설게할 때, 멤버변수 중 모든 인스턴스에 공통적으로 사용해야하는 것은 static을 붙인다.
2.클래스 변수는 인스턴스를 생성하지 않아도 사용가능
3.클래스 메서드는 인스턴스 변수를 사용할 수 없다,
4.메서드 내에서 인스턴스 변수를 사용하지 않는다면, static을 붙이는 것을 고려 

# 클래스 멤버와 인스턴스 멤버간의 참조와 호출
> 같은 클래스에 속한 멤버들 간에는 별도의 인스턴스를 생성하지 않고도 서로 참조 또는 호출이 가능
> 단, 클래스멤버가 인스턴스 멤버를 참조 또는 호출하고자 하는 경우에는 인스턴스를 생성해야한다. **그 이유는 인스턴스 멤버가 존재하는 시섬에 클래스 멤버는 항상 존재하지만, 클래스 멤버가 존재하는 시점에 인스턴스 멤버가 존재하지 않을 수도 있기 때문.**

```java
	class TestCalss{
    void instanceMethod(){} //인스턴스 메서드
    static void staticMethod(){} //static메서드
    
    void instanceMethod2() // 인스턴스메서드
    {
    	instaceMethod();     // 다른 인스턴세메서드 호출
        staticMethod();      //static메서드 호출
    }
    
    static void staticMethod2() // static 메서드
    {
    	instaceMethod();     // 에러, 인스턴스메서드 호출 불가
        staticMethod();      // static메서드 호출
    }
 }
```

```java
	class TestCalss2{
	 int iv;
     static int cv;
    
    void instanceMethod2() // 인스턴스메서드
    {
    	System.out.println(iv); //인스턴스변수 사용
        System.out.println(cv); //클래스변수 사용
    }
    
    static void instanceMethod2() // static 메서드
    {
    	System.out.println(iv); //에러, 인스턴스변수 사용 불가
        System.out.println(cv); //클래스변수 사용
    }
 }
```

> 인스턴스를 생성하여 인스턴스멤버 사용하는 [[소스]](https://github.com/HaeSeongPark/TIL/blob/master/javastudy/src/ch6/MemberCall.java)
