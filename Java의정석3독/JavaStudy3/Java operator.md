# Java operator
## 1. 연산자
### 1.1 연산자 우선순위

![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Operator%20priority.png)

### 1.2 일반 산술 변환
   - 연산 수행 전에 발생하는 피연산자의 자동 형변환
   - 두 피연산자의 타입을 같게한다.(보다 큰 타입으로 일치시킨다)
   - 피연산자의 타입이 int보다 작은 타입이면 int로 변환된다.

## 2 단항연산자
### 2.1 증감 연산자 (++ --)
```java
	1. 전위연산자
    j = ++i;
    ----
    i++;
    j = i;
    
    2. 후위연산자
    j = i++;
    j = i;
    i++;
    
```

## 3. 산술연산자
### 3.1 사칙연산
```java
	byte a = 10;
    byte b = 20;
    byte c = a + b;
    // 3번째 문장 에러
    byte c = int + int = int // 큰 -> 작 , 명시적형변환필요. 
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx7.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx9.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx10.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEX13.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEX15.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEX16.java)

### 3.2 나머지 연산 %
* 나누는 수(오른쪽 피연산자)로 0을 사용할 수 없고, 피 연산자로 정수만 허용
* 주로 짝수 홀수 배수 검사시 사용
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEX20.java)

## 4. 비교연산자
* 이항 연산자이므로 비교하는 피연산자의 타입이 서로 다를 경우에는 자료형의 범위가 큰 쪽으로 자동 형변환
### 4.1 대소비교 연산자
### 4.2 등가비교 연산자
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEX22.java)

* 소스 부연설명
   - o.1==0.1f 는 false 이고 10.0==10.0f는 true이다.
   - 정수형과 달리 실수형은 근사값으로 저장됨
   - 10.f는 오차없이 저장할 수 있는 값이라서 double로 형변환해도 그대로 10.0이 되지만
   - 0.1f는 저장할 때 2진수로 변환하는 과정에서 오차가 발생한다. 
   - double타입의 상수인 0.1도 저장되는 과정에서float타입의 리터럴인 0.1f보다 적은 오차
   - 따라서 double과 float를 비교하려면 double타입을 float로 변환하던지
   - 두 값의 자리수를 float범위에서 통일

## 5. 논리연산자
### 5.1 논리연산자 : &&, ||, !
* 효율적인 연산
    - || 연산의 경우, 두 피연산자 중 한 쪽만 '참'이어도 연산결과가 '참'이므로 좌측 피연산자가 'true'이면 우측 피연산자의 값은 평가하지 않는다.
    - | 또한 논리연산자로 쓰이는데 이것은 좌측 피연산자가 'true'이어도 우측 피연산자의 값을평가한다.
    - && 연산의 경우 어느 한쪽만 '거짓'이어도 전체 연산결과가 '거짓'이므로 좌측 피연산자가 '거짓'이면 우측 피연산자의 값을 평가하지 않는다.
    - & 또한 논리연산자로 쓰이는데 이것은 좌측 피연산자가 'false'이어도 우측 피연산자의 값을 평가한다.
 
 ### 5.2 비트연산자
 * 피연산자를 비트단위로 연산
 * 실수형을 제외한 모든 기본형에 사용가능
 * x << n은 x * 2의 n승의 결과와 같다.
 * x >> n은 x * 2의 n승의 결고와 같다.


 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx26.java)
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx28.java)
  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx29.java)
   [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx30.java)
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx28.java)
  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx30.java)
   [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch3_operator/OperatorEx31.java)
   
   ## 6 .그 외 연산자
   ### 6.1 조건 연산자 ? :
   * 조건식 ? 식1 : 식2
   * 조건식이 참이면 식1, 거짓이면 식2

### 6.2 대입연산자
* i*= 10  +j;   / i = i * (10+j);
