> 출처 : 자바의 정석


# Java.util.ObjectsClass
* Java.lang.Object클래스의 보조 클래스
* Math클래스처럼 모든 메세드가 'static'이다.
* 객체의 비교나 널 체크에 유용하다.
```java
	static boolean isNull(Object obj)
    해당 객체가 널인지 확인해서 null이면 true, 아니면 false를 반환
    
    static boolean nonNull(Object obj)
    해당 객체가 널인지 확인해서 null이면 false 아니면 true isNull과 만대
    
    requireNonNull()
    해당 객체가 널이 아니어야하는 경우에 사용
    널이면, NullPoointerException을 발생
    두 번째 매개변수로 지정한느 문자열은 예외 메시지
    
     static <T> T requireNonNull(T obj)
 	 static <T> T requireNonNull(T obj, String meggage)
	 static <T> T requireNonNull(T obj, Supplier<String> messageSupplier)
     
     void setName(String name){
     	if(name==null) new NullPointerException("name must not be null.");
        this. name = name;
    }
     -------
     void setName(String name){
     	this.name = Objects.requireNonNull(name, "name must not be null.");
     }
```

* compare()
  - 두 비교대상이 같으면 0, 크면 양수, 작으면 음수를 반환
  - Object클래스에는 두 객체를 비교하는 메서드가 등가비교를 위한 equals()만 있고
  - 대소 비교를 compare가 업는 것을 보안
  ```java
  	static int compare(Object a, Object b, Comparator c)
    // a와 b를 c 기준으로 해서 대소 비교
  ```
  
  * equals(Object a, Objetc b)
     - Object클래스의 equals()와 비슷하지만 Objects클래스의 equals는 null검사를 하지 않아도 된다.
   ```java
   	if( a!=null && a.equals(b)) // a가 null인지 반드시 확인해야 한다.
    
    if(Objects.equals(a,b)) // 매개 변수의 값이 null인지 확인할 필요가 없다.
    
    
    public static boolean equals(Object a, Object b){
    	return (a==b) || (a != null && a.equals(b));
   } // a와b가 모두 널인 경우에 참
   ```
   
   * deepEquals() : 객체를 재귀적으로 비교하기 때문에 다차원 배열의 비교도 가능
   ```java
    String[][] str2D = new String[][]{{"aaa","bbb"},{"AAA","BBB"}};
    String[][] str2D2 = new String[][]{{"aaa","bbb"},{"AAA","BBB"}};
    
    Objects.equals(str2D, str2D2) -> false
    Objects.deepEquals(str2D, str2D2) -> true
    ```
    
 * toString()
 ```java
 	static String toString(Object o)
    static String toString(Object o, String nullDefalult)
 ```
 * 내부적으로 null검사ㅡㄹ 한다는 것 빼고는 Object클래스의 toString()과 같다.
 * 두 번째 메서드는 o가 널 떄, 대신 사용할 값을 지정
 * hashCode()
 ```java
 	static int hashCode(Object o)
    static int hashCode(Object... values)
 ```
 * 내부적으로 널 검사를 한 후에 Object클래스의 hashCode()를 호출
 * 널일떄는 0을 반환
