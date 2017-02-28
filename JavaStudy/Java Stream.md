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

* 난수를 요소로 갖는 스트림 
```java
	InttStreamintStream = new Random().ints();  // 무한 스트림
    intStream.limit(5).forEach(System.out::prrintln); // 5개의 요소만 출력한다.
    IntStream int Stream = new Random().ints(5); // 크기가 5인 난수 스티림을 반환
    -----
    Integer.MIN_VALUE <= ints() <= Integer.MAX_VALUE
    Long.MIN_VALUE <= longs() <= Long.MAX_VALUE
        0.0 <=  doubles() < 1.0
```
* 지정된 범위의 난수를 요소로 갖는 스트림을 생성하는 메서드
```java
	IntStream ints(int begin, int end)         //무한스트림
    LongStream longs(long begin, long end)
    DoubleStream doubles(double begin, double end)
    
    IntStream ints(long streamSize, int begin, int end)  //유한스트림
    LongStream longs(long streamSize, long begin, long end)
    DoubleStream doubles(long streamSize, double begin, double end)
```
* 람다식을 소스로 하는 스트림 생성하기
```java
	static <T> Stream<T> iterate(T seed, UnaryOperator<T> f) // 이전 요소에 종속적
    static <T> Stream<T> generate(Supplier<T> s)             // 이전 요소에 독립적
    
    Stream<Integer> evenStream = Stream.iterate(0, n->n+2); // 0,2,4,6,...
    Stream<Double> randomStream = Stream.generate(Math::random);
    Stream(Integer> oneStream = Stream.generate(()->1);
```
* 파일을 소스로 하는 스트림 생성하기
```java
	Stream<Path> Files.list(Path dir)  // Path는 파일 또는 
    
    Stream<String> Files.lines(Path path)
    Stream<String> Files.lines(Path path, Charest cs)
    Stream<String> lines() // BufferedReader 클래스의 메서드
```
## 4. 스트림의 중간연산
* 스트림 자르기 : skip(), limit()
```java
	IntStream skip(long n)
    IntSream limit(long maxSize)

	Stream<T> skip(long n)   // 앞에서부터 n개 건너뛰기
    Stream<T> limit(long maxSize) // maxSize 이후의 요소는 잘라냄
    
    IntStream intStream = IntStream.rangeClosed(1,10);  // 12345678910
    intStream.skip(3).limit(5).forEach(System.out::print); // 45678
```
* 스트림의 요소 걸러내기 : filter(), distinct()
```java
	Stream<T> filter(Predicate<? super T> predicate) // 조건에 맞지 않는 요소 제거
    Stream<T> distinct(0                             // 중복제거
    
    IntStream intStream = IntStream.of(1,2,2,3,,3,3,4,5,5,6);
    intStream.distinct().forEach(System.out::print); //123456
    
    IntStream intStream = IntStream.rangeClosed(1,10);  // 12345678910
    intStream.filter(i->i%2==0).forEach(System.out::print); // 246810
    
    intStream.filter(i->i%2!=0 && i%3!=0).forEach(System.out::print);
    intStream.filter(i->i%2!=0).filter(i->i%3!=0).forEach(System.out::print);
```
* 스트림 정렬하기 : sorted()
```java
	Comparator<String> CASE_INSENSITIVE_ORDER = new CaseInsensitiveComparator();
    
    Stream<T> sorted()  // 스트림 요소의 기본 정렬(Comparable)로 정렬
    Stream<T> sorted(Comparator<? super T> comparator) // 지정된 Comparator로 정렬
```
![java Stream 문자열 스트림을 정렬하는 다양한 방법.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Stream%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%84%20%EC%A0%95%EB%A0%AC%ED%95%98%EB%8A%94%20%EB%8B%A4%EC%96%91%ED%95%9C%20%EB%B0%A9%EB%B2%95.PNG)
```java
	studentStream.sorted(Comparator.comparing(Student::getBan) // 반별로 정렬
    			  .thenComparing(Student::getTotalScore) // 총점별로 정렬
                  .forEach(System.out.println);
```
* 스트림의 요소 변환하기 : map()
 ```java
 	Stream<R> map(Function<? super T, ? extends R> mapper) // Stream<T> -> Stream<R>
    
    Stream<File> fileStream = Stream.of(new File("Ex1.java"), new File("Ex1"),
    								   new File("Ex1.bak"), new File("Ex2.java"), new File("Ex1.txt));
    Stream<String> filenameStream = fileStream.map(File::getName);
    filenameStream.forEach(System.out::prinln); // 스트림의 모든 파일의 이름을 출력
    ------------
    				map(File::getName)
    Stream<File>    ----------------->  Stream<String>
```
* ex) 파일 스트림(Stream`<File>`)에서 파일 확장자(대문자)를 중복없이 뽑아내기
```java
	fileStream.map(File::getName)        // Stream<File>   -> Stream<String>
       .filter(s->s.substring(s.indexOf('.')!=-1)  // 확장자가 없는 것은 제외
       .map(s->s.substring(s.indexOf('.')+1)) // String<String> -> Stream<String>
       .map(String::toUpperCase)              // String<String> -> Stream<String>
       .distinct() // 중복제거
       .forEach(System.out::print);  // JAVABAKTXT
```
* 스트림을 기본 스트림으로 변환 - mapToInt(), mapToLong(), mapToDouble()
```java
	IntStream mapToInt(ToIntFunction<? super T> mapper)    // Stream<T> -> IntStream
    LongStream mapToLong(ToLongFunction<? super T> mapper) // Stream<T> -> LongStream
    DoubleStream mapToDouble(ToDoubleFunction<? super T> mapper) // Stream<T> -> DoubleStream
    
    Stream<Integer> studnetScoreStream = stuStream.map(Student::getTotalScore);
    int sum = studentScoreStream.reduce(0, (a,b) -> a+b);
    ------------->
    IntStream studentScoreStream = studentStream.mapToInt(Student::getTotalScore);
    int allTotalScore = studentScoreStream.sum(); // IntStream의 sum() // IntStream의 sum()
    
   // int sum()
   // OptionalInt max()
   // OptionalInt min()
   // OptionalDouble average()
```
* 기본 스트림을 스트림으로 변환 : mapToObj(), boxed()

