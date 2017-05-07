# Java Exception
### 1.1 에러의 종류
* 컴파일 에러 : 컴파일 시에 발생하는 에러
* 런타임 에러 : 실행 시에 발생하는 에러
* 논리적 에러 : 실행은 되지만 의도와 다르게 동작하는 것

### 1.2 런타임에러 : 에러와 예외
* 에러는 어쩔 수 없지만, 예외는 처리해야 한다.
* 에러 : 프로그램 코드에 의해서 수습될 수 없는 심각한 오류
* 예외 : 프로그램 코드에 의해서 수습될 수 있는 다소 미약한 오류

### 1.3 예외처리의 정의와 목적
* 정의 : 프로그램 실행 시 발생할 수 있는 예외의 발생에 대비한 코드를 작성하는 것
* 목적 : 프로그램의 비정상 종료를 막고, 정상적인 실행상태를 유지하는 것


### 1.4 예외 클래스의 계층구조
![예외 클래스의 계층구조](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaException.PNG)

* RuntimeException클래스들 : 프로그래머의 실수로 발생한느 예외 ( unchecked : 예외처리 선택 )
* Exception클래스들 : 사용자의 실수와 같은 외적인 요인에 발생하는 예외 ( checked : 예외처리 필수 )

### 1.5 에외처리 구문 : try - catch
```java
	try{
    	// 예외가 발생할 가능성이 있는 문장들을 넣는다.
    } catch ( Exception1 e1 ) {
    	// Exception1이 발생했을 경우, 이를 처리하기 위한 문장을 적는다.
    } catch ( Exception2 e2 {
    	// Exception2이 발생했을 경우, 이를 처리하기 위한 문장을 적는다.
    } 
    
    ....
    catch ( ExceptionN eN){	
       // ExceptionN이 발생했을 경우, 이를 처리하기 위한 문장을 적는다.
	}
```
* if문과 달리 try블럭이나 catch블럭 내에 포함딘 문장이 하나라고 해서 괄호{} 를 생략할 수 없다.

### 1.6 try-catch문에서의 흐름
* try블럭 내에서 예외가 발생한 경우
   - 발생한 예외와 일치하는 catch블럭이 있는지 확인한다.
   - 일치하는 catch블럭을 찾게 되면, 그 catch블럭 내의 문장들을 수행하고 전체 try-catch문을 빠져나가서 그 다음 문장을 계속해서 수행한다. catch블럭을 찾지 못하면, 예외는 처리 되지 못한다.
* try블럭 내에서 예외가 발생하지 않은 경우
    - catch블럭을 거치지 않고 전체 try-catch문을 빠져나가서 수행을 계속한다.

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx4.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx5.java)

### 1.7 예외의 발생과 catch블럭
* try블럭에서 예외가 발생하면, 발생한 예외를 처리할 catch블럭을 찾는다.
* 첫번째 catch블럭부터 순서대로 찾아내려가며, 일치하는 catch블럭이 없으면 예외는 처리되지 않는다.
* 예외의 최고 조상인 Eception을 처리하는 catch블럭은 모든 종류의 예외를 처리할 수 있다.(반드시 마지막 catch블럭)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx6.java)
[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx7.java)

* 발생한 예외 객체를 catch블럭의 참조변수로 접근 가능
	- printStackTrace() : 예외발생 당시의 호출스택에 있었던 메서드의 정보와 예외 메시지를 화면에 출력
	- getMessage() : 발생한 예외클래스의 인스턴스에 저장된 메시지를 얻을 수 있다
[[관련소스5]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx8.java)

