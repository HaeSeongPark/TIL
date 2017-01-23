# java.lang 패키지 
1 wrapper클래스
* 기본형을 클래스로 정의한 것
* 기본형 값도 객체로 다뤄져야 할 때가 있다.
* ![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.lang.wrapper.png)
* 내부적으로 기본형(primitive type) 변수를 가지고 있다.
```java
	public final class  Integer extends Number implements Comparable{
    	...
        private int value;
    }
```
* 값을 비교하도록 equals()가 오버라이딩돼 있다.
* 추가적으로 compareTo(), toString, MAX_VALUE, MIN_VALUE,SIZE,BYTES,TYPE이 있다.
```java
	Integer i = new Integer(100);
    Integer i2 = new Integer(100);
    i==i2 // false
    i.equals(i2) // true
    i.compareTo(i2) // 0   같음
    i.toString() // 100
    MAX_VALUE // 2147483647
    MIN_VALUE // - 2147483647
    SIZE // 32bits
    BYTES  // 4bytes
    TYPE // int
```
* compareTo

반환되는 값 | 설명
------------ | -------------
    0 | 두 값이 같음
   양수 | result = i.compareTo(i2) 일 경우 i > i2
   음수 | result = i.compareTo(i2) 일 경우 i < i2


2 NumberClass
* 숫자를 멤버변수로 갖는 클래스의 조상(추상클래스)
* ![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.lang.NumberClass.png)
* 문자열을 숫자로 변환하기
```java
int  i = new Integer("100").intValue(); // floatValue(), longValue(),...

int i2 = Integer.pareseInte("100"); 
// Float.parseFloat(), Long.parseLong() // 반환값이 기본형

Integer i3 = Integer.valueOf("100");
// Float.valueOf(), Long.valueOf() // 반환값이 래퍼클래스

//JDK1.5부터 도입된 '오토박싱' 기능 때문에 반환값이 기본형일 때와 래퍼클래스일 떄차이가 없다.
//그래서 그냥 구분없이 valueOf()를 쓰는 것도 괜찮지만 성능은 valueOf()가 느리다.
```
* 문자열이 10진수가 아닌 다른 진법(radix)일 때의 변환
   - static int pareseInt(String s, int radix) // 문자열 s를 radix진법으로 인식
   - static Integer valueOf(String s, int radix)
```java
	int i4 = Integer.paresInt("100",2); // 100(2) - > 4
    int i5 = Integer.paresInt("100",8); // 100(8) - > 64
	int i6 = Integer.paresInt("100",16); // 100(16) - > 4
	int i7 = Integer.paresInt("FF",16); // FF(16) - > 266
	int i8 = Integer.paresInt("FF"); // NumberFormatException발생
    //진접을 생략하면 10진수로간주하기 때문에 에러 발생

```
3 autoBoxing & unboxing
* autoBoxing : 기본형 값을 래퍼클래스의 객체로 자동변환해주는 것
```java
	Integer intg = (integer)i;   -> Integer intg = Integer.Valueof(i);
    Object obj = (Object)i;       -> (Object)Integer.valueOf(i);
    Long   lng = 100L;            -> Long lng = new Long(100L);
```

* unBoxing : 래퍼클래스 값을 기본형으로 자동변환해주는 것
```java
	int i = 5;
    Integer iObj = new Integer(7);
    
    int sum = i + iObj;      ->   int sum = i + iObj.intValue();
```