```java
	Stream<T> mapTooObj(IntFunction<? extends T> mapper) // IntStream  -> Stream<T>
    Stream<Integer> boxed()                              // IntStream  -> Stream<Integer>
    --------------------------
    IntStream intStream = new Random().ints(1,46); // 1~45사이의 정수(45은 포함안됨)
    Stream<Integer> integerStream = intStream.boxed();  // IntStream -> Stream<Integer>
    Stream<String> lottoStream = intStream.distinct().limit(6).sorted()
                                 .mapToObj(i -> i+","); // IntStream -> Stream<String>
   lottoStream.forEach(System.out::print); // 12,14,20,23,26,29
```
* 스트림의 스트림을 스트림으로 변환 : flatMap()
```java
	Stream<String[]> strArrStrm = Stream.of(new String[]{"abc", "def", "ghi" },
    										new String[]{"ABV", "GHI", "JKLMN"});
    Stream<Stream<String>> strStrStrm = strArrStrm.map(arrays::stream);
```
![java Stream of Stream 1.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Stream%20of%20Stream%201.PNG)
```java
	Stream<String> strStrStrm = strArrStrm.flatMap(Arrays::stream); // Arrays.stream(T[])
```
![java Stream of Stream 2.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Stream%20of%20Stream%202.PNG)
* 스트림의 요소를 소비하지 않고 엿보기 - peek() : 값 확인할 때 유용
```java
	Stream<T> peek(Consumer<? super T> action) // 중간 연산(스트림을 소비 X)
    void forEach(Consumer<? super T> action) // 최종 연산(스트림을 소비 O)
    
    fileStream.map(File::getName) // Stream<File> -> Stream<String>
          .filter(s -> s.indexOf('.')!= -1) // 확장자가 없는 것은 제외
          .peek(s->System.out.printf("filename=%s%n",s)) //확장자를 출력
          .peek(s->System.out.printf("extension=%s%n",s)) // 확장자를 출력
          .forEach(System.out::println); // 최종연산 스트림을 소비
```

