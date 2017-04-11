> 출처 : 자바의 정석

# Java.lang.StringBuffer&Builder
## 1. 특징
* String 처럼 문자열 배열(char[])을 내부적으로 가지고 있다.
```java
	public final class StringBuffer implements java.io.Serializable, Comparavle
    {
    	private char[] value;
    	...
    }	
```
* 그러나 String클래스와 달리 내용을 바꿀 수 있다.(mutable)
```java
	StringBuffer sb = new StringBuffer("abc");
    sb.append("123");
    sb.append("123").append("ZZ");
```
* 인스턴스 생성할 때 버퍼(배열)의 크기를 충분히 지정해 주는 것이 좋다.
    - 버퍼가 작으면 성능 저하 : 작업 중에 더 큰 배열을 생성해야 하므로
```java
	public StringBuffer(int length){
    	value = new char[length];
        shared = false;
     }
     
     public StringBuffer(){
     	this(16); // 버퍼의 크기를 지정하지 않으면 버퍼의 크기는 기본으로 16이 된다.
    }
    
    public StringBuffer(String str){
    	this(str.length() + 16 );
        append(str);  // 지정한 문자열의 길이보다 16이 더 크게 버퍼를 생성
     }
```

* 크기 변경 : 배열의 길이는 변경될 수 없으므로 새로운 길이의 배열을 생성한 후에 이전 배열의 복사
```java
	//새로운 길이(newCapacity)의 배열을 생성한다. newCapacity는 정수
    char newValue[] = new char[newCapacity];
    
    // 배열 value의 내용을 배열 newValue로 복사
    System.arraycopy(value, 0, newValue, 0, count); // count는 문자열의 길이
    value = newValue; // 새로 생성된 배열이 주소를 참조변수 value에 저장
```
* StringBuffer클래스는 String클래스와 달리 equals()를 오버라이딩하지 않았다.
* 따라서 toString을 이용해서 비교해야 한다.
```java
	StringBuffer sb = new StringBuffer("abc");
    StringBuffer sb2 = new StringBuffer("abc");
    sb == sb2; // false
    sb.equals(sb2); // false
    
    String s = sb.toString();
    String s2 = sb2.toString();
    s.equals(2); // true
```
* StringBuffer클래스의 생성자와 메서드
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringBufferClass.png)
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringBufferClass2.png)


## StringBuilder
* StringBuffer는 멀티쓰레드에 안전(thread safe)하도록 동기화돼 있다.
* 동기화는 StringBuffer의 성능을 떨어뜨린다.
* 멀티쓰레드를 작성된 프로그램이 아닌 경우, StringBuffer의 동기화는 불필요하게 성능만 떨으뜨린다.
* 그래서 StringBuffer에 쓰레드의 동기화 만 뺀 StringBuilder가 새로 추가됨.
* StringBuilder는 StringBuffer와 똑같은 기능이다.
