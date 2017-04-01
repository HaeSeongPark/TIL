# Java.time.package
* Date와 Calendar가 가지고 있는 단점들을 해소하기 위해 생긴 패키지
* immutable(불변)

1 java.time패키지의 핵심클래스
 * time패키지에서는 날짜와 시간을 별도의 클래스로 분리해 놓았다.
    - 시간을 표현할 때는 LocalTime클래스
    - 날짜를 표현할 때는 LocalDate클래스
    - 날짜와 시간을 같이 표현할 때는 LocalDateTime클래스를 사용
    - 여기에 시간대(time-zone)까지 다뤄야 한다면, ZonedDateTime클래스를 사용

 * Period와 Duraion
   - 두 날짜간의 차이를 표현하는 것 : Period
   - 두 시간의 차이를 표현하는 것 : Duration
* 객체 생성하기 : now(), of()
   - 현재 날짜와 시간을 저장하는 객체 생성 : now()
   ```java
   	LocalDate date = LocalDate.now();
    LocalTime time = LocalTime.now();
    LocalDateTime dateTime = LocalDateTime.now();
    ZonedDateTime dateTimeInKr = ZonedDateTime.now();
   ```
  - 해당 필드의 값을 순서대로 지정 : of()
   ```java
   	LocalDate date = LocalDate.of(2017,01,28);
    LocalTime time = LocalTime.of(23,25,25); 
    
    LocalDateTime dateTime = LocalDateTime.of(date,time);
    ZonedDateTime zDateTime = ZonedDateTime.of(dateTime,ZoneId.of("Asia/Seoul");
   ```
   
 * Temporal과 TemporalAmount
    ```java
    	Temporal, TemporalAccessor, TemporalAdjuster를 구현한 클래스
        : LocalDate, LocalTime, LocalDateTime, ZonedDateTime, Instant 등
        TemporalAmunt를 구현한 클래스
        : Period, Duration
    ```
 * TemporalUnit과 TemporalField
     - TemporalUnit인터페이스 : 날짜와 시간의 단위를 정의해 놓은 것
     - 위 인터페이스를 구현한 것이 열거형 ChonoUnit이다
     - TemporalField : 년, 월, 일 등 날짜와 시간의 필드를 정의해 놓은 것
     - 위 인터페이스를 구현한 것이 열거형 ChronoField
    ```java
		LocalTime now = LocalTime.now(); // 현재시간
        int minute = now.getMinute(); // 현재시간에서 분만 뽑아낸다.
        int minute = now.get(ChronoField.MINUTE_OF_HOUR); // 위의 문장과 동일
    ```
    - 날짜와 시간에서 특정 필드의 값만을 얻을 때는 get()이나 getㅇ로 시작하는 이름의 메서드 이용
    - 특정 날짜와 시간에서 지정된 단위의 값을 더하거나 뺄 때는 plus() 또는 minus()에 값과 함께 열거형 ChronoUnit을 사용
    ```java
    	LocalDate today = LocalDate.now(); // 오늘
        LocalDate tomorrow = today.plus(1, ChronoUnit.DAYS); // 오늘에 1일을 더한다,
        // LcalDate tomorrw = today.plusDays(1); //위의 ㅜㄴ장과 동일
    ```

2 LocalDate와 LocalTime
* 특정 필드의 값 가져오기 - get() or getLong(), getXXX()
   - 주의! Calendar와 달리 month의 범위가 1-12이고, 요일은 1(월요일)로 시작
* LocalDate
    - Year, MonthValue, Month, isLeapYear 등
* LocalTime
     - Hour, Minute, getSecond, getnano
* 위 메서드들의 매개벼수로 사용할 수 있는 ChronoField에 정의된 상수 목록
    - YEAR, DAY_OF_WEEK(1:월요일), DAY_OF_YEAR 등
