# java.util.ScannerClass
* 화면 파일 문자열과 같은 입력소스로부터 문자데이터를 읽어오는 것
```java
	Scanner(String source)
    Scanner(File source)
    Scanner(InputStream source)
    Scanner(Readable source)
    Scanner(ReadableByteChannel source)
    Scanner(Path source)   // JDK1.7부터 추가
    
    //정규식 표현을 이용한 라인단위의 검색을 지원하며
    //구분자(delimiter)에도 정규식 표현을 사용할 수 있어 복잡한 형태의 구분자도 처리 가능
    Scanner useDelimiter(Pattern pattern)
    Scanner useDelimiter(String pattern)
```
> 사용

```java
	//JDK1.5이전
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    String input = br.readLine();
    
    //JDK1.5이후(java.util.Scanner)
    Scanner s = new Scanner(System.in);
    String input = s.nextLine();
    
    //JDK1.6이후(java.io.console) - 이크립스에 동작하지 않는다.
    Console console = System.console();
    String input = console.readLine();
```
* 입력 값에 맞게 nextInt()와 같은 메서드를 사용하면 입력받은 문자를 다시 변환하지 않아도 된다.
```java
	boolean nexBoolean()
    byte nextByte()
    short nextShort()
    int nextInt()
    long nextLong()
    double nextDouble()
    float nextFloat()
    String nextLine()
```
* [[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/ScannerEx1.java)
* [[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/ScannerEx2.java)
* [[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/ScannerEx3.java)


# java.util.StringTokenizerClass
* 긴 문자열을 지정된 구분자(delimiter)를 기준으로 토큰(token)이라는 여러 개의 문자열로 잘라내는 데 사용
* 구분자로 단 하나의 문자 밖에 사용하지 못한다. 따라서 복잡한 형태의 구분자는 아래 두 가지를 이용
* 이 외에도 String의 split(String regex)이나 Scanner의 useDelimiter(String patter)를 사용할 수 있다
* 위 두 가지는 정규식을 알아야 한다.

1 StringTokenizer의 생성자와 메서드
생성자 / 메서드 | 설명
------------ | -------------
StringTokenizer(String str, String delim) | 문자열(str)을 지정된 구분자(delim)로 나누는 StringTokenizer를 생성한다.(구분자는 토큰으로 간주되지 않음
StringTokenizer(String str, String delim, boolean returnDelims) | 문자열(str)을 지정된 구분자(delim)로 나누는 인스턴스 생성, returnDelims의 값을 true로 하면 구분자도 토큰으로 간주
int countTokens() | 전체 토큰의 수를 반환
boolean hasMoreTokens() | 토큰이 남아있는지 알려준다.
Stirng nextToken() | 다음 토큰을 반환한다.
* [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/StringTokenizerEx1.java)


* StringTokenizer st = new StringTokenizer(str, "+-*/=()",true);
> "+-*/=()" 전체가 하나의 구분자가 아니라 각각의 문자가 모두 구분자이다.
> * [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/StringTokenizerEx2.java)

* StringTokenizer() vs Split()
   - split()은 빈 문자열도 토큰으로 인식
   - StirngTokenizer()는 빈 문자열을 코튼으로 인식하지 않는다.
   - 성능은 StringTokenizer가 좋다.
   - split()은 데이터를 토큰으로 잘라낸 결과를 배열에 담아 받환하고
   - StringTokenize()은 바로바로 잘라서 반환하기 때문

> * [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/StringTokenizerEx5.java)

# java.math.BigIntegerClass

* long으로도 표현할 수 없을 때 사용하는 클래스, 불변(immutable), 2의 부수 형태
```java
	final int signnum; // 부호. 1(양수), 0, -1(음수) 셋 중의 하나
    final int[] msg; // 값(magnitude)
```
1 BigInteger의 생성
```java
	BigInteger val;
    val = new BigInteger("12345678901234567890"); //문자열로 생성
    val = new BigInteger("FFFF",16); // n진수(radix)의 문자열로 생성
    val = BigInteger.valueOf(1234567890L); // 숫자로 생성
```
2 다른 타입으로의 변환
* BigInteger를 문자열, byte배열로 변환하는 메서드
```java
	String toSTring() 		   // 문자열로 변환
    String toString(int radix) // 지정된 진법(radix)의 문자열로 변환
    byte[] toByteArray(0       // byte배열로 변환
```
* BigIntegereh Number부터 상속받은 기본형으로 변환하는 메서들을 가지고 있다.
```java
	int intValue()
    long longValue()
    float floatValue()
    double doubleValue()
```
* Exact : 변환한 결과가 변환한 타입의 범위에 속하지 않으면 ArithmeticException을 발생
```java
	byte byteVlaueExact()
    int intValueExact()
    long longValueExact()
```

3 BigInteger의 연산
```java
	BigInteger add(BigInteger val)      // 덧셈(this+val)
    BigInteger subtract(BigInteger val) // 뺄셈(this-val)
    BigInteger multiply(BigInteger val) // 곱셈(this*val)
    BigInteger divide(BigInteger val)   // 나눗셈(this/al)
    BigInteger remainder(BigInteger val)// 나머지(this&val)
    
    remainder와 mod는 둘 다 나머지를 구하는 메서드이지만, mod는 나누는 값이 음수면
    ArithmeticException을 발생
```

4 비트 연산 메서드
```java
	int bitCount()          // 2진수로 표현했을 때, 1의 개수(음수는 0의 개수)를 반환
    int bitLength()         // 2진수로 표현했을 떄, 값을 표현하는데 필요한 bit수
    boolean testBit(int n)  // 우측에서 n+1번째 비트가 1이면 true, 0이면 false
    BigInteger setBit(int n) // 우측에서 n+1번째 비트를 1로 변경
    BigInteger clearBit(int n) // 우측에서 n+1번째 비트를 0으로 변경
    BigInteger flipBit(int n)  // 우측에서 n+1번째 비트를 전환(1->0, 0->1)
    //  n의 값은 배열의 index처럼 0부터 시작하므로, 우측에서 첫 번째 비트는 n이 0이다.
```
> 사용

```java
	//BigInteger 짝수 판단
    BigInteger bi = new BigInteger("4");
    if(bi.remainder(new BigInteger("2")).equals(BigInteger.ZERO))
    ===================== 짝수는 제일 오른쪽 비트가 0이므로...
    if(!bi.testBit(0)   // if(bi.testBit(0) == false)
    
```

# java.math.BigDecimalClass
* 정수(BigDecimal)를 이용해서 실수를 표현( 정수 * 10의 -scale , 불변
* scale은 0부터 Integer.MAX_VALUE사이의 값
```java
	private final BigInteger intVal; // 정수
    private final int scale;         // 지수(scale)
    priavate transient precision;    // 정수의 자릿수(정밀도)
```
> 사용

```java
	BigDecimal val = new BigDecimal("123.45");  // 12345 * 10 의 -2 승
    val.unscaledValue()                         // 12345
    val.scale()                                 //  2
    val.precision()                             //  5
   ```
1 BigDecimal의 생성
```java
BigDecimal val;
	val = new BigDecimal("123.4567890"); // 문자열로 생성
    val = new BigDecimal(123.456); // double타입의 리터럴로 생성
    val = new BigDecimal(123456);  // int, long타입의 리터럴로 생성
    val = BigDecimal.valueOf(123.456)  // 생성사 대신 valueOf(double) 사용
    val = BigDecimal.valueOf(123456)   // 생성자 대신 valueOf(int)    사용
    
    ===============double타입 주의
    new BigDecimal(0.1)   // 0.10000000000000005555511111
    new bigDecimal("0.1") // 0.1
```

2 다른 타입으로의 변환
* 문자열로 변환
```java
	String toPlainString()   // 어떤 경우에도 다른 기호없이 숫자로만 표현
    String toString()        // 필요하면 지수형태로 표현할 수도 있음
    
    ====  1.0e-22
    BigDecimal val = new BigDecimal(1.0e-22);
    val.toPlainString()  // 0.0000000000000000000000000010.....
    val.toString()       // 1.0000000000000045....5E-22
```
* BigIntegereh Number부터 상속받은 기본형으로 변환하는 메서들을 가지고 있다.
```java
	int intValue()
    long longValue()
    float floatValue()
    double doubleValue()
```
* Exact : 변환한 결과가 변환한 타입의 범위에 속하지 않으면 ArithmeticException을 발생
```java
	byte byteVlaueExact()
    short shortValueExact()
    int intValueExact()
    long longValueExact()
    BigInteger toBigIntegerExact()
```

3 BigDecimal의 연산
```java
	BigDecimal add(BigInteger val)      // 덧셈(this+val)
    BigDecimal subtract(BigInteger val) // 뺄셈(this-val)
    BigDecimal multiply(BigInteger val) // 곱셈(this*val)
    BigDecimal divide(BigInteger val)   // 나눗셈(this/al)
    BigDecimal remainder(BigInteger val)// 나머지(this&val)
    
   // 새로운 인스턴스 반환
```
> 사용

```java
												value, scale, precision
	BigDecimal bd1 = new BigDecimal("123.456"); 123456   3      6
    BigDecimal bd2 = new BigDecimal("1.0");       10     1      2
    BigDecimal bd2 = bd1.multiply(bd2);        1234560   4      7
    
    //곱셈에서는 두 피연산자의 scale을 더하고, 나눗셈에서는 뺀다.
    //덧셈과 뺄셈에서는 둘 중 에서 자리수가 높은 쪽으로 맞추기 위해서 두 scale중에서 큰 쪽이 결과가 된다.
```

4 반올림 모드 - divide()와 setScale()
```java
	BigDecimal divede(BigDecimal, divisor)
    BigDecimal divede(BigDecimal, divisor, int roundingMode)
	BigDecimal divede(BigDecimal, divisor, RoundingMode roundingMode)
	BigDecimal divede(BigDecimal, divisor. int scale, int roundingMode)
	BigDecimal divede(BigDecimal, divisor, int scale, RoundingMode roundingMode)
    BigDecimal divede(BigDecimal, divisor, MathContext mc)
```
* roundingMode는 반올림 처리방법에 대한 것
* ROUND_ 로 시작하는 상수들 중에 하는 선택해서 사용
* RoundingMode는 이 상수들을 열거형으로 정의한 것. 가능하면 열거형 이용

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

> 사용

```java
	BigDecimal bigd = new BigDecimal("1.0");
    BigDecimal bigd2 = new BigDecimal("3.0");
    
    bigd.divide(bigd2)  // ArithmeticException 발생 0.333... 무한소수
    bigd.divide(bigd2,3,RoundingMode.HALF_UP)  // 0.333  소수점4째짜리에서 반올림하는듯?

```

5 java.math.MathContext

* 반올림 모드와 정밀도(precision)을 하나로 묶어놓은 메서드
* 주의할 점은 divide()에서는 scale이 소수점 이하의 자리수를 의미
* MathContext에서는 precision이 정수와 소수점이하를 모두 포함한 자리수를 의미
    ```java
    	BigDecimal bd1 = new BigDecimal("123.456");
        BigDecimal bd2 = new BigDecimal("1.0");
        
        bd1.divide(bd,2,HALS_UP); // 123.46
        bd1.divide(bd2, new MathContext(2, HALF_UP)) // 1.2E+2
    ```
    * scale이 2이면 나눗셈의 결과가 소수점 두 자리까지 출력
6 scale의 변경
* BigDecimal을 10으로 곱하거나 나누는 대신 scale의 값을 변경함으로써 같은 결과를 얻을 수 있다.
```java
	BigDecimal setScale(int newScale)
    BigDecimal setScale(int newScale, int roundingMode)
	BigDecimal setScale(int newScale, RoundingMode mode)
```
* [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch9/BigDecimalEx.java)
