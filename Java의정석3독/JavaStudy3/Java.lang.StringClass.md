> 출처 : 자바의 정석

# Java.lang.StringClass

## 1. immutable클래스
* 인스턴스 생성 시 생성자의 매개변수로 입력받는 문자열은 인스턴스변수(value)에 문자형 배열(char[])로 저장되는 것.
```java
	public final class String implements java.io.Serializable, Comparable{
    	private char[] value;
        ...
     }
```
* 한 번 생성된 String인스턴스가 갖고 있는 문자열은 읽어 올 수 만 있고, 변경할 수는 없다.
```java
	String a = "a";
    String b = "b";
    String a = a + b;
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass.png)

* String str = "abc";와 String str = new String("abc");의 비교
```java
	String str1 = "abc"; // 문자열 리터널 "abc"의 주소가 str1에 저장됨
    String str2 = "abc"; // 문자열 리터널 "abc"의 주소가 str2에 저장됨
    String str3 = new String("abc"); // 새로운 String 인스턴스 생성
    String str4 = new String("abc"); // 새로운 String 인스턴스 생성
    print(str1==str2); // true 주소비교
    print(str1.equals(str2)); // true; // 문자열 비교
    print(str3.equals(str4)); // true;
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass2.png)

* 문자열 리터널
   - 자바 소스에 포함된 모든 문자열 리터널은 컴파일 시에 클래스 파일에 저장된다.
   - 이 때 같은 내용의 문자열 리터럴은 한번만 저장된다. 문자열 리터럴도 String인스턴스이고
   - 한 번 생성하면 내용을 변경할 수 없기 때문에 하나의 인스턴스를 공유하면 되기 때문.
## 2. 빈 문자열 ("", empty string)
* 내용이 없는 문자열. 크기가 0인 char형 배열을 저장하는 문자열
* 크기가 0인 배열을 생성하는 것은 어느 타입이나 가능
```java
	char[] cArr = new char[0]; // 크기가 0인 char배열
    int iArr = {};
    ------
    String s = ""; // ok
    char c = ""; // not 반드시 하나의 문자열을 지정해야 한다.
```
* 초기화
```java
	String s = ""; // String은 빈 문자열로 초기화 하는 게 좋다.
    char c = ' '; // 공백으로 초기화
```

## 3. String클래스의 생성자와 메서드
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method.png)
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method2.png)
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20Construct%20Method.png)

## 4. join()과 StringJoiner
* join() : 여러 문자열 사이에 구분자를 넣어서 결합, split()와 반대
```java
	String animals = "dog,cat,bear";
    String[] arr = animals.split(","); // 문자열을 ','를 구분자로 나눠서 배열에 저장
    String str = String.join("-",arr); // 배열의 문자열을 '-'로 구분해서 결합
    System.out.println(str); // dog-cat-bear
```
* java.tuil.StringJoiner클래스를 사용해서 문자열을 결합할 수도 있다.
```java
	StringJoiner sj = new StringJoiner(",","[","]");
    String[] strArr = {"arr","bbb","ccc"};
    for(String s : strArr)
    	sj.add(s.toUpperCase());
        
    print(sj.toString()); // [AAA, BBB, CCC]
```

## 5. 유니코드와 보충문자
* 유니코드 : 16bit 문자 체계 : char타입으로 다룬다.
* 보충문자 : 유니코드에 문자 추가 : 20bit, 하나의 문자를 int타입으로 다룬다.
* String메서드의 매개변수가 char인 것은 보충문자를 지원하지 않는 것
* int인 것은 보충문자를 지원하는 것

## 6. 문자 인코딩 변환
* getBytes(String charsetname)를 사용하면, 문자열의 문자 인코딩을 다른 인코딩으로 변경할 수 있다.
* 자바가 UTF-16을 사용하지만, 문자열 리터널에 포함되는 문자들을 OS의 인코딩을 사용
```java
	byte[] utf8_str = "가".getBytes("UTF-8"); // 문자열을 UTF-8로 변환
    String str = new String(utf8_str,"UTF-8); // byte배열을 문자열로 변환
```

## 7. String.format()
* format()은 형식화된 문자열을 만들어내는 간단한 방법. printf()하고 똑같다.
```java
	String str = String.format("%d 더하기 %d는 %d입니다.",3,5,3+5);
    System.out.println(str); // 3 더하기 5는 8입니다.
```

## 8. 기본형 값을 String으로 변환
```java
	int i = 100;
    String str1 = i + ""; // 100을 "100"으로 변환하는 방법1
    String str2 = String.valueOf(i); // 100을 "100"으로 변환하는 방법2 이게 더 빠름
```

## 9. 문자열을 기본형값으로 변환하는 방법
```java
	int i = Integer.pareInt("100"); // "100"을 100으로 변환하는 방법1
    int i2 = Integer.valueOf("100); // "100"을 100으로 변환하는 방법2(JDK1.5 이후)
    char c = "A".charAt[0]; // 문자열 "A"를 문자 "A"로 변환하는 방법
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.StringClass%20change%20String.png)

* 문자열 변환할 때 습관적으로 trim()을 사용하는 것이 좋다.
```java
	int val = Integer.parseInt(" 123 ".trim());
    " 123 " -> "123" // 앞뒤 공백제거
```

