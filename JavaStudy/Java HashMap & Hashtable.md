> 출처 : 자바의 정석

# Java HashMap과 Hashtable
* HashMap은 Hashtable의 신버전
* Hashtable과 달리 HashMap은 동기화 처리가 돼 있지 않다.
* 가능하면 Hashtable보다는 HashMap을 사용
* HashMap은 해싱기법을 사용해서 데이터를 저장하기 때문에 많은 양의 데이터를 검색할 때 성능이 뛰어나다
* HashMap은 Map이너페이스를 구현했으며, 데이터를 키와 값의 쌍으로 저장
* 키는 중복 X , 값은 중복 허용
```java
	public class hashMap extends AbstracMap implements Map, Cloneable, Serializable
    {
    	transient Entry[] table;
        ...
        static class Entry implements Map.Entry{
        	final Object key;
            Object value;
            ...
         }
    }
```
> HashMap의 생성자오 메서드
> 
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20HashMap.png)

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx1.java)

[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx2.java)

[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx3.java)

[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx4.java)

## Hashing
* 해시함수를 이용해서 해시테이블에 저장하고 검색하는 기법

![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Hashing.png)

* 해싱에 사용되는 자료구조는 배열과 링크드리스트가 조합된 형태

![그림2](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Hashing2.png)

* 키를 이용해서 해시테이블로부터 데이터를 가져오는 과정
   - 키를 이요해서 해시함수를 호출
   - 해시함수의 호출결과인 해시코드에 대응하는 배열이 저장된 링크드 리스트를 검색
   - 링크드리스트에서 키와 일치하는 데이터를 찾는다.
* 새로운 클래스를 정의할 때 equals()를 오버라이딩한다면 hashCode()도 같이 오버라이딩 해야한다.
* 그래야 equals()의 결과가 true인 두 객체의 해시코드가 항상 같다.
* 그렇지 않으면 equals()의 호출결과가 true지만 해시코드가 다른 두 객체를 서로 다른 것으로 인식하고 따로 저장
* 또한 equals()로 비교한 결과가 false이고 해시코드가 같은 경우는 링크드리스트에 저장된 서로 다른 두 데이터이다.