## 5. Optional`<T>`와 OptionalInt
* 'T'타입의 객체의 래퍼클래스 : Optional<T>
```java
	public final class Optional<T>{
    	private final T value
        ...
    }
    
	String str = "abc";
    Optional<String> optVal = Optional.of(str);
    Optional<String> optVal = Optional.of("abc");
    Optional<String> optVal = Optional.of(null);         // NullPointerException발생
    Optional<String> optVal = Optional.ofNullable(null); // Ok
```
* Optional객체의 값 가져오기 : get(), orElse(), orElseGet(), orElseThrow()
```java
	Optional<String> optVal = Optional.of("abc");
    String str1 = optVal.get();        // optVal에 저장된 값을 반환. null이면 예외발생
    String str2 = optVal.orElse("");   // optVal에 저장된 값이 null 때는, ""를 반환
    String str3 = optVal.orElseGet(String::new); // 널이면 예외발생
    String str4 = optVal.orElseThrow(NullPointerException::new); // 널이면 예외발생
    ------
    T orElseGet(Supplier<? extends T> other)
    T orElseThrow(Supplier<? extends X> exceptionSupplier))
```
* isPresent() : Optional객체의 값이 null이면 false, 아니면 true를 반환
```java
	if(Optional.ofNulllable(str).isPresent()) { // if(str!=null){
    	System.out.println(str);
     }
     -----------
     // ifPresent(Consumer) : 널이 아닐때만 작업 수행, 널이면 아무 일도 안 함
     Optional.ofNullable(str).ifPresent(System.out::println);
```
* 기본형 값을 감싸는 래퍼 클래스 : OptionalInt,OptionalLong, OptionalDuble
```java
	public final class OptionalInt{
    	...
        private final boollean isPresent; // 값이 저장돼 있으면  true
        private final int value; // int 타입의 변수
```
* OptionalInt의 값 가져오기 : int getAsInt()

Optional클래스| 값을 반환하는 메서드
------------ | -------------
Optional<T>| T get()
OptionalInt | int getAsInt()
OptionalLong | long getAsLong()
OptionalDouble | double getAsDDouble()