* 참고로 특정 필드가 가질 수 있는 값의 범위를 알고 싶으면
```java
	ChronoField.CLOCK_HOUR_OF_DAY.range() : 1-24
    ChronoField.HOUR_OF_DAY.range() : 0 - 24
```
* 필드의 값 변경하기 - with(), plus(), minus()
```java
	date = date.withYear(2000); // 년도를 2000년으로 변경
    time = time.withHour(12); // 시간을 12시로 변경
    
    date.plusDays(1);
    date.plus(1,ChronoUnit.DAYS);
```
* truncatedTo() 지정된 필드보다 작은 단위의 필드 값을 0으로 만드는 메서드
 ```java
 	LocalTime time = LocalTime.of(12,34,56); // 12시 34분 56초
    time = time.truncatedTo(chronoUnit.HOURS); // 시(hour)보다 작은 단위를 0
    time -> 12 :00
    
    LocalDate에는 사용 불가 년, 월, 일은  0이 될 수 없기 때문
 ```

* 날짜와 시간의 비교 : compareTo() vs isAfter(), isBefore
    - int result = date1.compareTo(date2); // 같으면 0, date1이 이전이면 -1 이후면 1
 * equals() vs isEqual()
   - 모든 필드가 일치해야하는 equals()와 달리
   - isEqual()은 오직 날짜만 비교
   ```java
   	LocalDate kDate = LocalDate.of(1999,1,1);
    JapaneseDate jDate = JapaneseDate.of(1999,1,1);
    kDate.equals(jDate) -> false 연대가다름
    kDate.isEquals(jDate) -> true
   ```
   > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/NewTimeEx1.java)

3 Instant
  * 에포크 타임(EPOCH TIME, 1970-01-01 00:00:00 UTC)부터 경과된 시간을 나노초로 표현-> 단일진법으로 계산이 편함
 ```java
 	Instant now Instant.now();
 ```
 * 밀리초 : `long toEpocMilli()`
 * Instant와 date간의 변환
 ```java
 	static Date form(Instant instnat) // Instant -> Date
           Instant toInstant()        // Date -> Instant
 ```
 
 
4 LocaldateTime과 ZonedDateTime
 ```java
 	LocalDateTime dateTime = LocalDateTime.of(2017,1,27,12,34,56);
    LocalDateTime today = LocalDateTime.now()
    
    LocalDateTIme dt = LocalDateTime.of(date,time);
    ...
    
    LocalDate date = dt.toLocalDate(); // LocalDateTime -> LocalDate
    LocalTime time = dt.tolocalTime(); // LocalDateTime -> LocalTime
    
    LocalDateTIme으로 ZonedDateTime 만들기
    ZoneId zid = ZoneId.of("Asia/Seoul");
    ZonedDateTime zdt = dateTime.atZone(zid);
 ```
* ZoneOffset
   - UTC로부터 얼마만큼 떨어져 있는지 표현
   ```java
     ZoneOffset krOffset = ZonedDateTime.now().getOffset();
     int krOffsetInsec = krOffset.get(ChronoField.OFFSET_SECONDS); // 32400초
   ```
   
 * OffsetDateTime
      - ZonedDateTime은 ZonedId로 구역을 표시하는데, ZoneId가 아닌
 	  - ZoneOffset을 사용하는 것이 OffsetDateTime
 	  - 서로 다른 시간대에 존재하는 컴퓨터간의 통신에는 OffsetDateTime이 필요
 	  ```java
      	ZonedDateTime zdt = ZonedDateTime.of(date,time,zid);
        OffsetDateTime dt = OffsetDateTime.of(date,time,krOffset);
      ```
      - ZonedDateTime에 toOffsetDateTime()호출해도 얻을 수 있다.
 * ZonedDateTime의 변환
   ```java
   	LocalDate toLocalDate()
    LocalTime toLocalTime()
    LocalDateTime toLocalDateTime()
    OffsetDateTime toOffsetDateTime()
    long toEpochSecond()
    Instant toInstant()
   ```
   > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/NewTimeEx2.java)

5  TemporalAdjusters
* 자주 쓰일만한 날짜 계산들을 대신 해주는 메서드를 정의해 놓은 클래스
```java
	LocalDate today = LocalDate.now();
    LocalDate nextMonday = today.with(TemporalAdjusters.next(DayOfWeek.MONDAY));
```
* TemporalAdjusters의 메서드

