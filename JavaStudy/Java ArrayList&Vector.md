> 출처 : 자바의 정석


# Java ArrayList
* List를 구현하기 때문에 데이터의 저장순서가 유지되고 중복을 허용
* Vector의 개선 버전으로 Vector와 구현 원리와 기능적인 측면은 동일
* Vector는 기존에 작성된 소스와의 호환성을 위해 남겨두고 있을 뿐 가능하면 ArrayList사용
* 데이터의 저장공간으로 배열을 사용, 배열에 더 이상 저장할 공간이 없으면 보다 큰 새로운 배열을 생성해서 기존의 배열에 저장된 내용을 새로운 배열로 복사한 다으에 저장된다.
* Vector는 자체적으로 동기화처리가 돼 있으나 ArrayList는 그렇지 않다.
* ArrayList의 생성자와 메서드

![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20ArrayList.png)

![그림2](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20ArrayList2.png)

* ArrayList를 삭제할 때는 뒤에서부터
* 앞에서 부터 하면 앞에 index가 삭제 될 때마다 뒤에 있는 index들이 앞으로 땡겨지기 때문
* [[관련소소 : ArrayListEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ArrayListEx1.java)
* [[ArrayListEx2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ArrayListEx2.java)

### ArrayList의 단점 : 배열의 단점
  * 배열은 구조가 간단하고 데이터 접근시간이 가장빠르지만 다음과 같은 단점도 있다
  1. 크기를 변경할 수 없다
     - 크기를 변경해야하는 경우 새로운 배열을 생성하고 데이터를 복사해야 한다(비용이 큰 작업)
     - 크기 변경을 피하기 위해 충분히 큰 배열을 생성하면, 메모리 낭비가 심해진다
  2. 비순차적인 데이터의 추가, 삭제에 시간이 많이 걸린다. (중간에서 추가 삭제)
      - 데이터를 추가하거나 삭제하기 위해, 많은 데이터를 옮겨야 한다.
      - 단, 마지막에 추가, 마지막부터 순차적으로 삭제는 빠르다.


# Java Vector

![그림1](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Vector.png)

![그림2](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Vector2.png)

* [[VectorEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/VectorEx1.java)
* [[MyVector]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/MyVector.java)
