> 출처 : 자바의정석


# Java Collection Framework Intro
* Collection Framework
   -  데이터군을 저장하는 클래스들을 표준화한 설계
   -  다수의 데이터를 쉽게 처리할 수 있는 방법을 제공하는 클래스들로 구성
* Collection
    -  데이터 그룹을 의미
* Framework
   - 표준화와 정형화된 체계적인 프로그래밍 방식
* Collection class
  - 다수의 데이터를 저장할 수 있는 클래스
  - Vector, ArrayList, HashSet 등

1 컬렉션 프레임웍의 핵심 인터페이스

![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework1.png)

![그림2](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework2.png)
* Collection인터페이스의 메서드
![그림3](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework3.png)


2 List인터페이스(중복O 저장순서 O)

![그림4](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework4.png)

![그림5](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework5.png)

3 Set인터페이스(중복X 순서X)

![그림6](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework6.png)

4 Map인터페이스(순서X 중복(키X 값O))

![그림7](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework7.png)

![그림8](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework8.png)

5 Map.Entry인터페이스
* Map인터페이스의 내부 인터페이스
* Map에 저장되는 key-value쌍을 다루기 위함
```java
	public interface Map{
    ...
    interface Entry{
    	Object getKey();
        Object getValue();
        Object setValue(Object value);
        boolean equals(Object o);
        int hashCode();
        ...
        }
   }
```
* Map.Entry인터페이스의 메서드

메서드	 |설명
------------ | -------------
boolean equals(Object o) | 동일한 Entry인지 비교
Object getKey() | Entry의 key객체를 반환
Object getValue() | Entry의 value객체를 반환
int hashCode() | Entry의 해치코드 반환
Object setValue(Object value)| Entry의 value객체를 지정된 객체로 바꾼다.

6 Collection 클래스 요약

![그림9](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework9.png)

![그림10](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework10.png)

> 출처 : https://prashantgaurav1.files.wordpress.com/2013/12/java-util-collection.gif


![그림11](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaCollectionFramework11.png)

