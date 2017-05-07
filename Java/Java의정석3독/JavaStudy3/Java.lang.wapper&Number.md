> 출처 : 자바의 정석

# Java.lang.wrapper&Number

## 1. wrapperClass
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.lang.wrapper.png)
* 기본형을 클래스로 정의한 것
* 기본형 값도 객체로 다뤄져야 할 때가 있다.
* 내부적으로 기본형 변수를 가지고 있다.
```java
	public final class Integer extends Number implements Comparable{
    ...
    private int vlaue;
  }
```

* 값을 비교하도록 equals()가 오버라이딩돼 있다.
* 추가적으로 compareTo(), toString, MAX_VALUE,MIN_VALUE,SIZE,BYTES,TYPE이 있다.
```java
	Integer i = new Integer(100);
    Integer i2 = new Integer(100);
    i==i2 // false
    i.compareTo(i2) 0, 같을 때 0
    i.toString() // 100
    
    MAX_VALUE // 2147483647
    MIN_VALUE // - 2147483647
    SIZE // 32bits
    BYTES  // 4bytes
    TYPE // int
```

* CompareTo
   - 0 : 두 값이 같음
   - 양수 : i > i2 ( result = i.compareTo(i2))
   - 음수 : i < i2 ( result = i.compareTo(i2))

## 2. Number클래스
* 숫자를 멤버변수로 갖는 클래스의 조상(추상클래스)
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.lang.NumberClass.png)
* 문자열을 숫자로 변환하기
```java
	int i = new Integer("100").intValue; // floatValue, longValue(),...
    int i2 = Integer.parseInt("100");
    // Float.parseFloat, Long.parseLong() // 반환값이 기본형
    
    Integer i3 = Integer.valueOf("100");
    // Float.valueOf(), Long.valueOf() // 반환값이 래퍼 클래스
    
    //JDK1.5부터 도입된 '오토박싱' 기능 덕분에 반환값이 기본형일 때와 래퍼클래스일 때 차이가 없다.
    // 다만, valueOf의 성능이 parseInt()보다 느리다.
```

* 문자열이 10진수가 아닌 다른 진법(radix)일 때으 ㅣ변환
   - static int parseInt(String s, int radix) // 문자열 s를 radix진법으로 인식
   - static Integer valueOf(String s, int radix)
 ```java
   int i4 = Integer.parseInt("100",2); // 100(2) -> 4
   int i5 = Integer.paresInt("100",8); // 100(8) -> 64
   int i6 = Integer.parseInt("100",16); // 100(16) -> 256
   int i7 = Integer.paresInt("FF",16); // 256
   int i8 = Integer.pareeInt("FF"); // NumberFormatException발생
   // 진법을 생략하면 10진수로 간주하기 때문에 에러 발생
 ```


* autoBoxing : 기본형 값을 래퍼클래스의 객체로 자동 변환
```java
	Integer intg = (Integer)i; // Integer intg = Integer.valueOf(i);
    Object obj = (Object)i;
    Long lng = 100L; // Long lng = new Long(100L);
```
* unBoxing : 래퍼클래스 값을 기본형으로 자동변환해주는 것
```java
	int i = 5;
    Integer iObj = new Integer(7);
    int sum = i + iObj; // int sum = iObj.intValue();
```


