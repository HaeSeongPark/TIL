# java.lang 패키지 String Class
> java.lang패키지는 자바프로그래밍에 가장 기본이 되는 클래스들을 포함하고 있다. 그렇기 때문에 java.lang패키지의 클래스들은 import문 없이도 사용할 수 있다.

1 String 클래스
   * 문자형 배열(char[])과 그에 관련된 메서들이 정의 돼 있다.
```java
	public final class String implemetns java.io.Serializable, Comparable{
    	private char[] value;
        ...
  }
```
* String 인스턴스의 내용은 바꿀 수 없다.(immutable)
```java
	String a = "a";
    String b = "b";               
    String a = a+b;
        /*
	    '+'연사자를 이용해서 문자열을 결합하는 경우 
        인스턴스내의 문자열이 바뀌는 것이 아니라
        새로운 문자열 ("ab")이 담긴 String인스턴스가 생성되는 것이다.
        문자열간의 결합이나 추출 등 문자열을 다루는 작업이 많이 필요한 경우에는
        StringBuffer클래스를 사용하는 것이 좋다.
        StringBuffer인스턴스에 저장된 문자열은 변경 가능
        */
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass.png)

* String str = "abc";와 String str = new String("abc")의 비교
```java
	String str1 = "abc"; // 문자열 리터럴 "abc"의 주소가 str1에 저장됨
    String str2 = "abc"; // 문자열 리터럴 "abc"의 주소가 str2에 저장됨
    String str3 = new String("abc"); //새로운 String인스턴스를 생성
    String str4 = new String("abc"); // 새로운 String인스턴스를 생성
  	print(str1==str2); // 주소값비교 true
    print(str3==str4); // 주소값비교 false
    print(str1.equals(str2)); 문자열비교 true
    print(str3.equals(str4)); 문자열비교 true
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass2.png)

2 빈 문자열("", empty String)
* 내용이 없는 문자열, 크기가 0인 char형 배열을 저장하는 문자열
* 크기가 -인 배열을 생성하는 것은 어느타입이나 가능
```java
	char[] chArr = new char[0]; // 길이가 0인 char배열
    int[] iArr = {}; // 길이가 0인 int 배열
 ```
 * String str=""은 가능해도 char c='';는 불가능,
 *  char형 변수에는 반드시 하나의 문자를 지정해야 한다.
 *  String은 참조형의 기본값인 null보다 빈 문자열로 초기화하고
 *  char형은 기본값인 '\u0000'보다 공백으로 초기화하자
 
 ```java
 	String s = null;         -> String s = ""; // 빈 문자열로 초기화
    char c  = '\u0000';      -> char c =' '; // 공백으로 초기화
 ```
 
3 String 클래스의 생성자와 메서드