* 빈 Optional객체의 비교
```java
	OptionalInt opt1 = OptionalInt.of(0);   // OptionalInt에 -을 저장
    OptionalInt opt2 = OptionalInt.empry();   //빈 OptionalInt객체. OptionalInt에 0이 저장됨
    Optional<String> opt3 = Optional.ofNullable(null); // null이 저장된 Optional객체
    Optional<String> opt4 = Optional.empry();   // 빈 Optional객체, null이 저장됨
    System.out.println(opt1.equals(opt2)); // false
    System.out.println(opt3.equals(opt4)); // true
```
## 6 스트림의 최종연산
* 스트림의 모든 요소에 지정된 작업을 수행 : forEach(), forEachOrdered()
```java
	void forEach(Consumer<? super T> action)    // 병렬스트림인 경우 순서가 보장되지 않음
    void forEachOrdered(Consumer<? super T> action) // 병렬스트림인 경우에도 순서가 보장됨
    
    IntStream.range(1,10).sequential().forEach(System.out::print); // 123456789
    IntStream.range(1,10).sequential().forEachOrdered(Sytem.out::print); // 123456789
    
    IntStream.range(1,10).parallel().forEach(System.out::print); //683295417
    IntStream.range(1,10).parallel().forEachOrdered(System.out::print); //123456789
```
* 스트림을 배열로 변환 : toArray()
```java
	Object[] toArray()                      // 스트림의 모든 요소를 Object배열에 담아 반환
    A[] toArray(IntFunction<A[]> generator) // 스트림이 모든 요소들 A타입의 배열에 담아 반환
    
    Student[] stuNames = studentStream.toArray(Student[]::new); // OK. x -> new Studnet[x]
    Student[] stuNames = studentStream.toArray(); // 에러.
    Object[] stuNames = studentStream.toArray(); // OK.
```
* 조건 검사 : allMatch(), anyMatch(), noneMatch()
```java
	boolean allMatch (Predicate<? super T> predicate) // 모든 요소가 조건을 만족시키면 true
    boolean anyMatch (Predicate<? super T> predicate) // 한 요소라도 조건을 만족시키면 true
    boolean noneMatch (Predicate<? super T> predicate) // 모든 요소가 조건을 만족시키지 못하면 true
    ------------
    boolean hasFailedStu = stuStream.anyMatch( s-> s.getTotalScore() <= 100); // 낙제자가 있는지?
```
* 조건에 일치하는 요소 찾기 : findFirst(), findAny()
```java
	Optional<T> findFirst() // 첫 번째 요소를 반환. 순차 스트림에 사용
    Optional<T> findAny()  // 아무거나 하나를 반환. 병렬 스트림에 사용
    
    Optional<Student> result = stuStream.filter(s-> s.getTotalScore() <=100).findFirst();
    Optional<Student> result = parallelStream.filter(s-> s.getTotalScore() <=100).findAny();
```
* 스트림에 대한 통계정보 제공 : count(), sum(), average(), max(), min()
```java
	// Stream<T>
	long count()
    Optional<T> max(Comparator<? super T> comparator)
    Optional<T> min(Comparator<? super T> comparator)
    
    // IntStream
    long            count()
    Int             sum()
    OptionalDouble  average()
    OptionalInt     max()
    OptionalInt     min()
    IntSummaryStatistics summaryStatic\stics()
    
    //IntSummaryStatistics
    double getAverage()
    long getCount()
    int getMax()
    int getMin()
    long getSum()
```  
* 스트림의 요소를 하나씩 줄여가며 누적연산 수행 : reduce()
```java
	Optional<T> reduce(BinaryOperator<T> accumulator)
    T           reduce(T identity, BinaryOperator<T> accumulator)
    U           reduce(U identity, BiFunction<U,T,U> accumulator, BinaryOperator<U> combiner)
    // identity : 초기값
    // accumulator : 이전 연산결과와 스트림의 요소에 수행할 연산
    // combiner : 병렬처리된 결과를 합치는데 사용할 연산(병렬 스트림)
    
    //int reduce(int identity, IntbinaryOperator op)
    int count = intStream.reduce(0, (a,b) -> a + 1);  // count()
    int sum = intStream.reduce(0, (a,b) ->  a+b);     // sum()
    int max = intStream.reduce(Integer.MIN_VALUE,(a,b) -> a>b ? a:b); // max()
    int min = intStream.reduce(Integer.MAX_VALUE,(a,b) -> a<b ? a:b); //min()
    
    // OptionalInt reduce(IntbinaryOperator accumulator)
    OptionalInt max = intStream.reduce((a,b) -> a > b ? a : b); // max()
    OptionalInt min = intStream.reduce((a,b) -> a < b ? a : b); // min()
    
    OptionalInt max = intStream.reduce(Integer::maxb); // static int max(int a, int b)
    OptionalInt min = intStream.reduce(Integer::min); // static int min(int a, int b)
```

