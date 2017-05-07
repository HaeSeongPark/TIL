> 출처 : 자바의 정석

# Java variable
## 1. Primitive type
* 논리형 : true와 false중 하나를 값으로 갖으며, 조건식과 논리적 계산에 사용
* 문자형 : 문자를 저장하는데 사용되며, 변수 당 하나의 문자만을 저장할 수 있다.
* 정수형 : 정수 값을 저장하는데 사용된다. 주로 사용하는 것은 int와 long이며,byte는 이진데이터, short는 c와의 호환을 위해 추가
* 실수형 : 실수 값을 저장하는데 사용된다. float와 double이 있다.

![primitiveTpye1.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch2_variable/primitiveTpye1.png)
![primitiveTpye2.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch2_variable/primitiveTpye2.png)


## 2. Naming convention
* 대소문자가 구분되며 길이에 제한이 없다.
* 예약어를 사용해서는 안된다.
* 숫자로 시작해서는 안 된다.
* 특수 문자는 '_'와 '$'만을 허용
* 클래스 이름의 첫 글자는 항상 대문자로 한다.
* 변수와 메서드 이름의 첫 글자는 항상 소문자로 한다.
* 여러 단어 이름은 단어의 첫 글자를 대문자로 한다.(lastIndexOf 등)
* 상수의 이름은 대문자로 한다. 단어는 '_'로 구분한다. (PI, MAX_NUMBER)

## 3. 리터럴과 접비사
* long l = 10000000L;  // 100_100_100L 가능
* float f = 3.14f
* double d = 3.14d // 3.14 d 생략가능 실수형은 double이 기본이라
* 10.0 -> 10.0
* .10 -> 0.10
* 10f -> 10.0f
* 3.14e3 -> 3140.0f
* 1e1 -> 10.0
* 1e2 -> 100.0

## 변수의 기본값과 초기화
* 지역변수는 반반드시 초기화 해줘야한다.
![변수의 기본값과 초기화.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch2_variable/%EB%B3%80%EC%88%98%EC%9D%98%20%EA%B8%B0%EB%B3%B8%EA%B0%92%EA%B3%BC%20%EC%B4%88%EA%B8%B0%ED%99%94.PNG)

## Casting
* 값의 타입을 다른 타입으로 변환
* boolean을 제외한 7개의 기본형은 서로 형변환이 가능하다.
* int를 char으로 변환하면 정수값에 해당하는 유니코드문자
* char를 int으로 변환하면 문자의 유니코드 값
* 실수값을 정수로 형변활 할 때 반올림이 아닌 버림
* 작은 타입에서 큰 타입으로 형변환 할 때 Casting생략가능
* 큰 타입에서 작은 타입으로 형변환 할 때는 반드시 명시적으로 형변환을 해줘야 합니다.
  - 큰 타입에서 작은 타입으로 변환하는 경우에는 값손실이 발생할 수 있지만, 작은 타입에서 큰 타입으로 변호나하는 경우에는 값손실이 발생하지 않기 때문
      - 하지만 int -> float일 때 예외도 있다.
      - 8자리의 이상의 int형을 float로 변환할 때 값이 변할 수 있다.
      - float의 정밀도가 7자리이 이기 때문
      - int i = 91234567;
      - (float)i -> 91234568
      - [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch2_variable/CastingEx4.java)
* Short과 char는 같은 2바이트이지만 표현할 수 있는 값의 범위가 서로 다르기 때문에 자동형변환이 되지 않는다.
* Long이 8바이트인데도 4바이트인 float로 자동형변환이 되는 이유는 Float가 4바이트이지만, long과는 표현방식이 달라서 더 큰 범위를 표현할 수 있기 때문.

![Casting](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/ch2_variable/Casting.PNG)
