# Java Formatting
* java.text패키지에 퐇함되어 있으며 숫자, 날짜, 텍스트데어티를 일정한 형식에 맞게 표현할 수 있는 방법

1 DecimalFormat
* 숫자를 형식화
* 숫자 데이터를 정수, 부동소수점, 금액 등의 다양한 형식으로 포현 가능
* 반대로 일정한 형식의 텍스트 데이터를 숫자로 쉽게 변환하는 것도 가능


기호 | 의미 | 패턴 | 결과(1234567.89)
------------ | ------------- | ------------- | ---
0 | 10진수(값이 없을 때는 0)   | 0, 0.0, 0.0000  |  12345678, 1234567.9, 1234567.8900
\# | 10진수 | #,#.#,#.####  |  12345678, 1234567.9, 1234567.89
. | 소수점 | \#.\# | 1234567.9
- | 음수부호 | #.#-, -#.# | 1234567.9-, -1234567.9
E | 지수기호 | #E0, 0E0 | .1E7, 1E6
; | 패턴구분자 | #,###.##+;#,###.##- | 1,234,567.89+(양수일 때), 1,234,567.89- (음수일 때)
% | 퍼센트 | #.#% | 12356789%
\u2030 | 퍼밀(퍼센트*10)|#.#\u2030 | 1234567890퍼밀
\u00A4 | 통화 | \u00A4 #,### | \ 1,234,568
' | escape문자 | '#'#,### | #1,234,568

```java
	double number = 1234567.89;
    DecimalFormat df = new DecimalFormat("#.#E0");
    String result = df.format(number);
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/DateFormatterEx1.java)

* pares메서드
* pares메서드를 이용하면 기호와 문자가 포함된 문자열을 숫자로 쉽게 변환 가능
* Integer.paresInt메서드는 콤마(,)가 포함된 문자열을 숫자로 변환하지 못한다.
* `public Number parse(String source) throws ParseException
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/DateFormatterEx2.java)


2 SimpleDateFormat
* Date와 Calendar를 출력할 때 유용
* DateFormat은 추상클래로 SimpleDateFormat의 조상, DateFormat는 추상클래스이므로 인스턴스를 생성하기 위해서는 getDateInstance()와 같은 static메서드를 이용해야 한다. getDateInstance()에 의해서 반환되는 것은 DateFormat을 상속받아 완전하게 구현한 SimpleDateFormat인스턴스이다.

기호 | 의미 | 보기
---|---|---|
y | 년도 | 2006
M | 월(1~12 또는 1월~12월) | 10또는 10월, OCT
w | 년의 몇 번째 주(1~53) | 50
W | 월의 몇번째 주(1~5)| 4
D | 년의 몇 번째 일(1~366) | 100
d | 월의 몇 번째 일(1~31) | 15
F | 월의 몇 번째 요일(1~5) | 1
E | 요일 | 월
a | AM/PM | PM
H | 시간(0~23) | 20
k | 시간(1~24) | 13
K | 시간(0~11) | 10
h | 시간(1~12) | 11
m | 분(0~59) | 35
M | 초(0~59) | 55
S | 천분의 일초(0~999) | 253
z | Time zone(General time zone) | GMT+0:00
Z | Time zone(RFC 822 time zone) | +0900

```java
	Date today = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    
    //오늘 날짜를 yyyy-MM-dd형태로 변환하여 반환한다.
    String result = df.format(today);
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/SimpleDateFormatEx1.java)

* Date인스턴스만 format메서드에 사용될 수 있다
* 따라서 Calendar인스턴스를 Date인스턴스로 변환하는 방법
```java
	Calendar cal = Calendar.getInstance();
    cal.set(2005,9,3);
    Date day = cal.getTime()
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/SimpleDateFormatEx2.java)

* parse(String source) : 날짜 데이터의 출력형식을 변환하는 방법
```java	
	Date d = dr.parse("2015년 11월 23일"); //문자열을 형식에맞게 날짜형태로 변환
    df2.format(d);        // 날짜를 df2의 형식에 맞게 변환
```
> [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/SimpleDateFormatEx3.java)
>  [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/SimpleDateFormatEx4.java)

3 ChoiceFormat
 * 특정 범위에 속하는 값을 문자열로 변환
 * if문이나 switch문을 대신해서 다양한 용도로 유용
 * 관련소스 설명
     -    limits배열은 범위의 경계값 저장 : 반드시 오름차순
     -    grades배열은 범위에 포함된 값을 치환할 문자열
     - 두 배열은 개수가 반드시 일치해야 한다.
 ```java
 	ChoiceFormat form = new ChoiceFormat(limits, grades);
 ```
 > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/ChoiceFormatEx1.java)
 * 패턴사용
   - 구분자로 #과 < 사용
   - #은 경계값을 범위에 포함, <는 포함시키지 않는다
   > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/ChoiceFormatEx2.java)

4 MessageFormat
* 데이터를 정해진 양식에 맞게 출력할 수 있도록 도와주는 클래스
* parse를 이용하면 지정된 양식에서 필요한 데이터만을 출력할 수 도 있다.
* '{숫자}'로 표시된 부분이 데이터가 출력될 자리.

> [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/MessageFormatEx1.java)
> [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/MessageFormatEx2.java)
> [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/MessageFormatEx3.java)
> [[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/MessageFormatEx4.java)
