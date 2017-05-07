> 출처 : 자바의 정석

# Java.util.ScannerClass
* 화면, 파일, 문자열과 같은 입력소스로부터 문자데이터를 읽어오는 것
```java
    Scanner(String source)
    Scanner(File source)
    Scanner(InputStream source)
    Scanner(Readalbe source)
    Scanner(ReadableByteChannel source)
    Scanner(Path source) // JDK1.7부터 추가
    
    // 정규식 표현을 이용한 라인단위의 검색을 지원하며
    // 구분자(delimiter)에도 정규식 표현을 사용할 수 있어 복잡한 형태의 구분자도 처리 가능
    Scanner useDelimiter(Pattern patter)
    Scanner useDelimiter(String pattern)
```

* 입력받는 것
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

* 아래 메소드를 사용하면 입력받은 데이터를 다시 변환하지 않아도 된다.
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
