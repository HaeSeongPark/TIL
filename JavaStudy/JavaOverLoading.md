# 오버로딩
1. 오버로딩이란
> 한 클래스 내에 같은 이름의 메서드를 여러 개 정의하는 것

2. 오버로딩조건
> * 메서드 이름이 같아야 한다.
> * 매개변수의 개수 또는 타입이 달라야 한다.

3. 오버로딩예
```java
 void println()
 void println(boolean x)
 void println(char x)
 ...
 
 long add(int a, long b) {return a+b;}
 long add(long a, int b) {return a+b;}
 ```
 
3-2. 오버로딩이 성립하지 않는 예
```java
int add(int a, int b) { return a+b;}
int add(int x, int y)  { return x+y;}
// 매개변수의 이름만 다를 뿐 매개변수의 타입과 개수가 같은 경우
 
int add(int a, int b) {return a+b;}
long add(int a, int b) { return (long)(a+b);}
// 리턴타입만 다른 경우
```

4.오버로딩의장점
* 메서드 이름 절약
* 오버로딩이 없다면 위의 println에서 각기 다른 이름을 줘야한다. 따라서 작성하는 사람이나 사용하는 사람 둘다 피곤하다.


5.가변인자(variable arguments)
* 기존에는 메서드의 매개변수 개수가 고정적이었으나 jdk1.5부터 동적으로 지정해 줄 수 있게 됐고 이 기능을 가변인(variable arguments)자라고 한다. '타입...변수명'과 같은 형식으로 선언

```java
String concatenate(String...str){...}
//가변인자 외에도 매개변수가 더 있다면, 가변인자를 매개변수 중에서 제일 마지막에 선언해야 한다.
String concatenate(int a, Stirng...str){...}

```java
//사용
print(concatenate());   //인자없음
print(concatenate("a")); //인자하나
print(concatenate(new Stirng[]{"A","B"})); //배열도 가능, 가변인자는 배열을 사용하기 때문
//주의 ,print(concatenate({"A","B"})); 이렇게는 안 됨
//주의 ,print(concatenate(null)); null 안됨
```

```java
 //가변인자와 매개변수의 타입을 배열로 하는 것과의 차이점
 String concatenate(String[] str){...}
 
 print(concatenate(new Stirng[0]));   //인자로 배열을 지정
 print(concatenate(null));   // 인자로 null을 지정
 print(concatenate());   // 에러, 인자가 필요함
```

5-2.가변인자(variable arguments)의 오버로딩
> 가변인자를 선언한 메서들르 오버로딩하면, 메서드를 호출했을 때 구별되지 못하는 경우가 자주 발생할 수 있기 때문에 가능하면 사용하지 않는 것이 좋다. [[소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch6/VarArgsEx.java)
