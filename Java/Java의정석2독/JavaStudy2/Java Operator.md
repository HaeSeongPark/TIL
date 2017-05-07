> 출처 : 자바의 정석

# Java Operator
![연산자우선순위](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Operator%20priority.png)

* 비트전환연산자 : '~'
    - 정수를 2진수로 표현했을 때, 1을 0으로 0은 1로 바꾼다. 단, 정수형에만 사용가능
* 이상연산자
    - int 보다 크기가 작은 타입인 byte,char,shor는 int로 변환된다
    - 피연산자 중 표현범위가 큰 타입으로 형변환 한다.
    ```java
    	byte + short -> int + int -> int
        char + int -> int + int -> int
        float + int -> float + float -> float
        long + float -> float + float -> float
        float + double -> double + double -> double
    ```
    - long a = 10000000*1000000 // a는 -727,379,233
    -  10000000*1000000하면 int형의 범위를 넘어버려셔 위와 같이 
    ```java
    	char c1 = 'a';
        char c2 = c1 + 1; // 에러
        // c1 + 1 -> char + int -> int + int -> int
        // c1 + 1의 최종결과가 int인데 int형보다 작은 범위를 가진 char형에 넣으려고 하니까 오류
        char c2 = (char)(c1+1); // ok
    ```
    ```java
    	float pi = 3.141592f;
        float shortPi = (int)(pi*1000) / 1000f;
        (int)(3.141592f * 1000) / 1000f;
        (int)(3141.592f) / 1000f;
        3141 / 1000f;
        3141.0f / 1000f
        3.141f
		//반올림
		float shortPi = Math.round(pi*1000) / 1000f;
        Math.round(3.141592f*1000) / 1000f;
        Math.round(3141.592f) / 1000f;
        3142.0f / 1000f;
        3.142f
    ```
 * 비교연산자
     - 피연산자를 같은 타입으로 변환한 후에 비교
     - 참조형에는 ==와 !=만 사용 가능
 ```java
 	'A' < 'B' -> 65 < 66 -> true
    '0' == 0 -> 48 == 0 -> false
    'A' != 65 -> 56 != 65 -> false
    10.0d == 10.f -> 10.0d == 10.0d -> true
    11.0.1d == 0.1f -> 0.1d == 0.1d -> true? false?
    double d = (double)0.1f;
    print(d); // 0.100000000000149011612
    11.0.1d == 0.1f -> 0.1d == 0.1d -> false
    (float)0.1d == 0.1f -> 0.1f == 0.1f -> true
    //이와같이 double형과 float형을 비교할 때는 double형을 float로 변경해야함
 ```
 * 비트연산자
     -  피연산자를 비트단위로 연산
     -  실수형을 제외한 모든 기본형에 사용가능
     -  | : 피연산자 중 어느 한 쪽이 1이면 1이다.
     -  & : 피연산자 양 쪽 모두 1이면 1이다.
     -  ^ : 피연산자가 서로 다를 때 1이다.
 
 * 논리연산자
    - 피연산자가 반드시 boolean이어야 하며 연산결과도 boolean이다.
    - &&가 || 보다 우선순위가 높다.
   
 * 삼항연산자 - ? :
     - (조건식) ? 식1 : 식2
     - x >= 0 ? x : -x;
 
 * 대입연산자
 ![대입연산자](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Operaotr%20%EB%8C%80%EC%9E%85%EC%97%B0%EC%82%B0%EC%9E%90.png)
