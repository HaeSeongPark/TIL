> 출처 : 자바의 정석

# Java.math.BigDecimalClass
* 정수(BigDecimal)를 이용해서 실수를 표현( 정수 * 10의 -scale), 불변
* scale은 0부터 Integer.MAX_VALUE사이의 값
```java
	
    private final BigInteger intVla; // 정수
    private final int scale; // 지수(scale)
    private transient prcision; // 정수의 자릿수(정밀도)
    
    BigDecimal val = new BigDecimal("123.45"); // 12345 * 10의 -2승
    val.unscaledValue() / 12345
    vla.scale() // 2
    val.pricision() // 5
    
```

## 1. BigDecimal의 생성
```java
BigDecimal val;
val = new BigDecimal("123.4567890"); // 문자열로 생성
val = new BigDecimal(123.456); // double타입의 리터럴로 생성
val = new BigDecimal(123456); / int, long타입의 리터럴로 생성
val = BigDecimal.valueOf(123.456) // 생성자 대신 valueOf(double) 사용
val = BigDecimal.valueOf(123456) // 생성자 대신 valueOf(int) 사용

   ===============double타입 주의
    new BigDecimal(0.1)   // 0.10000000000000005555511111
    new bigDecimal("0.1") // 0.1
```
## 2. 다른타입으로의 변환
* 문자열로 변환
```java
	String toPlainString() // 어떤 경우에도 다른 기호없이 숫자로만 표현
    String toString() // 필요하면 지수형태로 표현할 수도 있음
    ------- 1.0e-22
    BigDecimal val = new BigDecimal(1.0e-22);
    val.toPlainString()  // 0.0000000000000000000000000010.....
    val.toString()       // 1.0000000000000045....5E-22
```
* BigInteger도 Number로부터 상속받은 기본형으로 변환하는 메서들을 가지고 있다.
```java
	int intValue()
    long longValue()
    float floatValue()
    double doubleValue()
```

* Exact : 변환한 결과가 변환한 타입의 범위에 속ㄱ하지마 않으면 ArithmeticException을 발생
```java
	byte byteVlaueExact()
    short shortValueExact()
    int intValueExact()
    long longValueExact()
    BigInteger toBigIntegerExact()	
```

## 3. BigDecimal의 연산

```java
	BigDecimal add(BigInteger val)      // 덧셈(this+val)
    BigDecimal subtract(BigInteger val) // 뺄셈(this-val)
    BigDecimal multiply(BigInteger val) // 곱셈(this*val)
    BigDecimal divide(BigInteger val)   // 나눗셈(this/al)
    BigDecimal remainder(BigInteger val)// 나머지(this&val)
    // 새로운 인스턴스 반환
    										   value, scale, precision
	BigDecimal bd1 = new BigDecimal("123.456"); 123456   3      6
    BigDecimal bd2 = new BigDecimal("1.0");       10     1      2
    BigDecimal bd2 = bd1.multiply(bd2);        1234560   4      7
    
    //곱셈에서는 두 피연산자의 scale을 더하고, 나눗셈에서는 뺀다.
    //덧셈과 뺄셈에서는 둘 중 에서 자리수가 높은 쪽으로 맞추기 위해서 
    // 두 scale중에서 큰 쪽이 결과가 된다.
```

## 4. 반올림 보드 : divide()와 setScale()
```java
	BigDecimal divede(BigDecimal divisor)
    BigDecimal divede(BigDecimal divisor, int roundingMode)
	BigDecimal divede(BigDecimal divisor, RoundingMode roundingMode)
	BigDecimal divede(BigDecimal divisor. int scale, int roundingMode)
	BigDecimal divede(BigDecimal divisor, int scale, RoundingMode roundingMode)
    BigDecimal divede(BigDecimal divisor, MathContext mc)
```

상수   | 설명
--------|---------
CEILING | 올림
FLOOR | 내림
UP    | 양수일 때는 올림, 음수일 때는 내림
DOWN | 양수일 때는 내림, 음수일 때는 올림(UP과 반대)
HALF_UP | 반올림(5이상 올림, 5미만 버림)
HALF_EVEN | 반올림(반올림 자리의 값이 짝수면 HALF_DOWN, 홀수면 HALF_UP)
HALF_DOWN | 반올림(6이상 올림, 6미만 버림)
UNNECESSARY | 나눗셈의 결과가 딱 떨어지는 수가 아니면, ArithmeticException 발생



```java

	BigDecimal bigd = new BigDecimal("1.0");
    BigDecimal bigd2 = new BigDecimal("3.0");
    
    bigd.divide(bigd2)  // ArithmeticException 발생 0.333... 무한소수
    bigd.divide(bigd2,3,RoundingMode.HALF_UP)  // 0.333
```

## 5. java.math.MathContext

* 반올림 모드와 정밀도(precision)을 하나로 묶어놓은 메서드
* 주의할 점은 divide()에서는 scale이 소수점 이하의 자리수를 의미
* mathContext에서는 pricision이 정소와 소주점이하를 모두 포함한 자리수를 의미
```java
	BigDecimal bd1 = new BigDecimal("123.456");
    BigDecimal bd2 = new BigDecimal("1.0");
    
    bd1.divide(bd,2,HALS_UP); // 123.46
    bd1.divide(bd2, new MathContext(2, HALF_UP)) // 1.2E+2
```


## 6. scale의 변경
* BigDecimal을 10으로 곱하거나 나누는 대신 scale의 값을 변경함으로써 같은 결과를 얻을 수 있다.
* setScale()이용
```java
	BigDecimal setScale(int newScale)
    BigDecimal setScale(int newScale, int roundingMode)
	BigDecimal setScale(int newScale, RoundingMode mode)
```
* setScale()로 scale을 값을 줄이는 것은 10의 n제곱으로 나누는 것과 같으므로, divide()를 호출할 때처럼 오차가 발생할 수 있어서 반올림 모드를 지정해 주어야 한다.
```java
	bd1.setScale(2, HALF_UP))
```

