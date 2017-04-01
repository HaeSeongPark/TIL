> 출처 : 자바의 정석


# Java.util.StringTokenizerClass
* 긴 문자열ㅇ르 지정된 구분자(delimiter)를 기준으로 토큰(token)이라는 여러 개의 문자열로 잘라내는 데 사용
* 구분자로 단 하나의 문자 밖에 사용하지 못한다. 따라서 복잡한 형태의 구분자는 아래 두 가지를 이용
* 이 외에도 String의 split(String regex)이나 Scanner의 useDelimiter(String patter)를 사용할 수 있다.
* 위 두가지는 정규식을 알아야 한다.
* StringTokenizer의 생성자와 메서드

생성자 / 메서드 | 설명
------------ | -------------
StringTokenizer(String str, String delim) | 문자열(str)을 지정된 구분자(delim)로 나누는 StringTokenizer를 생성한다.(구분자는 토큰으로 간주되지 않음
StringTokenizer(String str, String delim, boolean returnDelims) | 문자열(str)을 지정된 구분자(delim)로 나누는 인스턴스 생성, returnDelims의 값을 true로 하면 구분자도 토큰으로 간주
int countTokens() | 전체 토큰의 수를 반환
boolean hasMoreTokens() | 토큰이 남아있는지 알려준다.
Stirng nextToken() | 다음 토큰을 반환한다.
* [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/StringTokenizerEx1.java)
```java
	StringTokenizer st = new StringTokenizer(str,"+-*/=()",true);
    "+-*/=()" 각각의 문자가 모두 구분자
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/tree/master/JavaStudy2/JavaStudySource2/src/ch9_lang)

* StringTokenizer() vs split()
  - split()은 빈 문자열도 토큰으로 인식
  - StringTokenizer()는 빈 문자열을 토큰으로 인식핮 ㅣ않는다.
  - 성능은 StringTokenizer가 우세
  - split()은 데이터를 토큰으로 잘라낸 결과를 배열에 담아 반환하고
  - StringTokenizer()은 바로바로 잘랄서 반환하기 때문
 
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch9_lang/StringTokenizerEx5.java)
