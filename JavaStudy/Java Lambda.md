> 출처 : 자바의정삭

# Java Lambda
## 1. 람다식이란?
 * 함수(메서드)를 간단한 '식(Expression)'으로 표현하는 방법
 ```java
 	int max(int a, int b){
    	return a>b ? a:b;
     }
    ///람다식으로 변환
    (a,b) -> a>b ? a : b
 ```
 ## 2. 람다식 작성하기
 #### 2-1. 메서드이 이름과 반환타입을 제거하고 '->'를 블록{} 앞 에 추가한다.
  ```java
 	int max(int a, int b){
    	return a>b ? a:b;
    }
    
    (int a, int b) -> {
    	return a>b?a:b;
    }
 ```
#### 2-2. 반환값이 있는 경우, '식'이나 '값'만 적고 return문은 생략. 끝에 ';' 안 붙임

  ```java
   (int a, int b) -> {
    	return a>b?a:b;
    }
    
    (int a, int b) -> a>b ? a : b 
```
#### 2-3. 매개변수의 타입이 추론 가능하면 생략가능(대부분의 경우 생략가능)
```java
	(int a, int b) -> a>b ? a : b 
    
    (a,b) -> a>b ? a : b
```

#### 주의사항
* 매개변수가 하나인 경우, 괄호'()' 생략가능 (타입이 없을 때만)
```java
	(a) -> a * a      |     a ->  a * a
(int a) -> a * a      |  int a -> a * a   (X)
```
* 블록 안의 문장이 하나뿐 일 때, 괄호'{}' 생략가능, 문장끝에 ';' 안 붙임
```java
	(int i) -> {
    	System.out.println(i);     -> (int i) -> System.out.println(i)
     }
```
* 단, 하나뿐인 문장이 return문이면 괄호{} 생략불가
```java
	(int a, int b) -> { return a > b ? a : b; }
    (int a, int b) -> return a > b ? a : b;   // 에러
```

## 3. 함수형 인터페이스(Functional Interface)
* 람다식은 익명 객체
```java
	(a,b) -> a>b? a:b 
    ---------------
    new Object(){
    	int max(int a, int b){           //max는 임의
        	return a > b ? a: b;
            }
        }
```
* 람다식(익명 객체)를 다루기 위한 ㅊ마조변수가 필요. 참조 변수 타입은?
```java
	타입 f = (int a, int b) -> a > b ? a : b; // 타입을 뭘로??
    //참조형이니까 클래스나 인터페이스가 가능
    //람다식과 동등한 메서드가 정의돼 있어야 한다.
    
    interface myFunction{
    	public abstract int max(int a, int b);
     }
     @fFunctionalInterface   // 컴파일러가 함수형 인터페이스를 올바르게 정의했는지 체크
     MyFunction f = new MyFunction() {
     	public int max(int a, int b){
        	return a > b ? a : b;
            }
        };
     int big = f.max(5,3); // 익명 객체의 메서드를 호출
```
* 함수형 인터페이스 : 단 하나의 추상메서드만 선언된 인터페이스
    - 람다식과 인터페이스의 메서드가 1:1로 연결될 수 있기 때문
    - 반면 static메서드와 default메서드의 개수에는 제약이 없다.
* 함수형 인터페이스의 타입의 참조변수로 람다식을 참조할 수 있음
   - 단 함수형인터페이스의 메서드와 람다식의 매개변수 개수와 반환타입이 일치해야함)
```java
	MyFunction f= (a,b) -> a > b ? a : b;
    int big = f.max(3,5); // 실제로는 람다식(익명 함수)이 호출됨
```
* example
```java
	//익명 객체를 람다식으로 대체
    List<String> list = Arrays. asList("abc", "aaa", "bbb", "ddd", "aaa");
    
    Collections.sort(list, new Comparator<String>(){
    					public int compare(String s1, String s2){
                        	return s2.compareTo(s1);
                            }
                        });
    ---------------------
    List<String> list = Arrays.asList("abc","aaa","bbb","ddd","aaa");
    Collections.sort(list, (s1,s2) -> s2.compareTo(s1));
                       
```
* 함수형 인터페이스 타입의 `매개변수`
   - 메서드의 매개변수가 MyFunction타입이면, 이 메서드를 호출할 때 람다식을 참조하는 참조변수를 매개변수로 지정해야한다는 뜻
