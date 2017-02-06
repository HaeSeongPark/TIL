> 출처 : 자바의 정석

# Java Stack & Queue
* Stack
    - LIFO구조. 마지막에 저장된 것을 제일먼저 꺼내게 된다.
    - 수식계산, 수식괄호검사, undo/redo, 뒤로/앞으로(웹브라우저)
    - ArrayList로 구현
    - 클래스
    
메서드 | 설명
------------ | -------------
boolean empty() | Stack이 비어있는지 알려준다.
Object peek() |Stack의 맨 위에 저장된 객체를 반환
Object pop() | Stack의 맨 위에 저장된 객체를 꺼낸다.
Object push(Object item) | Stack에 객체(item)을 저장
int search(Object o) | Stack에서 주어진 객체(o)를 찾아서 그 위치를 반환. 못찾으면 -1을 반환(시작은 1부터)

* Queue
    - FIFO구조, 제일 먼저 저장한 것을 제일 먼저 꺼낸다.
    - 최근 사용문서, 인쇄작업대기목록, 버퍼(buffer)
    - LinkedList로 구현
    - 인터페이스
    
메서드 | 설명
------------ | -------------
boolean add(Object o) | 지정된 객체를 Queue에 추가
Object remove() |Queue에서 객체를 꺼내 반환
Object element() | 삭제없이 요소를 읽어온다. Queue가 비어 있으면 NoSuchElementException 발생
Object peek() | 삭제없이 요소를 읽어 온다. Queue가 비어있으면  NULL
boolean offer(Object o) | Queue에서 객체를 저장
Object poll | Queue에서 객체를 꺼내서 반환. 비어있으면 null을 반환
boolean isEmpty() | Queue가 비어있는지 알려준다.

![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Stack%20Queue.png)

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/StackQueueEx.java)

[[간단한Stack구현]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/MyStack.java)

[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/StackQueueEx1.java)

[[괄호체크]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ExpValidCheck.java)

[[큐를 이용한 유닉스 history명령어 흉내]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/QueueEx1.java)

[[PrioriyQueue]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/PriorityQueueEx1.java)

## Deque(Double - Ended Queue)
* 큐의 변형으로, 한 쪽  끝으로만 추가/삭제할 수 있는 큐와 달리
* 양쪽 끝에 추가 삭제가 가능
* 조상은 큐이며. 구현체로는 ArrayDeque와 LinkedList가 있다.
* 스택과 큐를 하나로 합쳐놓은 것과 같다.

Deque | Queue | Stack
------------ | -------------|---
offerLast() | offer() | push()
pollLast() | - | pop()
pollFirst() | poll() | -
peekFirst() | peek() | -
peekLast|-|peek()

![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/deque.png)
> 출처 : [http://vincenttse.com/deque/](http://vincenttse.com/deque/)
