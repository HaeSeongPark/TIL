# Java Stream
## 1. 스트림이란?
* 다양한 데이터 소스를 표준화된 방법으로 다루기 위한 것
```java
	//Stream<T> Collection.stream()
	List<Integer> list = Arrays.asList(1,2,3,4,5);
    Stream<Integer> intStream = list.strem; // 컬렉션
    Stream<String> strStream = Stream.of(new String[]{"a","b","c"}); // 배열
    Stream<Integer> evenStream = Stream.iterate(0, n->n+2); // 0,2,4,6,...
    Stream<Double> randomStream = Stream.generate(Math::random); // 람다식
    IntStream      intStream = new Random().ints(5); // 난수 스트림(크기가 5)
```
* 스트림이 제공하는 기능 : 중간역산과 최종연산
   - 중간연산 : 연산결과가 스트림인 연산. 반복적으로 적용가능
   - 최종연산 : 연산결과가 스트림이 아닌 연산. 스트림의 요소를 소모하므로 한번만 적용가능
```java
	stream.distinct().limit(5).sorted().forEach(System.out::println)
    //distinct(), limit(5) , sorted() : 중간연산
    // forEach(System.out::println) : 최종연산
    
    String[] strArr = { "dd", "aaa", "CC", "cc", "b"};
    Stream<String> stream = Stream.of(strArr);  // 문자열 배열이 소스인 스트림
    Stream<String> filteredStream = stream.filter(); // 걸러내기(중간연산)
    Stream<String> distinctedStream = stream.distinct(); // 중복제거(중간연산)
    Stream<String> sortedStream     = stream.sort();    // 정렬(중간연산)
    Stream<String> limitedStream    = stream.limit(5);   // 스트림 자르기(중간연산)
    int total = stream.count();  // 요소 개수 세기(최종연산)
```

## 2. 스트림의 특징
* 스트림은 데이터 소스로부터 데이터를 읽기만할 뿐 변경하지 않는다.
```java
	List<Integer> list = Arrays.as(3,1,5,4,2);
    List<Integer> sortedList = list.stream().sorted() // list를 정렬해서
                                   .collect(Collectiors.toList()); // 새로운 List에 저장
   System.out.println(list);  // [3,1,5,4,2]
   System.out.println(sortedList); // [1,2,3,4,5]
```
* 스트림은 Iterator처럼 일회용이다.(필요하면 다시 스트림을 생성해야 한다.)
```java
	strStream.forEach(System.out::println); // 모든 요소를 화면에 출력(최종연산)
    int numOfstr = strStream.count();    // 에러. 스트림이 이미 닫혔음.
```
* 최종 연산 전까지 중간연산이 수행되지 않는다. 지연된 연산
```java
IntStream intStream = new Random().ints(1,46); // 1~45범위의 무한 스트림
intStream.distinct().limit(6).sorted()  // 중간연산
         .forEach(i -> System.out.print(i+",")); // 최종연산
```
* 스트림은 작업을 내부 반복으로 처리
```java
	for(String str : strList)
    	System.out.println(str);     --->   stream.forEach(System.out::println);
        
        void forEcah(Consumer<? super T> action) {
        	Objects.requireNonNull(action)   // 매개변수의 널체크
            
            for(T t : src)  // 내부 반복(for문을 메서드 안으로 넣음)
            	action.accept(T);
          }
```
* 스트림의 작업을 병렬로 처리 : 병렬 스트림
```java
	Stream<String> strStream = Stream.of("dd","aaa","CC","cc","b");
    int sum = strStream.paraleelStream() // 병렬 스트림으로 전환(속성만 변경)
    				    .mapToInt( s-> s.length()).sum(); // 모든 문자열의 길이의 함
```
* 기본형 스트림 : IntStream, LongStream, DoubleStream
   - 오토박싱&언박싱의 비효율이 제거됨(Stream`<Integer`>대신 IntStream사용)
   - 숫자와 관련된 유용한 메서드를 Stream<T>보다 더 많이 
   
## 3. 스트림의 생성
* 컬렉션으로부터 스트림 생성하기
```java
	List<Integer> list = Arrays.asList(1,2,3,4,5);
    Stream<Integer> intStream = list.stream; //Stream<T> Collection.stream()
```
* 배열로부터 스트림 생성하기
```java
	Stream<String> strStream = Stream.of("a","b","c"); //가변인자
    Stream<String> strStream = Stream.of(new String[]{"a","b","c"});
    Stream<String> strStream = Arrays.stream(new String[]{"a","b","c"});
    Stream<String> strStream = Arrays.stream(new String[]{"a","b","c"},0,3);
```
* 특정 범위의 정수를 요소로 갖는 스트림 생성하기
```java
	IntStream intStream = IntStream.range(1,5); // 1,2,3,4
    IntStream intStream = IntStream.rangeClosed(1,5); //1,2,3,4,5
```
