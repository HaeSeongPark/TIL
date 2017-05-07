> 출처 : 자바의 정석

# Java Arrays
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ArraysEx.java)

* 배열을 다루는데 유용한 메서드가 정의돼 있다.

### 배열의 복사 : copyOf(), copoyOfRange()
* copyOf()는 배열 전체를
* copyOfRange()는 배열의 일부를 복사해서 새로운 배열을 만들어 반환
* copyOfRange()dp 지정된 범위의 끝은 포함되지 않는다.
```java
	int[] arr = {0,1,2,3,4};
    int[] arr2 = Arrays.copyOf(arr,arr.length); // arr2 = [0,1,2,3,4]
    int[] arr3 = Arrays.copyOf(arr,3); // arr3 = [0,1,2]
    int[] arr4 = Arrays.copyOf(arr,7); // arr2 = [0,1,2,3,4,0,0]
    
    int[] arr5 = Arrays.copyOfRange(arr,2,4); // arr2 = [2,3] //4는 미포함
    int[] arr6 = Arrays.copyOfRange(arr,0,7); // arr4 = [0,1,2,3,4,0,0]
```

### 배열 채우기 : fill(), setAll()
* fill()은 배열의 모든 요소를 지정된 값으로 채운다.
* setAll()은 배열을 채우는데 사용할 함수형 인터페이스를 매개변수로 받는다.
* 이 메서드를 호출할 때는 함수형 인터페이스를 구현한 객체를 매개변수로 지정하거나 람다식을 지정해야한다.
```java
	int[] arr = new int[5];
    Arrays.fill(arr, 9); // arr=[9,9,9,9,9]
    Arrays.setAll(arr,() -> (int)(Math.random()*5) + 1); // arr = [5,3,4,2,2]
```

### 배열의 정렬과 검색 : sort(), binarySearch()
* sort()는 배열을 정렬
* binarySearch()는 배열에 저장된 요소를 검색, index 반환, 이진검색은 반드시 배열이 정렬된 상태로 해야함
* 검색 결과 일치하는 요소가 여러 개 있다면, 이 중에서 랜덤으로 반환 ㅜㅜ 알 수 없음
```java
	int[] arr = { 3, 2, 0, 1, 4};
    int idx = Arrays.binarySearch(arr,2); //idx=-5 잘못된 결과
    
    Arrays.sort(arr); // 정렬
    Arrays.toString(arr); // [0,1,2,3,4]
    Arrays.binarySearch(arr,2); // 2
```

### 문자열의 비교와 출력: equals(), toString()
* toString()배열의 모든 요소를 문자열로 출력 (1차원배열만)
* 2차원 이상의 배열은 deepToString()을 사용
```java
	int[] arr = {0,1,2,3,4};
    int[][] arr2D = {{11,22},{21,22}};
    Arrays.toStrring(arr); // [0,1,2,3,4]
    Arrays.deepToString(arr2D); // [[11,22],[21,22]]
```

* equals()는 두 배열에 저장된 모든 요소를 비교해서 같으면 true, 다르면 false를 반환 (1차원 배열만 가능)
* 2차원 이상의 배열은 deepEquals()를 사용
```java
	String[][] str2D = new String[][]{{"aaa","bbb"},{"AAA","BBB"}}; 
 	String[][] str2D2 = new String[][]{{"aaa","bbb"},{"AAA","BBB"}}; 
    
    Arrays.equals(str2D, str2D2) // false  배열에 저장된 배열의 주소를 비교
    Arrays.deepEquals(str2D, str2D2) // true
```


### 배열을 List로 변환 : asList(Object... a)
* asList()는 배열을 List에 담아서 반환
* 매개변수의 타입이 가변인수라서 배열 생성없이 저장할 요소들만 나열하는 것도 가능
```java
	List list = Arrays.asList(new Integer[]{1,2,3,4,5}); // list = [1,2,3,4,5]
    List<Integer> list = Arrays.asList(1,2,3,4,5); // list = [1,2,3,4,5]
    list.add(6); UnsupportedOperationException 예외 발생
    
    // asList()가 반환한 List의 크기를 변경할 수 없다!!! 추가나 삭제 불가능
    // 저장된 내용은 변경 가능
    
    //크기변경 가능케하려면
    List<Integer> list = new ArrayList<>(Arrays.asList(1,2,3,4,5));
```

### parallelXXX(), spliterator(), stream()
* parallel로 시작하는 메서드들은 쓰레드가 작업을 나누어 처리해 속도가 빠르다
* spliterator()는 여러 쓰레드가 처리할 수 있게 하나의 작업을 여러 작업으로 나누는 Spliterator를 반환
* stream()은 컬렉션을 스트림으로 변환