## 7 collect(), Collector, Collectiors
* collect()는 Collector를 매개변수로 하는 스트림의 최종연산
```java
	Object collect(Collector collector) // Collector를 구현한 클래스의 객체를 매개변수로
    Object collect(Supplier supplier, BiConsumer accumulator, BiConsumer combiner) // 잘 안쓰임
```
* Collector는 collect()에 필요한 메서드를 정의해 놓은 인터페이스
```java
	public interface Collector<T,A,R> { // T(요소)를 A에 누적한 다음, 결과를 R로 변환해서 반환
    	Supplier<A>     supplier();           // StringBuilder::new   누적할 곳
        BiConsumer<A,T>  accumulator();   // (sb, s) -> sb.append(s)  누적방법
        BinaryOperator<A>  combiner();     // (sb1, sb2) -> sb1.append(sb2) 결합방법(병렬)
        Function<A,R>      finisher();     // sb -> sb.toString()   최종변환
        Set<Characteristics characteristics(); // 컬렉터의 특성이 담긴 Set을 반환
        ...
        }
```
* Collectors클래스는 다양한 기능의 컬렉터(Collector를 구현한 클래스)를 제공
```java
	변환 : mapping(), toList(), toSet(), toMap(), toCollection(), ...
    통계 : counting(), summingInt(), averageingInt(), maxBy(), minBy(), summarizingInt(),..
    문자열 결합 : joining()
    리듀싱  : reducing()
    그룹화와 분할 : groupingBy(), partitioningBy(), collectiongAndThen()
```
## 8 Collectors의 메서드
* 스트림을 컬렉션으로 변환 : toList(), toSet(), toMap(), toCllection()
```java
	List<String> names = stuStream.map(Student::getName) // Stream<Student> -> Stream<String>
    							  .collect(Collectors.toList()); // String<String> -> List <String>
   ArrayList<String> list = names.stream()
   				.collect(Collectors.toCollection(ArrayList::new)); // Stream<String> -> ArrayList<String>
                
   Map<string, Person> map = personStream
   			.collect(Collectors.toMap(p->p,getRegId(), p->p)); // Stream<Person> -> Map<String, Person>
```
* 스트림의 통계정보를 제공 : counting(), summingInt(), maxBy(), minBy(), ...
```java
	long count = stuStream.count();
    long count = stuStream.collect(counting()); // Collectors.counting()
    
    long totalScore = stuStream.mapToInt(Student::getTotalScore).sum(); // IntStream의 sum()
    long totalScore = stuStream.collect(summingInt(Student::getTotalScore));
    
    OptionalInt topScore = studentStream.mapToInt(Studnet::getTotalScore).max();
    Optional<Student> topStudent = stuStream.max(Comparator.comparingInt(Student::getTotalScore));
    Optional<Student> topStudent = stuStream.collect(maxBy(Comparator.comparingInt(Student::getTotalScore)));
```
* 스트림을 리듀싱 - reducing()
```java
	Collector reducing(BinaryOperator<T> op)
    Collector reducing(T identity, BinaryOperator<T> op)
    Collector reducing(U identity, Function<T,U> mapper, BinaryOperator<U> op) // map+reduce
    
    IntStream intStream = new Random().ints(1,46).distinct().limit(6);
    OptionalInt max = intStream.reduce(Integer::max);
    Optional<Integer> max = intStream.boxed().collect(reducing(Integer::max));
    
    long sum = intStream.reduce(0, (a,b) -> a + b);
    long sum = intStream.boxed().collect(reducing(0, (a,b) -> a+b));
    
    int grandTotal = stuStream.map(Student::getTotalScore).reduce(0, Integer::sum);
    int grandTotal = stuStream.collect(reducing(0, Student::getTotalScore, Integer::sum));
```
* 문자열 스트림의 요소를 모두 연결 : joining()
```java
	String studentNames = stuStream.map(Student:;getName).collect(joining());
    String studentNames = stuStream.map(Student:;getName).collect(joining(",")); // 구분자
    String studentNames = stuStream.map(Student:;getName).collect(joining(",","[","]"));
    String studentInfo = stuStream.collect(joining(",")); // Studnet의 toString()으로 결합
```
* 스트림의 요소를 2분할 - partitioningBy()
```java
	Collector partitioningBy(Predicate predicate)
    Collector partitioningby(Predicate, Collector downstream)
    
    Map<Boolean, List<Student>> stubySex = stuStream.collect(partitioningBy(Student::isMale)); // 학생들을 성별로 분할
    List<Student> male Student = stuBySex.get(true); // Map에서 남학생 목록을 얻는다.
    List<Studnet> female Student = stuBySex.get(false);  //Map에서 여학생 목록을 얻는다.
    								
    Map<Boolean, Long> stuNumBySex = stuStream.coolect(partitioningBy(Student::isMale, counting()); // 분할 + 통계
    System.out.println("남학생 수 : "+ stuNumBySex.get(true));
    System.out.println("여학생 수 : " + stuNuBySex.get(false)); 
    
    Map<Boolean, Optional<Student>> topScoreBySex = stuStream.collect(partitioningby(Student::isale, maxBy(comparingInt(Student:;getScore))));
    System.out.println("남학생 수 : "+ topScoreBySex.get(true));
    System.out.println("여학생 수 : " + topScoreBySex.get(false)); 
    
    Map<Boolean, Map<Boolean, List<Studnet>>> failedStubySex = stuStream // 다중분할
    .collect(partitioningBy(Student::isMale, // 성별로 분할(남/녀)
    		partitioningBy(s_>s.getScore()<150));  // 성적으로 분할(불/합)
    List<Student> failedMaleStu = failedStuBySex.get(true).get(true);
    List<Student> failedFemaleStu = failedStuBysex.get(false).get(true);
```
* 스트림의 요소를 그룹화 : groupingBy()
```java
	Collector groupingBy(Function classifier)
    Collector groupingby(Function classifier, Collector downstream)
    Collector groupingby(Function classifier, Supplier mapFactory, Collector downstream)
    
    Map<Integer, List<Student>> stuByBan = stuStream   // 학생을 반별로 그룹화
                                         .collect(groupingby(Student::getban,toList())); // toList() 생략가능
                       
    Map<Integer, Map<Integer, List<Student>>> stubyHakAndBan = stuStream // 다중그룹화
    										.collect(groupingBy(Student::getHak,        // 학년별 그룹화
                                            		 groupingBy(Student::getban)));     // 반별 그룹화
                                                     
    Map<Integer, Map<Integer, Set<Student.Level>>> stuByhakAndBan = stuStream.collect(
    	groupingBy(Studnet::getHak, groupingBy(Student::getBan,  // 다중 그룹화(학년,반별)
               mapping(s->{//성적등급(Level)으로 변환, List<Student> ->Set(<Student.Level>
                    if      (s.getScore() >= 200) return Student.Level.HIGH;
                    else if( s.getScore() >=100) return Studnet.Level.MID;
                    else                 return Student.Level.LOW;},toSet()) //mapping
                    )) // groupingBy()
                 ); // collect()
```
# 9 Collector 구현하기
* Collector인터페이스를 구현하는 클래스를 작성
```java
	public interface collector<T,,R> { T(요소)를 A에 누적한 다음, 결과를 R로 변환해서 반환
    	Supplier<A>   supplier();   // 결과를 저장할 공간(A)을 제공
        BiConsumer<A,T> accumulator(); // 스트림의 요소(T)를 수집(Collect)할 방법을 제공
        BinaryOperator<A> combiner();   // 두 저장공간(A)을 병합할 방법을 제공(병렬스트림)
        Function<A, R> finisher(); // 최종변환(A->R). 변환할 필요가 없는 경우, x->x
        Set<Characteristics> characteristics(); // 컬렉터의 특성이 담긴 Set을 반환
```
* 컬렉터가 수행할 작업의 속성 정보를 제공 :  characteristics()
```java
	Characteristics.CONCURRENT : 병럴로 처리할 수 있는 작업
	Characteristics.UNORDEREDT : 스트림의 요소의 순서가 유지될 필요가 없는 작업
	Characteristics.IDENTITY_FINISH : finisher(0가 항등 함수인 작업
    
    public Set<Characteristics> characteristics() {
    	return Collections.unmodifiableSet(EnumSet.of(
        	Collector.Characteristics.CONCURRENT, Collector.Characteristics.UNORDERED)));
     
    Set<Characteristics> characteristics() {
    	return Collections.emptySet(); // 지정할 특성이 없으면 빈 Set을 반환
   }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch14/CollectorEx1.java)

## 스트림의 변환에 사용되는 메서드들
![Java Stream 스트림의 변환 메서드들 1.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Stream%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EB%B3%80%ED%99%98%20%EB%A9%94%EC%84%9C%EB%93%9C%EB%93%A4%201PNG.PNG)

![Java Stream 스트림의 변환 메서드들 2.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Stream%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EB%B3%80%ED%99%98%20%EB%A9%94%EC%84%9C%EB%93%9C%EB%93%A4%202.PNG)