메서드	 | 설명
------------ | -------------
firstDayOfNextYear() | 다음 해의 첫날
lastDayOFYear() | 올 해의 마지막 날
next(DayOfWeek dayOfWeek) | 다음 ?요일(당일 미포함)

* TemporalAdjuster직접 구현하기
```java
	LocalDate with(TemporalAdjuster adjuster)
    -----
    @FunctionalInterface
    public interface TemporalAdjuster{
    	Temporal adjustInto(Temporal temporal);
     }
    -------
    class DayAfterTomorrow implements TemporalAdjuster{
    	@override
        public Temporal adjustInto(Temporal temporal){
        	return temporal.plus(2,ChronoUnit.DAYS); // +2일
            }
       }
```
   > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/NewTimeEx3.java)
   
6 Period와 Duration
* between() & Duration
  - 두 날짜 date1과 date2의 차이를 나타내는 Period는 between()으로 얻을 수 있다.
  ```java
  	LocalDate date1 = LocalDate.of(2014,1,1);
    LocalDate date2 = LocalDate.of(2015,12,31);
    Period pe = Period.betwwen(date1, date2);
    
    //date1이 date2보다 날짜 상으로 이전이면 양수로, 이후면 음수로 Period에 저장
  ```
  - 두 시간의 차이
  ```java
  	LocalTime time1 = LocalTime.of(00,00,00);
    LocalTime time2 = LocalTime.of(12,34,56);
    
    Duration du = Durationbetween(time1, time2);
  ```
  * Period, Duration에서 특정 필드의 값을 얻을 때는 get응 사용
  ```java
  	long year = pe.get(ChronoUnit.YEARS); // int getYear()
    long month = pe.get(ChronoUnit.MONTHS); // int getMonths()
    long year = pe.get(ChronoUnit.DAYS); // int getDays()
    
    long sec = du.get(ChronoUnit.SECONDS); // long getSeconds()
    int nano = du.get(ChronoUnit.NANOS); // int getNAno()
    
    //Duraion에는 getHours(), getMinites()같은 메서드가 없다.
    
    LocalTime tmpTime = LocalTime.of(0,0).plusSeconds(du.getSeconds());
    int hour = tmpTime.getHour();
    int min = tmpTime.getMinute();
    int sec = tmpTime.getSecond();
    int nano = tmpTime.getNano();
  ```
 * between()과 until()
     - until()은 between()과 거의 같은 일은 한다. between()은 static메서드이고, until()은 인스턴스 메서드
     ```java
     	Period pe = Period.betwwen(today, myBirtDay);
        Period pe = today.until(myBBirtDay);
        long dday = today.until(myBirtDay, ChronoUnit.DAYS); // D-day구하기 편리
        // 시간에도 적용가능
        long sec = LocalTime.now().until(endTime,ChronoUnit.SECONDS);
     ```
  * of(), with()
      - Period에는 of(), ofYears, ofMonths(), ofWeeks(), oofDays()가 있고
      - Duraion에는 of(), ofDays(), ofHours(), ofMinutes(), ofSeconds()등이 있다.
      - 특정 필드이 값을 변경하는 with()도 있다.
 
 * 사직연산, 비교연산, 기타 메서드
 ```java
 	pe = pe.minusYear(1).multipliedBy(2); // 1년을 빼고, 2배를 곱한다.
    du = du.plustHours(1).divideBy(60); // 1시간을 더하고 60으로 나눈다.
    //Period는 기간을 표현하기 위한 것이므로 나눗셈을 위한 메서드가 없다.
    
    boolean sameDate = Period.betwwen(date1,date2).isZero(); // 0인지 확인하는 메서드
    boolean isBefor = Duraion.betwwen(time1, time2).isNegative(); // 음수인지 확인하는 메서드
    
    du = du.abs();   // 부호를 업애는 메서드
    if(pe.isNegative())
    	pe = pe.negated();   
        // 부호를 반대로 변경하는 메서드 Period에는 abs()메서드가 없다.
    
    pe = Period.of(1,13,32).normalized(); // 월이 값이 12를 넘지 않게 하는 메서드
    //1년 13개월 32일 -> 2년 1개월 32일;
```

