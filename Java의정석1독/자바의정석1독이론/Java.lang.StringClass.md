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
* 참조:자바의정석![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method.png)
* 참조:자바의정석![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method2.png)
* 참조:자바의정석![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method.png)

4 join()과 StirngJoiner
* join()은 여러 문자열 사이에 구분자를 넣어서 결합한다. 구분자로 문자열을 자르는 spilt()과 반대의 작업
```java
String animals = "dog,cat,bear";
String[] rr = animals.split(","); // 문자열을 ','를 구분자로 나눠서 배열에 저장
String str = String.join("-",arr); // 배열의 문자열을 '-'로 구분해서 결합
print(str);                        // dog-cat-bear
```
* java.util.StringJoiner 클래스를 사용해서 문자열을 결합할 수도 있다.
```java
StringJoiner sj = new StringJoiner(",","[","]");
String[] strArr = {"arr","bbb","ccc"};
for(Sring s : strArr)
	sj.add(s.toUpperCase());

System.out.println(sj.toString()); // [AAA,BBB,CCC]
```
5 유니코드와 보충문자
* 위의표에서 매개변수의 타입이 char인 것들이 있고, int인 것들도 있다. int인 것은 확장된 유니코드를 다루기 위함 이다.
* 유니코드는 원래 2byte(16비트) 문자체계인데, 이걸로 모자라 20비트로 확장하게 됐다.
* 그래서 하나의 문자를 char타입으로 다루지 못하고, int타입으로 다룰 수밖에 없다.
* 확장에 의해 새로 추가된 문자들을 '보충 문자'라고 하는데,
* Stirng클래스의 메서드 중에서는 보충 문자를 지원하는 것이 있고, 지원하지 않는 것이 있다.
* 이들을 구별하는 방법은 'int ch'인 것들은 보충문자를 지원하는 것이고, 'char ch'인 것은 지원하지 않는 것이다.

6문자 인코딩 변환
* getBytes(String charsetName)를 사용하면, 문자열의 문자 인코딩을 다른 인코딩으로 변경할 수 있다.
* 자바가 UTF-16을 사용하지만, 문자열 리터럴에 포함되는 문자들은 OS의 인코딩을 사용
* 한글 윈도우즈의 경우 문자 인코딩으로 CP949(MS949)를 사용하며, UTF08로 변경하려면

```java
	byte[] utf8_str = "가".getBytes("UTF-8"); //문자열을 UTF-8로 변환
    String str = new String(utf8_str, "UTF-8"); //byte배열을 분자열로 변환
```
* 'System.out.println(java.nio.charset.Charset.availableCharsets());'로 사용가능한 문자 인코딩의 목록을 볼 수 있다.
* 서로 다른 문자 인코딩을 사용하는 컴퓨터 간에 데이터를 주고 받ㄷ을 때는 적절한 문자 인코딩이 필요
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/StringEx5.java)

7 String.format()
* format()은 형식화된 문자열을 만들어내는 간단한 방법.
* printf()하고 사용법이 똑같다.
```java
	String str = String.format("%d 더하기 %d는 %d입니다.",3,5,3+5);
    System.out.println(str); // 3 더하기 5는 8입니다.
```
8 기본형 값을 String으로 변환
```java
	int i = 100;
    String str = i+""; // 100을 "100"으로 변환하는 방법1
    String str2 = String.valueOf(i); // 100을 "100"으로 변환하는 방법2
```
* 성능은 valueOf()가 더 좋지만, 빈 문자열을 더하는 방법이 간단하고 편하다.
* 참조변수에 String을 더하면, 참조변수가 가리키고 있는 인스턴스의 toString()을 호출하여 String을 얻은 다음 결합

9 String을 기본 기본형 값으로 변환하는 방법
```java
	int i = Integer.parseInt("100");
    int i2 = Integer.valueOf("100"); 
    // valueOf()의 반환 타입은 int가 아니라 Integer인데, 
    //오토박싱에 의해 Integer가 int로 자동 변환(JDK1.5이후)
    char c = "A".charAt(0);
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20change%20String.png)
* 문자열 변환할 때 습관적으로 trim()을 사용하는 것이 좋다.
```java
	int val = Integer.parseInt(" 123 " ).trim());
```
