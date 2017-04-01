# Java TreeMap
* 이진검색트리의 형태로 키와 값의 쌍으로 이루어진 데이터를 저장
* Map의 장점인 빠른 검색과 Tree의 장점인 정렬과 범위검색의 장점을 모두 갖고 있다
* 이진검색트리처럼, 데이터를 저장할 때 정렬하기 때문에 저장시간이 길다
* 정렬된 상태로 데이터를 조회하는 경우가 빈번하다면, 데이터를 조회할 때 정렬해야 하는 HashMap보다는
* 이미 정렬된 상태로 저장 돼 있는 TreeMap이 빠른 조회결괄르 얻을 수 있다.
* 주로 HashMap을 사용하고, 정렬이나 범위 검색이 필요한 경우에만 TreeMap을 사용하는 것이 좋다.

> TreeMap의 생성자와 메서드

![TreeMap](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20TreeMap.png)

[[TreeMapEx1.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/TeemapEx1.java)