* 다른 단위로 변환 : toTotalMonths(), toDays(), toHours(), toMinutes()
    - Period : long toTotalMonths() : 년월일을 월단위로(일 단위는 무시)
    - Duration : long todays() : 일단위로 / toHours(), toMinutes()
* 기타 메서드
```java
	LocalDate date1 = LocalDate.of(2015,11,28);
    LocalDate date2 = LocalDate.of(2015,11,29);
    
    long period = date2.toEpocDay() - date1.toEpochDay(); //
   // toEpocDay() : 1970.1.1부터 날짜를 세어 반환
   // Period를 사용하지 않고도 두 날짜간의 일수를 계산할 수 있지만 두 날짜 모두 1970.1.1이후여야만 한다
   
   LocalTime의int  toSecondOfDay(), long toNanoofDay()가 있어서
   Duration을 사용하지 않고도 시간차이 얻을 수 있음.
```
 > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/NewTimeEx4.java)

7 파싱과 포맷
*  날짜와 시간을 원하는 형식으로 출력하고 해석(parsing,파싱)
*  DateTimeFormatter 이용
```java
	LocalDate date = LocalDate.of(2016,1,2);
    String yyyymmdd = DateTimeFormatter.ISO_LOCAL_DATE.format(date); // 2016-01-02
    String yyyymmdd = date.format(DateTimeFormatter.ISO_LOCAL_DATE); // 2016-01-02
```
* DateTimeFormatter에 상수로 정의된 형식, 이외에도 더 있음 API참고

DateTimeFormatter | 설명 | 보기
------------ | -------------|-----------
ISO_LOCAL_TIME | Time without offset | 10:15:30
BASC_ISO_DATE | Basic ISO date | 20111203

* 로케일에 종ㅅ속된 형식화
  - DateTimeFormatter의 static 메서드 ofLocalizedDate(), ofLocalizedTime(), ofLocalized은 locale에 종속적인 포맷터를 생성
  ```java
  	DateTimeFormatter formatter = DateTimeFomatter.ofLocalizedDate(FormatStyle.SHORT);
    String shortFormat = formatter.format(LocalDate.now());
  ```
   - FormatStyle의 종류에 따른 출력형태
   
  
 FormaStyle | 날짜 | 시간
------------ | -------------|-----------
FULL | 2015년 11월 28일 토요일 | N/A
LONG | 2015년 11월 28일 (토) | 오후 9시 15분 13초
MEDIUM | 2015.11.28 | 오후 9:15:13
SHORT | 15.11.28 | 오후 9:15

* 출력형식 직접 정의하기
     - DateTimeFormatter의 ofPattern()으로 원하는 출력형식을 직접 작성 가능
     `DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");`
     
     
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

> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/DateFormatterEx1.java)

* 문자열을 날짜와 시간으로 파싱하기
    - parse()메서드 이용
    ```java
    	LocalDate date = Localdate.parse("2016-01-02",DateTimeFormatter.ISO_LOCAL_DATE);
        // DateTimeFormatter에 상수로 정의된 형식을 사용
        
        LocalDate newDate = LocalDate.parse("2001-01-01");
        LocalDate newTime = LocalTime.parse("23:50:50");
        LocalDateTime newDateTime = LocalDateTime.parse("2001-01-01T23:59:59");
        //기본적인 형식의 문자열은 DateTimeFormatter의 상수를 사용하지 않고도 파싱이 가능
        
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy=MM=dd HH:mm:ss");
        LocalDateTIme endOfYear = LocalDateTime.parse("2015-12-31 23:59:59",pattern);
        // ofPattern()을 이용해서 파싱을 할 수도 있다.
    ```
    
    > [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch10/DateFormatterEx2.java)
