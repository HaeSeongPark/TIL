> 출처 : 자바의 정석

# Java IO 4. 문자기반 스트림
## 1. Reader와 Writer
* Reader(문자기반 입력스트림의 최고조상)의 메서드
![Reader(문자기반 입력스트림의 최고조상)의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Reader(%EB%AC%B8%EC%9E%90%EA%B8%B0%EB%B0%98%20%EC%9E%85%EB%A0%A5%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EC%B5%9C%EA%B3%A0%EC%A1%B0%EC%83%81)%EC%9D%98%20%EB%A9%94%EC%84%9C%EB%93%9C.png)
* Writer(문자기반 출력스트림의 최고 조상)의 메서드
![Writer(문자기반 출력스트림의 최고 조상)의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Writer(%EB%AC%B8%EC%9E%90%EA%B8%B0%EB%B0%98%20%EC%B6%9C%EB%A0%A5%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EC%B5%9C%EA%B3%A0%20%EC%A1%B0%EC%83%81).png)

## 2. FileReader와 FileWriter
* 문자기반의 파일 입출력. 텍스트 파일의 입출력에 사용
* FileInputStream/OutputStream과 다르지 않다.

[[FileReaderEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileReaderEx1.java)
[[FileConversion]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileConversion.java)

## 3. PipedReader와 PipedWriter
* 프로세스(쓰레드)간의 통신(데이터를 주고 받음)에 사용
* 다른 스트림과 달리 입출력스트림을 하나의 스트림으로 데이터 주고 받음
* 스트림을 생성한 다음에 어느 한쪽 쓰레드에서 connect()를 호출해서 입력스트림과 출력스트림연결
* 입출력을 마친 후에는 어느 한쪽 스트림만 닫아도 나머지 스트림은 자동으로 닫힌다.

[[PipedReaderWriter]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/PipedReaderWriter.java)

## 4. StringReader와 StringWriter
* CharArrayReader, CharArrayWriter처럼 메모리 입출력에 사용
* StringWriter에 출력되는 데이터는 내부의 StringBuffer에 저장
```java
	StringBuffer getbuffer() : StringWriter에 출력한 데이터가 저장된 StringBuffer를 반환
    String toString() : StringWriter에 출력된(StringBuffer에 저장된) 문자열을 반환
```
[[StringReaderWriterEx]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/StringReaderWriterEx.java)


# Java IO 5. 문자기반 보조스트림
## 1. BufferedReader와 BufferedWriter
* 입출력 효율을 높이기 위해 버퍼(char[])를 사용하는 보조스트림
* line단위의 입출력이 편리하다.
```java
	String readLine() : 한 라인을 읽어온다. (BufferedReader의 메서드)
    void newLine() : '라인 구분자(개행문자)'를 출력(BufferdWriter의 메서드)
```
[[BufferedReaderEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/BufferedReaderEx1.java)

## 2. InputStreamReader와 OutputStreamWriter
* 바이트기반스트림을 문자기반스트림처럼 쓸 수 있게 해준다.
* 인코딩(encodirng)을 변환하여 입출력할 수 있게 해준다.

![[InputStreamReader OutputStreamWriter의 생성자와 메서드]](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/InputStreamReader%20OutputStreamWriter%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

* 콘솔(console, 화면)로부터 라인단위로 입력받기
```java
	InputStreamReader isr = new InputStreamReader(System.in);
    BufferedReader br = new BufferedReader(isr);
    String line = br.readLine;
```
* 인코딩 변환하기
```java
	FileInputStream fis = new FileInputStream("korean.txt");
    InputStreamReader isr = new InputStreamReader(fis, "KSC5601");
```
* 시스템 속성에서 sun.jnu.encoding의 값을 보면 OS에서 사용하는 인코딩의 종류를 알 수 있다.
```java
	Properties prop = System.getProperties();
    System.out.println(prop.get("sun.jnu.encoding"));
```
[[InputStreamReaderEx]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/InputStreamReaderEx.java)
