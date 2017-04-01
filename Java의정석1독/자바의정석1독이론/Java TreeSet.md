> 출처 : 자바의 정석

# Java TreeSet
* Set 인터페이스를 구현한 컬렉션 클래스
* 중복허용 X , 순서유지 X, 정렬저장 O 
* binary search tree로 돼 있어서 검색에 유리하다
* 모든 트리는 하나의 루트를 가지며, 서로 연결되 ㄴ두 요소를 '부모-자식'관계라고 한다.
* 부모는최대 두 개의 자식을 갖는다.
* 왼쪽 자식의 값은 부모보다 작은 값을, 오른쪽 자식의 값은 부모보다 큰 값을 저장
* 검색과 정렬에 유리
* HashSet보다 데이터 추가, 삭제시간이 더 걸린다.
* 왼쪽 - 부모 -오른쪽노드 순으로 읽어오면 오름차순으로 정렬된 순서를 얻을 수 있다.
* 정렬된 상태를 유지하기 때문에, 단일 값 검색과, 범위검색(3~7)에 효과적이다.
```java
	class TreeNode{
    	TreNode left;    // 왼쪽자식노드
        Object element;  // 저장할 객체
        TreeNode right;  // 오른쪽 자식노드  
    }
```
![[Java Tree Set]](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20TreeSet.png)


### TreeSet의 데이터 저장과정
ex) 7,4,9,1,5 순서로 데이털르 저장한다면

![[TreeSet2]](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20TreeSet2.png)


### 이진검색트리란(binary search tree)
* 모든 노드는 최대 두 개의 자식노드를 가질 수 있다.
* 왼쪽 자식노드의 값은 부모노드의 값보다 작고 오른쪽자식노드의 값은 부모노드의 값보다 커야한다.
* 노드의 추가 삭제에 시간이 걸린다.(순차적으로 저정하지 않으므로)
* 범위검색과 정렬에 유리
* 중복된 값을 저장하지 못한다.

### TreeSet의 생성자와 메소드
![[TreeSet3]](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20TreeSet3.png)


[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/TreeSetLotto.java)

[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/TreeSetEx1.java)

[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/TreeSetEx2.java)

[[AsciiPrint]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/AsciiPrint.java)

