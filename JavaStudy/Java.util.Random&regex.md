# java.util 패키지 RandomClass
* 난수를 얻을수 있는 클래스
* Math.random과 같다.
* 사실 Math.random()은 내부적으로 Random클래스를 사용
```java
double randNum = Math..random();
double randNum = new Randdom().nextDouble(); // 위 문장과 동일
```
> 사용

```java
int num = (int)(Math..random()*6)+1;;
int num = new Randdom().nextInt(6)+1;
```
* 차이점
   -  Math.random()은 종자값(seed)를 설정할 수 있다.
   -  종자값이 같은 Random인스턴스들은 항상 같은 난수를 같은 순서대로 반환


1 Random클래스의 생성자와 메서드
```java
	public Random(){
    	this(System.currenTimeMillis());  // Random(long seed)를 호출
    }
    // 종자값을 현재시간을 천분의 1초단위로 하기 때문에 실행할 때마다 얻는 난수가 달라진다.
```

메서드 | 설명
------------ | -------------
 Random()    | System.현재시간을 종자값으로 이용하는 Random인스턴스를 생성
 Random(long seed) | 매개변수 seed를 종자값으로 이용해 Random인스턴스를 생성
boolean nextBoolean() | boolean타입의 난수 반환
void nextBytes(bytep[] bytes) | bytes배열에 byte타입의 난수를 채워서 반환한다.
double nextDouble() | double타입의 난수를 반환한다.(0.0 <= x < 1.0)
double nextGaussian() | 평균은 0.0이고 표준편차는 1.0인 가우시안분포에 따른 double형의 난수를 반환
int nextInt() | int타입의 난수를 반환한다. (int의 범위_
int nextInt(int n) | 0~n의 범위에 있는 int값을 반환한다.(n은 범위에 포함되지 않음)
long nextLong() | long타입의 난수를 반환한다.(long의 범위)
void setSeed(long seed) | 종자값을 주어진 값으로 변경


# java.util.regex 패키지 정규식(Regualar Expression)
* 정규식이란 텍스트 데이터 중에서 원하는 조건(패턴)과 일치하는 문자열을 찾아 내기 위해 사용 하는것
* 전화번호나, 이메일, 비밀번호의 유형성 검사에 유용
```java
//1 정규식을 매개변수로 Pattern클래스의 static메서드인
//Pattern compile(String regex)을 호출하여 Pattern인스턴스를 얻는다.
Pattern p = Pattern.compile("c[a-z]*"):

//2 정규식으로 비교할 대상을 매개변수로 
// Pattern클래스의 Matcher matcher(CharSequence input)를 호출해서 Matcher인스턴스를 얻는다.
// Matcher m = p.matcher(data[i]);

//3 Matcher인스턴스에 boolean matches()를 호출해서 정규식에 부합하는지 확인
if(m.matches())
```
* [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/RegularEx1.java)
*  [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/RegularEx2.java)

정규식패턴 | 설명 | 결과
------------ | ------------- | ------------
c[a-z]*   | c로 시작하는 영단어 | c,ca,co,car,combat.count,
c[a-z] | c로 시작하는 두 자리 영단어 | ca,co,
c[a-zA-z] | c로 시작하는 두자리 영단어(대소분자 구분 안함) | cA,ca,co,
c[a-zA-Z0-9] & c\w | c로 시작하고 숫자와 영어로 조호홥된 두 글자 | cA,ca,co,c0,
.* |모든 무자열 | bat.baby,bonus,c,cA,ca,co,c., .....
c. |c로 시작하는 두 자리 문자열 | cA,ca,co,c.,c0,c#,
c.*| c로 시작하는 모든 문자열(기호포함) | cA,ca,co,c.,c0,c#,car,combat,count,
c\\. | c.와 일치하는 문자열'.'은 패턴작성에 사용되는 문자이므로 '\\'를 사용해야 한다. | c.
c\d & c[0-9] | c와 숫자로 구성된 두 자리 문자열 | c0
c.*t | c로 시작하고 t로 끝나는 모든 문자열 | combat,count
[b\|c].* & [bc].* & [b-c].* | b 또는 c로 시작하는 문자열 | bat,baby,bonus,c,cA,ca,co,c., ......
[^b\|c].* & [^bc].* & [^b-c].* | b 또는 c로 시작하지 않는 문자열 | date, disc
.\*a.\* | a를 포함하는 모든 문자열,  * : 0 또는 그 이상의 문자 | bat,baby,ca, car,combat,date
.*a.+ | a를 포함하는 모든 문자열, + : 1또는 그 이상의 문자. '+'는 '*'과 달리 반드시 하나 이상의 문자가 있어야 하므로 a로 끝나는 단어는 포함되지 않는다. | bat,baby,car,combat,date
[b\|c].{a} | b또는 c로 시작하는 세 자리 문자열. (b또는 c 다음에 두 자리이므로 모두 세자리) | bat,car

* 그룹화
   - 정규식의 일부를 괄호나 나누어 묶어서 그룹화 할 수 있다.
   - group(int i)
  
  
  ```java
    String source = "HP:011-1111-1111,HOME:02-999-9999";
   	String pattern = "(0\\d{1,2})-(\\d{3,4})-(\\d{4})";   // 패턴 3개 그룹화
    
    // 0\\d{1.2} : 0으로 시자하는 최소 2자리 최대 3자리 숫자(0포함)
    // \\d{3,4}  : 최소 3자리 최대 4자리의 숫자
    // \\d{4}   : 4자리의 숫자
    
    Matcher m = p.matcher(source);
   	int i =0;
    while(m.find())   //find(0는 일치하는 패턴이 없으면 false를 반환
    	print(++i + ": " + m.group() + " -> m.group(1) + ", "+m.group(2)+", "+m.group(3));
        
        
        //결과
        1: 011-1111-1111 -> 011, 1111, 1111
        2: 02-999-9999 -> 02, 999, 9999
        
        
        // m.group() or m.group(0) -> 문자열 전체
        // m.group(1) -> 첫 번째 패턴에 매칭되는 문자열
        // m.group(2) -> 두 번째 패턴에 매칭되는 문자열
        // m.group(3) -> 세 번째 패턴에 매칭되는 문자열
        // 패턴 개수보다 '()'안에 숫자가 크면 IndexOutOfBoundsException 발생
   ```
  [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/RegularEx3.java)

* find()
   -  Matcher의 find()로 정규식과 일치하는 부분을 찾으면 그 위치를 start()와 end()로 알아 낼 수 있고
   -  appendRelpacement(StringBuffer sb, String replacement)를 이용해서 원하는 문자열로 치환
   -  치환 결과는 sb에 저장
   -  소스설명
   - 1 문자열 source에서 "broken"을 m.find()로 찾은 후 처음으로 m.appendReplacement(sb, "drunken");가호출되면 source의 시작부터 "broken"을 찾은 위치까지의 내용에 "drunken"을 더해서 저장한다.
   - s에 저장된 내용 : "A drunken"
   - 2 m.find()는 첫 번째로 발견된 위치의 끝에서부터 다시 검색을 시작하여 두 번째 "broken" 을 찾게되고 다시  m.appendReplacement(sb, "drunken");호출
   - s에 저장된 내용 : "A drunken hand works, but not a runken"
   - 3 m.appendTail(sb);이 호출되면 마지막으로 치환된 이후의 부분을 sb에 덧붙인다.
   - s에 저장된 내용 : "A drunken hand works, but not a runken heart."
   - [[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/RegularEx4.java)
