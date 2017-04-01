> 출처 : 자바의 정석

# Java IO
## 1.  IO와 Stream
* 입출력이란
   - 두 대상 간의 데이터를 주고 받는 것
* 스트림이란
   - 데이터를 운반(입출력)하는데 사용되는 연결통로
   - 연속적인 데이터의 흐름을 물(stream)에 비유해서 붙여진이름
   - 하나의 스트림으로 입출력을 동시에 수행할 수 없다.(단반향 통신)
   - 입출력을 동시에 수행하려면, 2개의 스트림이 필요
   - 당연하지만, java8.0의 Stream과는 다름
## 2. 바이트기반 스트림 
* InputStream, OutputStream
  - 데이터를 byte단위로 주고 받는다.
* 입력스트림과 출력스트림의 종류
   
입력스트림 | 출력스트림 | 입출력 대상의 종류
------------ | ------------- | ---------
FileInputStream | FileOutputStreaml 파일
ByteArrayInputStream |ByteArrayOutputStream | 메모리
PipedInputStream | PipedOutputStream | 프로세스
AudioInputStream | AudioOutputStream | 오디오장치

* InputStream과 OutputStream에 정의된 읽기와 쓰기를 수행하는 메서드

InputStream | OutputStream
------------ | -------------
abstract int read() | abstract void write(int b)
int read(byte[] b) | void write(byte[] b)
int read(byte[] b, int off, int len) | void write(byte[] b, int off, int len)

```java
	public abstract class InputStream{
    	...
        // 입력스트림으로 부터 1byte를 읽어서 반환. 읽을 수 없으면 -1을 반환
        abstract int read();
        
        //입력스트림으로 부터 len개의 byte를 읽어서 byte배열 b의 off위치부터 저장
        int read(byte[] b, int off, int len){
        ...
        for(int i=off; i < off +len; i++{
        	// read()를 호출해서 데이터를 읽어서 배열을 채운다.
            b[i] = (byte)read();
            }
            ...
        }
        // 입력스트림으로부터 byte배열 b의 크기만큼 데이터를 읽어서 배열 b에 저장
        int read(byte[] b){
        	return read(b, 0, b.length);
         }
         ...
         
         // abstract int read()는 반드시 구현
```
## 3. 보조스트림
* 스트림의 기능을 향상시키거나 새로운 기능을 추가하기 위해 사용
* 독립적으로 입출력을 수행할 수 없다.
* 보조스트림을 쓰고 안 쓰고 성능차이가 꽤 있다고 한다. 되도록쓰길
```java
	// 먼저 기반스트림을 생성
    FileInputStream fis = new FileInputStream("test.txt");
    
    //기반 스트림을 이용해서 보조스트림을 생성
    BufferedInputStream bis = new bufferedInputStream(fis);
    
    bis.read(); // 보조 스트림인 BufferedInputStream으로부터 데이터를 읽는다.
```
* 보조스트림의 종류
* ![Java IO 보조스트림의 종류](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20IO%20%EB%B3%B4%EC%A1%B0%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EC%A2%85%EB%A5%98.png)

## 4. 문자기반 스트림 : Reader, Writer
* 바이트기반 스트림은 1byte단위로 처리하기 때문에 2byte인 char형을 처리하기에는 어렵다.
* 이 점을 보안하기 위해 문자기반스트림이 등장.

   `InputStream` -> `Reader`   
   `OutputStream` -> `Writer`
   
   
>  바이트기반 스트림과 문자기반 스트림의 비교

![바이트기반 스트림과 문자기반 스트림의 비교](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EB%B0%94%EC%9D%B4%ED%8A%B8%EA%B8%B0%EB%B0%98%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EA%B3%BC%20%EB%AC%B8%EC%9E%90%EA%B8%B0%EB%B0%98%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9C%BC%20%EB%B9%84%EA%B5%90.png)

> 바이트기반 스트림과 문자기반 스트림의 읽고 쓰는 메서드 비교
 
![바이트기반 스트림과 문자기반 스트림의 읽고 쓰는 메서드 비교](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EB%B0%94%EC%9D%B4%ED%8A%B8%EA%B8%B0%EB%B0%98%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EA%B3%BC%20%EB%AC%B8%EC%9E%90%EA%B8%B0%EB%B0%98%20%EC%8A%A4%ED%8A%B8%EB%A6%BC%EC%9D%98%20%EC%9D%BC%EA%B3%A0%20%EC%93%B0%EB%8A%94%20%EB%A9%94%EC%84%9C%EB%93%9C%20%EB%B9%84%EA%B5%90.png)

> 바이트기반 보조스트림과 문자기반 보조스트림 비교

![바이트기반 버조스트림과 문자기반 보조스트림 비교.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/%EB%B0%94%EC%9D%B4%ED%8A%B8%EA%B8%B0%EB%B0%98%20%EB%B2%84%EC%A1%B0%EC%8A%A4%ED%8A%B8%EB%A6%BC%EA%B3%BC%20%EB%AC%B8%EC%9E%90%EA%B8%B0%EB%B0%98%20%EB%B3%B4%EC%A1%B0%EC%8A%A4%ED%8A%B8%EB%A6%BC%20%EB%B9%84%EA%B5%90.png)

## 5. 문자기반의 보조스트림
## 6. 표준입출력과 File
## 7. 직렬화(Serialization)
