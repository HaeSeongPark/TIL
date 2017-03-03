> 출처 : 자바의 정석

# Java IO 6. 표준입출력과 File
## 1. 표준입출력 : System.in, System.out, System.err
* console화면을 통한 데이터의 입출력을 '표준 입출력'이라 한다.
* JVM이 시작되면서 자동적으로 생성되는 스트림
```java
	System.in : 콘솔로부터 데이터를 입력받는데 사용
    System.err : 콘솔로 데이터를 출력하는데 사용
    System.out : 콘솔로 데이터를 출력하는데 사용
	-------
    
    public final class System{
    	public final static InputStream in = nullInputStream();
        public final static PrintStream out = nullPrintstream();
        public final static PrintStream err - nullPrintStream();
```
[[StandardIOEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/StandardIOEx1.java)

## 2. 표준입출력의 대상변경 : setOut(), setErr(), setInt()
* 콘솔 이외에 다른 입출력 대상으로 변경하는 것

메서드	| 설명
------------ | -------------
static void setOut(PrintStream out) | System.out의 출력을 지정된 PrintStream으로 변경
static void setErr(PrintStream err) | System.err의 출력을 지정한 PrintStream으로 변경
static void setInt(InputStream in) | System.in의 입력을 지정한 InputStream으로 변경

[[StandardIOEx2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/StandardIOEx2.java)

[[StandardIOEx3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/StandardIOEx3.java)

## 3. RandomAccessFile
* 하나의 스트림으로 파일에 입력과 출력을 모두 수행할 수 있는 스트림
* 다른 스트림들과 달리 Object의 자손이다.
* RandomAccessFile의 상속계층

![RandomAccessFile의 상속계층도.PNG](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/RandomAccessFile%EC%9D%98%20%EC%83%81%EC%86%8D%EA%B3%84%EC%B8%B5%EB%8F%84.PNG)
* RandomAccessFile의 생성자와 메서드

![RandomAccessFile의 생성자와 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/RandomAccessFile%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

[[RandomAceessFileEx1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/RandomAccessFileEx1.java)
[[RandomAceessFileEx2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/RandomAccessFileEx2.java)
[[RandomAceessFileEx3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/RandomAccessFileEx3.java)

## 4. File
* 파일과 디렉토리를 다루는데 사용되는 클래스
* File의 생성자와 경로와 관련된 메서드

![File의 생성자와 경로와 관련된 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/File%EC%9D%98%20%EC%83%9D%EC%84%B1%EC%9E%90%EC%99%80%20%EA%B2%BD%EB%A1%9C%EC%99%80%20%EA%B4%80%EB%A0%A8%EB%90%9C%20%EB%A9%94%EC%84%9C%EB%93%9C.png)
* 경로와 관련된 File의 멤버변수

![경로와 관련된 File의 멤버변수](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EA%B2%BD%EB%A1%9C%EC%99%80%20%EA%B4%80%EB%A0%A8%EB%90%9C%20File%EC%9D%98%20%EB%A9%A4%EB%B2%84%EB%A9%B4%EC%88%98.png)

[[FileEx1.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx1.java)

* File의 메서드

![File의 메서드.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/File%EC%9D%98%20%EB%A9%94%EC%84%9C%EB%93%9C.png)

[[FileEx2.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx2.java)
[[FileEx3.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx3.java)
[[FileEx4.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx4.java)
[[FileEx5.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx5.java)
[[FileEx6.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx6.java)
[[FileEx7.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx7.java)
[[FileEx8.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx8.java)
[[FileEx9.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileEx9.java)
[[FileSplit.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileSplit.java)
[[FileMerger.java]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch15/FileMerge.java)