* 멀티 catch블럭
   - JDK1.7부터 여러 catch블럭을 '|'를 이용해서, 하나의 catch블럭으로 합칠  수 있게 됐다.
 ```java
 	try{
    	...
        } catch ( ExceptionA e) {
        } catch ( ExceptionB e) {
        }
        
        try{
        	...
        } catch ( ExceptionA | ExceptionB  e){
        }
        
        '|'는 논리연산자가 아니라 기호이다.
        
        '|'로 연결된 예외 클르스들이 조상과 자손의 관계이 있다면 컴파일 에러
        try{
        ...
        } catch (ParentException | ChildExceptoin e) {
        	e.printStackTrace();
        }
        두 예외가 상속관계에 있다면 그냥 조상클래스만 써주는 것과 똑같다.
        
       catch하나의 여러 예외를 처리하기 때문에 실제로 어떤 예외가 발생한 것인지 알 수 없다.
       그래서 참조변서 e로 멀티 catch블럭에 '|'기호로 연결된 예외 클래스들의 공통 문보인 조상 예외
       클래스에 선언된 멤버만 사용가능
       
       try{
       ...
       } catch (ExceptionA | ExceptionB e) {
       	e.methodA(); // 에러. ExceptionA에 선언한 methodA()는 호출불가
        if( e instanceof ExceptionA){
        	ExceptionA e1 = (ExceptionA)e;
            e1.methodA(); 
         } else {
        	...
         } 
         e.printStackTrace();
     }     
 ```
 
 ### 1.8 예외 발생시키기
 ```java
   // 먼저, 연산자 new를 이용해서 발생시키려는 예외 클래스의 객체를 만든 다음
 	Exception e = new Exception("고의로 발생");
    
    // 키워드 throw를 이용해서 예외를 발생시킨다.
    throw e;
    
    // throw new Exception("고의로 발생");
 ```
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx9.java)
  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx10.java)
   [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx11.java)
   
