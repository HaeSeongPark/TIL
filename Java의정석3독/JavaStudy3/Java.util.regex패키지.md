> 출처 : 자바의 정석

# Java.util.regex패키지.md
* 정규식이란 텍스트 데이터 중에서 원하는 조건(패턴)과 일치하는 문자열을 찾아 내기 위해 사용하는 것
* 전화번호나, 이메일, 비밀번호의 유형성 검사에 유용
```java
	// 1. 정규식을 매개변수로 하는 Pattern클래스의 static 메서드인
    // Patttern compile(String regex)을 호출하여 Pattern인스턴스를 얻는다.
    Pattern p = Pattern.compile("c[a-z]*");
    
    // 2. 정규식으로 비교할 대상을 매개변수로
    // Pattern클래스의 Matcher matcher(Charsequence input)을 호출해서 Matcher인스턴스를 얻는다.
    Matcher m = p.matcher(data[i]);
    
    // 3. Matcher인스턴스에 boolean matches()를 호출해서 정규식에 부합하는지 확인.
    if(m.matches())
```

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
   - 정규식의 일부를 괄호로 나누어 묶어서 그룹화 할 수 있다.
   - group(int i)
 ```java
 	String source = "HP:011-1111-1111, HOME:02-999-9999";
    String pattern = "(0\\d{1,2})-(\\d{3,4})-(\\d{4})";
    
    // 0\\d{1,2} : 0으로 시작하는 최소 2자리 최대 3자리 숫자(0포함)
    // \\d{3,4} : 최소 3자리 최대 4자리의 숫자
    // \\d{4} : 4잘의 숫자
    Pattern p = Pattern.compile(pattern);
    Matcher m = p.matcher(source);
    int i=0;
    while(m.find()) // find()는 일치하는 패턴이 없으면 false를 반환
    	print(++i + " : " + m.group() + " -> " +  m.group(1) + ", " + m.group(2) + "," + m.group(3));
        
        // 결과
        // 1:011-1111-1111 -> 011, 1111, 1111
        // 2: 02-999-9999 -> 02, 999, 9999
        
        // m.group() or m.group(0) -> 문자열 전체
        // m.group(1) -> 첫 번째 패턴에 매칭되는 문자열
        // m.group(2) -> 두 번째 패턴에 매칭되는 문자열
        // m.group(3) -> 세 번째 패턴에 매칭되는 문자열
        // 패턴 개수보다 '()'안에 숫자가 크면 indexOutOfBoundsException 발생
 ```
* find()
   - Matcher의 find()로 정규식과 일치하는 부분을 찾으면 그 위치를 static()와 end()로 알아낼 수 있고
   - apendReplacement(StringBuffer sb, String replacement)를 이요해서 문자열로 치환
   - 치환 결과는 sb에 저장
  ```java
  	1. 문자열 source에서 "broken"을 m.find()로 찾은 후 처음으로 
  	2. m.appendReplacement(sb, "drunken");가 호출되면 
  	3. source의 시작부터 "broken"을 찾은 위치까지의 내용에 "druken"을 더해서 저장한다.
	4. sb에 저장된 내용 : "A drunken"
 
	5. m.find()는 첫 번째로 발견된 위치의 끝에서부터 다시 검색을 시작하여 
	6. 두 번째 "broken"을 찾게되고 다시 m.appendReplacement(sb, "drunken"); 호출
	7. s에 저장된 내용 : "A drunken hand works, but not a drunken"
	
	8. m.appendTail(sb); 이 호출되면 마지막으로 치환된 이후의 부븐을 sb에 덧붙인다.
	9. s에 저장된 내용 : "A drunken hand works, but not a drunken heart."
