# java.lang 패키지 StringBuffer&Builder Class
1 StringBuffer클래스의 특징
   * String처럼 문자형 배열(char[])을 내부적으로 가지고 있다.
```java
	public final class String implemetns java.io.Serializable, Comparable{
    	private char[] value;
        ...
  }
```
* 그러나 String클래스와 달리 내용을 바꿀 수 있다.(mutable)
```java
	StringBuffer sb = StringBuffer("abc");
    sb.append("123");
    
    sb.append("123").append("ZZ");
    //sb.append("123") = sb // 객체 자신을 반환
```

* 인스턴스를 생성할 때 버퍼(배열)의 크기를 충분히 지정해주는 것이 좋다.
 > 버퍼가 작으면 성능 저하 - 작업 중에 더큰 배열의 생성이 필요
```java
	public StringBuffer(int length){        public StringBuffer(String str){
    	value = new char[length];				this(str.length() + 16); // 지정한 문자열 길이보다 +16
        shared = false;							append(str);
  }										   }
  
  public StringBuffer(){
   this(16);  //버퍼의 크기를 지정하지 않으면 버퍼의 크기는 16이 된다.
   }
```
* String클래스와 달리 equals()를 오버라이딩하지 않았다.
```java
	StringBuffer sb = new StringBuffer("abc");
    StringBuffer sb2 = new StringBuffer("abc");
    sb == sb2 // false
    sb.equals(sb2); // false
    
    String s = sb.toString();
    String s2 = sb2.toString();
    s.equals(s2); // true
```
* 크기변경
> 배열의 길이는 변경될 수 없으므로 새로운 길이의 배열을 생성한 우에 이전 배열의 값을 복사
```java
	//새로운 길이(newCapacity)의 배열을 생성한다. newCapacity는 정수
	char newValue[] = new char[newCapacity];
    
    //배열 value의 내용을 배열 newValue로 복사
    System.arraycopy(value, 0, newValue, 0, count); // count는 문자열의 길이
    value = new Value; // 새로 생성된 배열이 주소를 참조변수 value에 저장
```

2 StringBuffer클래스의 생성자와 메서드
* 참조:자바의정석![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringBufferClass.png)
* 참조:자바의정석 ![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringBufferClass2.png)

3 StringBuilder
* 멀티쓰레데에 안전(thread safe)하도록 동기화돼 있다.
* 참고로 동기화가 StringBuffer의 성능을 떨어뜨린다
* 멀티쓰레드로 작성된 프로그램이 아닌 경우, StringBuffer의 동기화는 불필요하게 성능을 떨어뜨린다
* 그래서 StringBuffer에서 쓰레드의 동기화만 뺀 StringBuilder가 새로 추가됐다.
* StringBuilder는 StringBuffer와 완전히 똑같은 기능으로 작성돼 있다.
```java
	StringBuffer sb = new StringBuffer();  StringBuilder sb = new StringBuilder();
    sb.append("abc");                      sb.append("abc");
```
* StringBuffer도 충분히 성능이 좋기 때문에 성능향상이 반드시 필요한 경우를 제외하고는 Buffer를 Builder로 굳이 바꿀 필요는 없다.