### 1.9 메서드에 예외 선언하기
* 예외를 처리하는 또 다른 방법
* 사실은 예외를 처리하는 거이 아니라, 호출한 메서드로 전달해 주는 것
* 호출한 메서드에서 예외처리를 해야만 할 때 사용
```java
	void method() throws Excepton1, Exception2, ..., ExceptionN{
    	메서드 내용
    }
    
    RuntimeException과 그 자손들을 적지 않아도 된다.
```
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx12.java
 
 * 예외가 발생했을 때, 모드 3개의 메서드(main, method1, method2)가 호출스택에 있었으며
 * 에외가 발생한 곳은 제일 윗줄에 있는 method2()라는 것
 * main메서드가 method1()를, 그리고 method1()은 method2()를 호출
 
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx13.java
  [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx14.java
   [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx15.java
    [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx16.java
    
### 1.10 finally블럭
* 예외의 발생여부와 관계없이 실행돼야 하는 코드를 넣는다.
* 선택적으로 사용할 수 있으며, try-catch-fianlly의 순서로 구성된다.
* 예외 발생시, try - catch - finally의 순서로 구성
* 에외 미발생시, try - finally의 순서로 실행된다.
* try 또는 catch 블럭에서 return문을 만나도 fianlly 블럭은 수행된다.
```java
	try{
    	// 예외가 발생할 가능성이 있는 문장들을 넣는다.
    } catch ( Exception1 e1) {
    	// 예외처리를 위한 문장을 적는다.
    } finally {
    	// 예외 발생여부와 관계없이 항상 수행돼야하는 문장들을 넣는다.
        // fianlly 블럭은 try-catch문의 맨 마지막에 위치해야 한다.
        
   // try나 catch문에서 return문을 만나도 finally안에 있는 문장들은 실행된다.
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/FinallyTest2.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/FinallyTest3.java)

### 1.11 자동 자원 반환 : try - with - resources문
* JDK1.7부터 추가
* try - with - resources문의 괄호()안에 객체를 생성하는 문장을 넣으면, 이 객체는 따로 close()를 호출하지 않아도 try블럭을 벗어나는 순간 자동적으로 close()가 호출된다. 그 다음에 catch블럭 또는 finally블럭이 수행된다.
* try블럭의 괄호()안에 변수를 선언하는 것도 가능, 선언된 변수는 try블럭 내에서만 사용가능
```java
	try(fis = new FilseInputStream("score.dat");
    	dis = new DataInputStream(fis)){
        	...
    } catch (Exception e) {
    } finaly {
    	...
    }
    
  //  위와 같이 try - with - resources문에 의해 자동적으로 close()가 호출될 수 있으려면, 
  // 클래스가 AutoCloseable이라는 인터페이스를 구현한 것이어야만 한다.
	public interface AutoCloseable{
    	void close() throws Exception;
     }       
```

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/TryWithResourceEX.java)

### 1.12 사용자정의 예외 만들기
* 기존의 예외 클래스를 상속받아서 새로운 예외 클래스를 정의할 수 있다.
```java
	class MyException extends Exception {
    	MyExcepton(String msg) {
        	super(msg);
         }
   }
```

* 에러코드를 저장할 수 있게 ERR_CODE와  getErrCode()를 멤버로 추가
```java
	class MyException extends Exception {
    	// 에러 코드 값을 저장하기 위한 필드를 추가 했다.
        private final it ERR_CODE;
        
        MyException(String msg, int errCode) {
        	super(msg);
            ERR_CODE = errCode;
        }
        
        MyException(String msg){
        	this(msg,100);
        }
        
        public int getErrCode(){
        	return ERR_CODE;
          }
      }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/NewExceptionTest.java)

### 1.13 예외 되던지기 (exception re-throwing)
* 예외를 처리한 후에 다시 예외를 생성해서 호출한 메서드로 전달하는 것
* 예외가 발생한 메서드와 호출한 메서드, 양쪽에서 예외를 처리해야 하는 경우에 사용
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ExceptionEx17.java)

* 반환값이 있는 return문의 경우, catch블럭에도 return문이 있어야 한다.
```java
	method(){
    	try{
        	...
            return 0;
         } catch (Exception e){
         	...
            return 1;
         }
   }
         
         // 예외 되던지기를 호출해서 호출한 ㅁ메서드로 예외를 전달하면, return문이 없어도 된다.
         // finally블럭 내에도 return문을 사용할 수 있으며, try블럭이나 catch블럭의 return문 다음에 수행된다. 
         // 최종적으로 finally블럭 내의 return문의 값이 반환
      method(){
    	try{
        	...
            return 0;
         } catch (Exception e){
         	...
          // return 1;
          throw new Exception(); // return문 대신 예욀르 호출한 메서드로 전달.
         }
   }
```

### 1.14 연결된 예외(chained exception)
* 한 예외가 다른 예외를 발생시키는 것.
* 예외 A가 예외B를 발생시켰다면 A를 B의 원인예외(cause exception)이라고 한다.
```java
	try {
    	startInstall();
        copyFiles();
    } catch ( SpaceException e) {
    	InstallException ie = new InstallException("설치중 예외발생");
        ie.initCause(e);
        throw ie;
     } catch(MemoryException me){
     ...
     }
```
* 여러가지 예외를 하나의 큰 분류의 예외로 묶어서 다루기 위해서 상속대신에 사용.
* 상속은을 하면 실제로 발생한 예외가 어떤 것인지 알 수 없고 기에 있던 Exception들의 상속관계도 변경해야 해서 번거롭다.
```java
	try{
    	...
    } catch (InstallException e){
        	...
     }
```

* 또한 checked예외를 uncheckd예외로 바꿀 수 있도록하기 위함
```java
	static void startInstall() throws SpaceException, MemoryException{
    	if(!enoughSpace()){
        	throw new SpaceException("설치할 공간이 부족");
        if(!enoughMemory()){
        	throw new MemoryException("메모리가 부족합니다.);
            
            --------------
	static void startInstall() throws SpaceException{
    	if(!enoughSpace()){
        	throw new SpaceException("설치할 공간이 부족");
        if(!enoughMemory()){
        	throw new RuntimeException(new MemoryException("설치할 공간이 부족"));
       }
    }
    
    RuntimeException(Throwable cause) // 원인 예외를 등록하는 생성자
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch8_exception/ChainedExceptionEx.java)