```java
	@FunctionalInterface
    interface MyFunction{
    		void myMethod();   //추상 메서드
      }
    void aMethod(MyFunction f){ // 매개변수 타입이 함수형 인터페이스
    	f.myMethod(); //MyFunction에 정의된 메서드 호출
     }
     ...
     MyFunction f = () -> System.out.println("myMethod()");
     aMethod(f);
```
* 함수형 인터페이스 타입의 반환타입
```java
	MyFunction myMethod(){
    	MyFuncton f = ()->{};
        return f;
        // return ()->{};
```
> 
람다식으로 인해, 메서드를 변수처럼 주고받는 것이 가능해졌다. 또한, 코드가 간결해졌다.

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch14/LambdaEx1.java)

## 4. java.util.function패키지
* java.util.function패키지의 주요 함수형 인터페이스

![java.util.function패키지의 주요 함수형 인터페이스.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.util.function%ED%8C%A8%ED%82%A4%EC%A7%80%EC%9D%98%20%EC%A3%BC%EC%9A%94%20%ED%95%A8%EC%88%98%ED%98%95%20%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4.PNG)

#### 4-1. 조건식의 표현에 사용되는 Predicate
```java
	Predicate<Sttring> isEmptyStr = s -> s.length() == 0;
    String s = "";
    
    is(isEmptyStr.test(s)) // if(s.length() == 0)
    	System.out.println("This is an empty String.");
```

