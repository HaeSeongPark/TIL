> 출처 : 자바의 정석


# Java LinkedList

* 배열의 단점을 보안해서 나온 자료구조
* 배열과 달리 링크드 리스트는 불ㄹ연속적으로 존재하는 데이터를 연결
* 데이터의 삭제 : 단 한번의 참조변경만으로 가능
* 
![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList.png)

* 데이터의 추가 : 하나의 Node객체생성과 한 번의 참조변경만으로 가능

![그림2](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList2.png)

* 단순 링크드 리스트는 이동방향이 단 반향이라서 이전요소에 대한 접근이 어렵다 그래서
* 이전요소도 접근 가능한 더블 링크드 리스트라는게 생겼다
* 그리고 더블링크드리스트에서 첫 번째요소와 마지막요소를 연결시킨 더블 싱큘러 링크드 리스트가 나왔다
* 실제로 LinkedList는 더뷸 써큘러 링크드 리스트로 구현돼 있다.

* LinkedList : 데이터 접근성이 나쁨
```java
	class Node{
    		Node next;
            Object obj;
         }
```
![그림3](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList3.png)

* doubleLinkedList : 접근성 향상, 이중 원형 연결리스트
```java
	class Node{
    		Node next;
            Node previous;
            Object obj;
         }
```
![그림4](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList4.png)

* doubly circlular linked list : 이중 원형 연결리스트

![그림5](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList5.png)

* LinkedList의 생성자와 메서드

![그림6](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList6.png)

![그림7](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20LinkedList7.png)

## ArrayList vs LinkedList
* [[Test]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ArrayListLinkedListTest.java)
* [[Test2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ArrayListLinkedListTest.java)

컬렉션	| 읽기(접근시간) | 추가/삭제 | 비고
------------ | -------------|---|---
ArrayList	| 빠르다 | 느리다 | 마지막부터 추가/삭제는 더 빠름. 메모리사용이 비효율적
LinkedList | 느리다 | 빠르다 | 데이터가 많을수록 접근성이 떨어짐

* 데이터의 개수가 변하지 않으면 ArrayList
* 데이터 개수의 변경이 많다면 LinkedList

### 두 클래스를 조합해서 사용
* 컬렉션 프레임웍에 속한 대부분의 컬렉션 클래스들은 서로 변환이 가능한 `생성자`를 제공한다
* 이를 이용하면 간단히 다른 컬렉션 클래스로 데이터를 옮길 수 있다.
* 따라서 두 클래스의 장점을 조합해서 사용
* 처음에 작업하기 전에 데이터를 저장할 때는 ArrayList를
* 작업할 때는 LinkedList로 옮겨서 작업하면 좋은 효율을 얻을 수 있다
```java
	ArrayList al = new ArrayList(1000000);
    for(int i=0; i<100000;i++) al.add(i+"");
    
    LinkedList ll = new LinkedList(al);
    for(int i=0; i<1000; i++) ll.add(500,"X");
```
