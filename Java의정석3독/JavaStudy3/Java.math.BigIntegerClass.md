> 출처 : 자바의 정석

# Java.math.BigIntegerClass
* long으로도 표현할 수 없을 때 사용하는 클래스
* immutable
* 2의 보수 형태
* 부호와 값을 따로 저장
```java
	final int sinum; // 부호 1(양수), 0, -1(음수) 셋 중의 하나
    final int[] msg;
```

## 1. BigInteger의 생성
```java
	BigInteger val;
    val = new BigInteger("12345678901234567890");
    val = new BigInteger("FFFF",16); // n진수(radix)으 문자열로 생성
    val = BigInteger.valueOf(1234567890L); // 숫자로 생성
```

## 2. 다른 타입으로의 변환
* BigIntger를 문자열, byte배열로 변환하는 메서드
```java
	String toString() // 문자열로 변환
    String toString(int radix) // 지정된 진접의 문자열로 변환
    byte[] toByteArray() // byte배열로 변환
```
* BigInteger도 Number로 부터 상속받은 기본형으로 변환하는 메서드들을 가지고 있다.
```java
	int intValue()
    long llongValue()
    float floatValue()
    double doubleValue()
```
* Exact : 변환환 결과가 변환한 타입의 범위에 속하지 않으면 ArithmeticException을 발생
```java
	byte byteValueExact()
    int intValueExact()
    long longValueExact()
```

## 3. BigInteger의 연산
```java
	BigInteger add(BigInteger val)      // 덧셈(this+val)
    BigInteger subtract(BigInteger val) // 뺄셈(this-val)
    BigInteger multiply(BigInteger val) // 곱셈(this*val)
    BigInteger divide(BigInteger val)   // 나눗셈(this/al)
    BigInteger remainder(BigInteger val)// 나머지(this&val)
    
    remainder와 mod는 둘 다 나머지를 구하는 메서드이지만, mod는 나누는 값이 음수면
    ArithmeticException을 발생
```

## 4. 비트 연산 메서드
	int bitCount()          // 2진수로 표현했을 때, 1의 개수(음수는 0의 개수)를 반환
    int bitLength()         // 2진수로 표현했을 떄, 값을 표현하는데 필요한 bit수
    boolean testBit(int n)  // 우측에서 n+1번째 비트가 1이면 true, 0이면 false
    BigInteger setBit(int n) // 우측에서 n+1번째 비트를 1로 변경
    BigInteger clearBit(int n) // 우측에서 n+1번째 비트를 0으로 변경
    BigInteger flipBit(int n)  // 우측에서 n+1번째 비트를 전환(1->0, 0->1)
    //  n의 값은 배열의 index처럼 0부터 시작하므로, 우측에서 첫 번째 비트는 n이 0이다.
    
    //BigInteger의 짝수판단 사용 예
    BigInteger bi = new BigInteger("4");
    if(bi.remainder(new BigIntger("2")).equals(BigInteger.ZERO))
    -------->
    짝수는 제일 올른쪽 비트가 0이므로...
    if(bi.testBit(0))  // if(bi.testBit(0)==true)

