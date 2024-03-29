# 생성자는 객체를 생성하기 위한 것이다?
> 생성자가 객체를 생성할 때 사용되기는 하지만, 객체를 초기화할 목적으로 사용되는 것이다. 객체를 생성한는 것은 new 연산자이다.

# this는 클래스에서라면 어디서든 사용할 수 있다?
> this는 인스턴스 자신의 주소를 저장하고 있으며, 모든 인스턴스메서드에 숨겨진 채로 존재하는 지역변수이다. 그래서 인스턴스메서드 내에서만 사용할 수 있고 클래스멤버(static 붙은 변수나 메서드)에는 사용할 수 없다.

# 지역변수는 heap영역에 생성되며 가비지 컬렉터에 의해 소멸된다?

> 지연변수는 자신이 선언된 블럭이나 메서드가 종료되면 소멸되므로 메모리 부담이 적다. 힙(heap)영역에는 인스턴스(인스턴스변수)가 생성되는 영역이며, 지역변수는 호출스택(call stack)에 생성된다.

# 문자열을 매개변수로 쓸 때 조심해야 할 것

> 문자열은 내용을 변경할 수 없기 때문에 덧셈등 연산을 하면 새로운 문자열이 생성되고 새로운 문자열의 주소가 생성된다

```java
 class Exercise6_19{
 	public static void change(String str){
    	str += "456";
    }
    main{
          String str = "ABC123";
          System.out.println(str);
          change(str);
          System.out.println("After change");
          System.out.println(str);
        }
   }
   결과
   ABC123
   After change
   ABC123
   
   String은 참조형이다. 따라서 change의 메서드의 매개변수가 참조형인데도 main의 str이 변경되지 않았다 왜일까?
```
처음에 문자열을 참조변수 str에 저장하면 다음과 같다.
```java
String str = "ABC123";
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Exercise6_19_1.PNG)

그 다음에 메서드 change를 호출하면서 참조변수 str을 넘겨주면, 메서드 change의 지역변수 str에 주소값 0x100(임의의 주소값)이 저장된다. 이제 메서드 change의 지역변수 str 문자열 "ABC123"을 참조하게 된다. 이 두 참조변수는 이름은 같지만 부명히 다른 변수이다. 서로 다른 영역에 있기 때문에 이름이 같아도 상관없는 것이다.
```java
chnage(str); // change를 호출하면서 문자열 str을 넘겨준다.
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Exercise6_19_2.PNG)

메서드 change에서는 넘겨받은 문자열의 뒤에 "456"을 붙인다. **문자열은 내용을 변경할 수 없기 때문에** 덧셈연산을 하면 새로운 문자열이 생성되고 새로운 문자열의 주소가 str에 저장된다.
```java
 public static void change(String str){
   	str += "456";  //기존의 문자열에 "456"을 붙인다.
  }
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Exercise6_19_3.PNG)

이제 change메서드는 종료되고, 작업에 사용하던 메모리를 반환하므로 change메서드의 지역변수인 str역시 메모리에서 제거된다. 다시 main메서드로 돌아와서 문자열 str의 값을 출력하면 처음의 값과 변함없는 값이 출력된다. 문자열 "ABC123456"은 참조하는 변수가 하나도 없으므로 적절한 시기에 가비지컬렉터(garbage collector)에 의해 제거된다.

```java
    System.out.println(str);
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Exercise6_19_4.PNG)

> 그림, 소스, 설명은 책, 자바의정석에서 발췌했습니다.
