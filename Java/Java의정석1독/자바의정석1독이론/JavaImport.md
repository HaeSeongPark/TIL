# import문
1  import문이란?
* 사용할 클래스가 속한 패키지를 지정하는데 사용
* import문을 사용하면 클래스를 사용할 때 패키지명을 생략할 수 있다.
```java       
															import java.util.*;
	class ImportTest{                                       class ImportTest{  
      java.util.Date today = new java.util.Date(); 				Date today = new Date();
      }														}
```
* java.lang 패키지의 클래스는 import하지 않고도 사용할 수 있다.(String. Object, System, Thread ...) 이 패키지는 매우 빈번히 사용되는 중요한 클래스들이 속한 패키지이기 때문으로 모든 소스파일에 묵시적으로 다음과 같은 import문이 선언 돼있다. `import java.lang.*;`
* import문은 프로그램의 성능에 전혀 영향을 미치지 않는다. import문을 많이 사용하면 컴파일 시간이 아주 조금 더 걸릴 뿐이다.

2  패키지 선언
* ` 1 package문  / 2 import문 / 3 클래스선언` 
* `import 패키지명.클래스명; 또는 import 패키지명.*;`
 ```java
	import java.util.Calendar;
    import java.util.Date;                      ---> import java.util.*;
    import java.util.ArrayList;
 ```
* import문에서 클래스의 이름 대신 '*' 을 사용한는 것이 하위 패키지의 클래스까지 포함하는 것은 아니라는 것이다.
 ```java
 	import java.util.*;
    import java.text.*;             -> x           import java.*;
```
* 이름이 같은 클래스가 속한 두 패키지를 import할 때는 클래스 앞에 패키지명을 붙여줘야 한다.
```java
	import java.sql.*; // java.sql.Date
    import java.util.*; // java.util.Date
    
    public class ImportTest{
    	public static void main(String[] args){
        	java.util.Date today = new java.util.Date();
            }
     }
```

3 static import문
* import문을 사용하면 클래스의 패키지명을 생략할 수 있는 것과 같이 static import문을 사용하면 static멤버를 호출할 때 클래스 이름을 생략할 수 있다. 특정 클래스의 static멤버를 자주 상요할 때 편리하고 코드도 간결해진다.
```java
	import static java.lang.Integer.*;  // Integer클래스의 모든 static메소드
    import static java.lang.Math.random; // Math.random()만. 괄호 안 붙임
    import static java.lang.System.out; // System.out을 out만으로 참조 가능
    
    System.out.println(Math.random());           -> out,println(random());
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/StaticImportEx1.java)
