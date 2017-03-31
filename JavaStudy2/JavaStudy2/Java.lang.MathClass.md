> 출처 : 자바의 정석


# Java.lang.MathClass
## 1 특징
* 기본적인 수학계산에 유용한 메서드 구성 됨 ( 모두 static 메서드 )
* Math클래스는 인스턴스가 하나도 없어서 생성자의 접근 제어자가 private이다. 따라서 인스턴스를 생성할 수 없다.
* 또한 Math크래스의 메서드는 모두 stasitc이며, 2개의 상수만 있다.
```java
	public static final double E = 2.7182818.... // 자연로그의 밑
    public static final double PI = 3.141592.... // 원주율
```

## 2 올림, 버림, 반올림
* round()는 항상 소수점 첫째자리에서 반올림을 해서 정수값(long)을 결과로 돌려준다.
```java
	// 소수점 셋째자리에서 반올림하기
    // 1. 원래 값에 100을 곱한다.
    90.7552 * 100 -> 9075.52
    // 2. 위의 결과에 Math.round()를 사용
    Math.round(9075.52) -> 9076
    // 3. 위의 결과에 다시 100.0로 나눈다.
    9076 / 100.0 -> 90.76
```
* round() vs rint()
   - rint()도 round()처럼 소수점 첫째자리에서 반올림하지만, 반환값이 double이라는 차이가 있다.
 ```java
 	round(1.5) -> 2 (int)
    rint(1.5) -> 2.00000 (double)
 ```
  - 매개변수가 음수일 때
  ```java
  	round(-1.5) -> -1 // round는 소수점 첫째자리가 5일 떄, 더 큰 값으로 반올림
    rint(-1.5) -> -2.0000 // rint()는 소수점 첫째자리가 5미만일 때, 더 큰 값으로 반올림
                          // 반대로 rint()는 소수점 첫째자리가 5이상이면, 더 작은 값으로 내림
  ```
  * ceil(), floor()
  ```java
  	ceil(-1.5) -> -1.00000
    floor(-1.5) -> -2.00000
  ```
  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch9_lang/MathEx1.java)
  
  ## 3 예외를 발생시키는 메서드
  * 메서드 이름에 'Exact'가 포함된 메서드들(JDK1.8)에 새로 추가
  * 이들은 정수형간의 연산에서 발생할 수 있는 오버플로우를 감지
  ```java
       int addExact(int x, int y) // x+y
       int subtractExact(int x, iny y) // x-y
       int multiplayExact(int x, int y) // x*y
       int incrementExact(int a) // a++
       int decrementExact(int a) // a--
       int negateExact(int a) // -a
       int toIntExact(long value) // (int)value - int로의 형변환
  ```
  
  ## 4 삼각함수와 지수 로그
  * 제곱근 : sqrt()
  * n제곱 : pow()
  ```java
  	// 두 점 사이의 거리
  	double c = sqrt(pow(x2-x1,2) + pow(y2-y1,2));
    
    double a = c * sin(PI/4); // PI/4 radian = 45 degree
    double b = c * cos(PI/4); 
  //double c = c * cos(toRadians(45)); / 각도를 라디안으로 변환
  
  // atan2메서드는 직각 삼각형에서 두 변의 길이 a,b를 알면 끼인각을 구해준다.
  // 이메서드의 결과값 역시 단위가 라디안이므로 '도degree'로 변환하려면 '180/PI'를 곱하거나
  // toDegrees(double angrad)를 이용하면 된다.
  double f = atan2(a,b);
  double f2 = ataan2(a,b) * 180/PI;
//double f2 = toDegrees(atan2(a,b));

//24자리의 2진수는 10진수로 몇 자리의 값인지를 알아내려면
// 2의 24승 = 10의 x승
// 24 * long10(2) = x 
// 24 * long10(2) // 7.22470 -> 7자리
  ```
  
## 5 StaticMath클래스
  * 어떤 OS에서 실행돼도 항상 같은 결과를 얻도록 Math클래스를 새로 작성한 것

## 6 Math클래스의 메서드
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java.lang.Math%20Class.png)
