> 출처 : 자바의 정석

# Java IO 2. 바이트기반 스트림
## 1.InputStream과 OutputStream
* InputStream과 OutputStream은 모든 바이트기반의 스트림의 조상
> InputStream의 메서드

![InputStream의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/InputStream%EC%9D%98%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

> OutputStream의 메서드

![OutputStream의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/OutputStream%EC%9D%98%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

## 2. ByteArrayInputStream과 ByteArrayOutputStream
* 바이트배열(byte[])에 데이터를 입출력하는 바이트기반 스트림
* 스트림의 종류가 달라도 읽고 쓰는 방법은 동일하므로 관련소스에 방법을 참고

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/IOEx1.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/IOEx2.java)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/IOEx3.java)

## 3. FileInputStream과 FileOutputStream
* 파일에 데이터를 입출력하는 바이트기반 스트림

![FileInputStream과 FileOutputStream의 생성자](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/FileInputStream%EA%B3%BC%20FileOutputStream%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90.png)

[[FileViewer]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileViewer.java)
[[FileCopy]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileCopy.java)

# Java IO 3.바이트기반 보조스트림
## 1. FilterInputStream과 FilterOutputStream
* 모든 바이트기반 보조스트림의 최고조상
* 보조스트림은 자체적으로 입출력을 수행할 수 없다.
```java
	protected FilterInputStream(InputStream in)
    public FilterOutputStream(OutputStream out)
```
* 상속을 통해 FilterInputStream/FilterOutputStream의 read()와 write()를 원하는 기능대로 오버라이딩해야 한다.
```java
	public class FilterInputStream extends InutStream{
    	protected volatile InputStream in;
        protected FilterInputStream(InputStream in){
        	this.in = in;
        }
        public int read() throws IOException{
        	return in.read();
         }
         ...
      }
   // FilterInputStream의 자손
      BufferedInputStream, DataInputStream, PushbackInputStream 등
   // FilterOutputStream의 자손
     Buffered OutputStream, DataInputStream, printStream 등
```

## 2. BufferedInputStream과 BufferedOutputStream
* 입출력 효율을 높이기 위해 버퍼(byte[])를 사용하는 보조스트림

![BufferedInputStream, OutputStream의 생성자](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/BufferedInputStream%2C%20OutputStream%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90.png)

* 보조스트림을 닫으면 기반스트림도 닫힌다.
```java
	public class FilterOutputStream extends OutputStream{
    	protected OutputStream out;
        public FilterOutputStream(OuutputStream out){
        	this.out = out;
       }
       ...
       public void close() throws IOException{
       		try{ flush(); } catch (IOException ignored() {}
            out.close(); // 기반 스트림의 close()를 호출한다.
          }
       }
```
[[BufferedOutputStreamEx1.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/BufferedOutputStreamEx1.java)

![15_7의실행결과](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/15_7%EC%9D%98%EC%8B%A4%ED%96%89%EA%B2%B0%EA%B3%BC.png)

## 3. DataInputStream과 DataOutputStream
* 기본형 단위로 읽고 쓰는 보조스트림
* 각 자료형의 크기가 다르므로 출력할 때와 입력할 때 순서에 주의

![DataInputStream과 OutputStream의 생성자와 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/DataInputStream%EA%B3%BC%20OutputStream%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

[[DataInputStream 관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataInputStreamEx1.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataInputStreamEx2.java)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataInputStreamEx3.java)

[[DataOutputStream 관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataOutputStreamEx1.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataOutputStreamEx2.java)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/DataOutputStreamEx3.java)

## 4. SequenceInputStream
* 여러 입력스트림을 연결해서 하나의 스트림처럼 다룰 수 있게 한다.

메서드 / 성생자 | 설명
------------ | -------------
SequenceInputStream(Enumeration e)| Enumeration에 저장된 순서대로 입력스트림을 하나의 스트림으로 연결
SequenceInputStream(InputStream s1, InputStream s2) | 두 개의 입력스트림을 하나로 연결

```java
	ex1)
    Vector files = new Vector();
    files.add(new FileInputStream("file.001"));
    files.add(new FileInputStream("file.002"));
    SequenceInputStream in = new SequenceInputStream(files.elements());
    
    ex2)
    FileInputStream file1 = new FileInputStream("file.001");
    FileInputStream file2 = new FileInputStream("file.002");
    SequenceInputStream in = new sequenceInputStream(file1, file2);
```

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/SequenceInputStreamEx.java)

## 5.PrintStream
* 데이터를 다양한 형식의 문자로 출력하는 기능을 제공하는 보조스트림
* System.out과 System.err이 PrintStream이다
* PrintStrea보다 PrintWirter를 사용할 것을 권장

![PrintStream의 생성자와 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/PrintStream%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

![정수의 출력에 사용될 수 있는 옵션](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EC%A0%95%EC%88%98%EC%9D%98%20%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%EB%90%A0%20%EC%88%98%20%EC%9E%88%EB%8A%94%20%EC%98%B5%EC%85%98.png)

![문자열의 출력에 사용될 수 있는 옵션](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EB%AC%B8%EC%9E%90%EC%97%B4%20%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%EB%90%A0%20%EC%88%98%20%EC%9E%88%EB%8A%94%20%EC%98%B5%EC%85%98.png)

![실수의 출력에 사용될 수 있는 옵션](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EC%8B%A4%EC%88%98%EC%9D%98%20%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%EB%90%A0%20%EC%88%98%20%EC%9E%88%EB%8A%94%20%EC%98%B5%EC%85%98.png)

![특수문자를 출력하는 옵션](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%ED%8A%B9%EC%88%98%EB%AC%B8%EC%9E%90%EB%A5%BC%20%EC%B6%9C%EB%A0%A5%ED%95%98%EB%8A%94%20%EC%98%B5%EC%85%98.png)

![날짜와 시간의 출력에 사용될 수 있는 옵션](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EB%82%A0%EC%A7%9C%EC%99%80%20%EC%8B%9C%EA%B0%84%EC%9D%98%20%EC%B6%9C%EB%A0%A5%EC%97%90%20%EC%82%AC%EC%9A%A9%EB%90%A0%20%EC%88%98%20%EC%9E%88%EB%8A%94%20%EC%98%B5%EC%85%98.png)