#### 4-2. 매개변수가 두 개인 함수형 인터페이스
* 매개변수의 개수가 2개인 함수형 인터페이스는 이름 앞에 접두사 'Bi'가 붙는다.
![매개변수가 두 개인 함수형 인터페이스](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.util.function%20%EB%A7%A4%EA%B0%9C%EB%B3%80%EC%88%98%EA%B0%80%20%EB%91%90%20%EA%B0%9C%EC%9D%B8%20%ED%95%A8%EC%88%98%ED%98%95%20%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4.PNG)
* Supplier는 매개변수는 없고 반환값만 존재하는데, 메서드는 두 개의 값을 반환활 수 없으므로 BiSuppier가 없다
* 두 개 이상의 매개변수를 갖는 함수형 인터페이스는 직접 만들어서 써야한다.
```java
	// 3개의 매개변수를 갖는 함수형 인터페이스를 선언
    @FuntionalInterface
    interface TriFunction<T,U,V, R>{
    	R apply(T t, U u, V v);
     }
```
#### 4-3. 매개변수의 타입과 반환타입이 일치하는 함수형 인터페이스
![java.util.function 매개변수의 타입과 반환타입 일치 함수형 인터페이스.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.util.function%20%EB%A7%A4%EA%B0%9C%EB%B3%80%EC%88%98%EC%9D%98%20%ED%83%80%EC%9E%85%EA%B3%BC%20%EB%B0%98%ED%99%98%ED%83%80%EC%9E%85%20%EC%9D%BC%EC%B9%98%20%ED%95%A8%EC%88%98%ED%98%95%20%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4.PNG)
```java
	@FunctionalInterface
    public interface Function<T,R>{
    	R apply(T t);
        ...
    }
    --------------------------------------
    @FunctionalInterface
    public interface UnaryOperator<T> extends Function<T,T>{
    	static<T> UnaryOperator<T> indextity(){
        	return t -> t;
            }
     }
```
#### 4-5. 컬렉션 프레임웍과 함수형 인터페이스
![java.util.function 컬렉션프레임웍과 함수형 인터페이스.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.util.function%20%EC%BB%AC%EB%A0%89%EC%85%98%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8D%EA%B3%BC%20%ED%95%A8%EC%88%98%ED%98%95%20%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4.PNG)
```java
	list.forEach(i->System.out.println(i+",")); // list의 모든 요소를 출력
    list.removeIf(x-> x%2==0 || x%3 ==0);       // 2 또는 3의 배수를 제가
    list.replaceAll(i->i*10);                   //모든 요소에 10을 곱한다.
    //map의 모든 요소를 {k,v}의 형식으로 출력
    map.forEach((k,v)->System.out.print("{"+k+","+v+"},"));
```
[[LambdaEx4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch14/LambdaEx4.java)

[[LambdaEx5]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch14/LambdaEx4.java)

#### 4-6. 기본형을 사용하는 함수형 인터페이스
![java.util.function 기본형을 사용하는 함수형 인터페이스.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java.util.function%20%EA%B8%B0%EB%B3%B8%ED%98%95%EC%9D%84%20%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94%20%ED%95%A8%EC%88%98%ED%98%95%20%EC%9D%B8%ED%84%B0%ED%8E%98%EC%9D%B4%EC%8A%A4.PNG)
```java
	Supplier<Integer> s = () -> (int)(Math.random()*100)+1;
    static<T> void makeRandomList(Supplier<T> s, List<T> list)[
    	for(int i=0; i<10; i++)
        	list.add(s.get()); // List<Integer> list = new ArrayList<>();
    -----------------------------------
	IntSupplier s = () -> (int)(Math.random()*100)+1;
    static void makeRandomList(IntSupplier s, int[] list)[
    	for(int i=0; i<10; i++)
        	arr[i] = s.getAsInt(); // get()이 아니라 getAsInt()
```

## 5.Function의 합성과 Predicate의 결합

```java
	Function
    default<V> Function<T,V> andThen(Function<? super R, ? extends V> after)
    default<V> Function<V,R> compose(Function<? super V, ? extends T> before)
    static <T> Function<T,T> identity()
    
    Predicate
    default Predicate<T> and(Predicate<? super T> other)
    default Predicate<T> or(Predicate<? super T> other)
    default Predicate<T> negate()
    static <T> Predicate<T> isEqual(Object targetRef)
```
#### 5-1 Function의 합성
* Function타입의 두 람다식을 하나로 합성 - andThen()   f 다음 g

![Java lambda Function andThen.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20lambda%20Function%20andThen.PNG)
```java
	Function<String, Integer> f = (s) -> Integer.parseInt(s,16); // s를 16진 정수로 변환
    Function<Integer, String> g = (i) -> Integer.toBinaryString(i); // 2진 문자열로 변환
    Function<String,String>   h = f.andThen(g) // f+g -> h
    
    System.out.println(h.apply("FF")); // "FF"  -> 255   -> "11111111"
```
* Function타입의 두 람다식을 하나로 합성 - compose()  g 다음 f
![Java lambda Function compose.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20lambda%20Function%20compose.PNG)
```java
	Functoin<Integer, String> g = (i) -> Integer.toBinaryString(i);  // 2진 문자열로 변환
    Function<String, Integer> f = (s) -> Integer.parseInt(s, 16);    // s를 16진 정수로 변환
    Function<Integer, Integer> h = f.compose(g);  // g + f -> h
    
    System.out.println(h.apply(2)); // 2-> "10" -> 16
```
#### 5-2 Predicate의 결합
* and(), or(), negate()로 두 Predicate를 하나로 결합(default 메서드)
```java
	Predicate<Integer> p = i-> i < 100;
    Predicate<Integer> q = i-> i < 200;
    Predicate<Integer> r = i-> i%2 == 0;
    
    Predicate<Integer> notP = p.negate();  // i>=100
    Predicate<Integer> all = notP.and(q).or(r)  // 100 <= i && i < 200 || i%2==0
    Predicate<Integer> all2 = notP.and(q.or(r)); // 100 <= i && (i < 200 || i%2==0)
    
    System.out.println(all.test(2));  // true
    System.out.println(all2.test(2)); // false
```
* 등가비교를 위한 Predicate의 작성에는 isEqual()를 사용 (static 메서드)
```java
	Predicate<String> p = Predicate.isEqual(str1);   // isEquals()은 static메서드
    Boolean result = p.test(str2);  // str1과 str2가 같은지 비교한 결과를 반환
    
    // 위 2문장을 한 문장으로
    boolean result = Predicate.isEqulat(str1).test(str2);
```

## 6. 메서드 참조(method reference)
* 하나의 메서드만 호출하는 람다식은 '메서드 참조'로 간단히 할 수 있다.
* '클래스::메서드이름' 또는 '참조변수::메서드이름'
 
종류 |람다식 | 메서드 참조
------------ | -------------|-----------
static메서드참조 | (x) -> ClassName.method(x) | ClassName::method
인스턴스메서드 참조|(obj, x) -> obj.method(x) | ClassName::method
특정 객체 인스턴스메서드 참조 | (x) -> obj.method(x) | obj::method

#### static메서드 참조
```java
	Integer method(String s) { //그저 Integer.paresInt(String s)만 호출
    	return Integer.pareInt(s);
    }
  -->
  Function<String,Integer> f = (String s) -> Integer.parseInt(s);
  -->
  Function<String,Integer> f = Iteger::pareInt; // 메서드 참조
```
#### 인스턴스 메서드 참조
```java
	BiFunction<String, String, Boolean> f = (s1, s2) -> s1.equals(s2);
   --->
   BiFunction<String, String, Boolean> f = String::equals;
```

#### 특정 객체의 인스턴스 메서드 참조
```java
	MyClass obj = new MyClass();
    Function<String, Boolean> f = (x) -> obj.equals(x); //람다식
    Function<String, Boolean> f2 = obj::equals; // 메서드 참조
```
#### new연산자(생성자, 배열)와 메서드 참조
```java
	Supplier<MyClass> s = MyClass::new;    // () -> new MyClass()
    Function<Integer, MyClass> f2 = MyClass::new;  // (i) -> new MyClass(i)
    Function<Integer, int[]> f2 = int[]::new; // x-> new int[x];
```
