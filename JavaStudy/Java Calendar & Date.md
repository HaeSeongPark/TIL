# Java Calendar& Date
* 날짜와 시간을 다룰 목적으로 나온 클래스(Date -> Calendar -> time)

1 Calendar
 * Calendar는 추상클래스이기 때문에 직접 객체를 생성할 수 없고, 메서드를 통해서 완전히 구현된 클래스의 인스턴스를 얻어야 한다.
 ```java
 	Calendar cal = Calendar.getInstance();
    //기본적으로 현재 날짜와 시간으로 설정됨.
 ```
2 Calendar와 Date간의 변환
```java
	1. Calendar를 Date로 변환
	Calendar cal = Calendar.getInstance();
    ...
    Date d = new Date(cal.getTimeInMillis()); // Date(long date)
    
    2. Date를 Calendar로 변환
	Date d = new Date();
    ...
    Calendar cal = Calendar.getInstance();
    cal.setTime(d);
```
>  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx1.java)


* int get(int field) : 원하는 필드의 값을 얻어어는 메서드
* get메서드의 매개변수로 사용되는 int값들은 Calendar에 정의된 static상수
* 주의! get(Calendar.MONTH)로 값을 얻어오면 0~11까지다 0은 1월을 의미, 11은 12월을 의미
* set() : Calendar 인스턴스에 원하는 날짜나 시간을 설정
```java
	void set(int field, int value)
    void set(int year, int month, int date)
    void set(int year, int month, int date, int hourOfDay, int minute)
    void set(int year, int month, int date, int hourOfDay, int minute, int second)
```
> [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx2.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx3.java)


* add(int field, int amount)를 사용하면 지정한 필드의 값을 원하는 만큼 증가 또는 감소할 수 있다. -> 일정 기간 전후의 날짜와 시간을 알아낼 수 있다.
* roll(int field, int amount)'도 add()와 비슷하지만, 한 가지 다른점은 다른 필드에 영향을 미치지 않는다 는 것
    -  예를들어 add메서드로 날짜필드(Calendar.MONTH)의 값을 말일 이상으로 증가하면 다음 달로 넘어가므로 월의 값도 1 증가하지만, roll메서드는 같은 겅우에 월 필드의 값은 변하지 않고 일 필드의 값만 바뀐다.
    -  단 일 필드가 말일일 때 월필드가 변경되면 일 필드에 영향을 줄  수 있다. 2.28 <-> 1.31 add()도 마찬가지


> [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx4.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx5.java)


* getActualMaximum(Calendar.DATE) 해당 월의 마지막 날을 알 수 있는 메서드
> [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx6.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx7.java)

* 년과 월 정도의 계산이라면, 굳이 Calendar를 사용하지 않고 substring()이나 Integer.parseInt()로 간단히 처리
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx8.java)

* 복합예제
```java
	boolean isLeapYear(int year)
     : 매개변수 year이 윤년이면 true를 그렇지 않으면 false를 반환
    int datDiff(int y1, int m1, int d1, int y2, int m2, int d2)
       : 두 날짜간의 차이를 일단위로 반환
    int getDayOfWeek(int year, int month, int day)
       : 지정한 날짜의 요일을 반환한다.(1~7, 1이 일요일)
    String convertDatToDate(int day)
    	: 일단위의 값을 년월일의 형태의 문자열로 변환하여 반환
    int convertDateToDay(int year, int month, int day)
    	: 년월일을 입력받아서 일단위로 변환
        
    [참고] Calendar의 경우 1970년 1월 1이 기준, 기준 이전의 날짜에 대해 getTimeInMillis()를 호출하면음수
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/CalendarEx9.java)
