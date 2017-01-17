# 예외처리
1 프로그램오류
 * 컴파일에러 : 컴파일할 때 발생하는 에러
 * 런타임에러 : 실행할 때 발생하는 에러
 	- 에러 : 프로그램 코드에 의해서 수습될 수 없는 심각한 오류
 	- 예외 : 프로그램 코드에 의해서 수습될 수 있는 다소 미약한 오류
  
2 예외처리의 정의와 목적
* 정의 : 프로그램 실행 시 발생할 수 있는 예외의 발생에 대비한 코드를 작성하는 것
* 목적 : 프로그램의 비정상 종료를 막고, 정상적인 실행상태를 유지하는 것

3 예외처리 구문 : try - catch
```java
	try{
    	예외가 발생할 가능성이 있는 문장을 넣는다.
       } catch(Exception e){
       	  Exception이 발생할 경우, 이를 처리하기 위한 문장을 적는다.
       }
       // if문과 달리 try블럭이나 catch블럭 내에 포함된 문장이 하나라고 해서 '{}'를 생략할 수는 없다.
```

4 try-catch문에서의 흐름
 * try블럭 내에서 예외가 발생하는 경우.
    1. 발생한 예외와 일치하는 catch블럭이 있는지 확인한다.
    2. 일치하는 catch블럭을 찾게 되면, 그 catch블럭 내의 문장들을 수행하고 전체 try-catch문을 빠져나가서 그 다음 문장을 계속해서 수행한다. 만일 일치하는 catch블럭을 찾기 못하면, 예외는 처리 되지 못한다.

 * try블럭 내에서 예외가 발생하지 않는 경우.
    1.catch블럭을 거치지 않고 전체 try-catch문을 빠져나가서 수행을 계속한다.
>[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/ExceptionEx4.java)[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/ExceptionEx5.java)

5 예외 발생시키기 
* 먼저 연사자 new를 이용해서 발생시키려는 예외 클래스의 객체를 만든 다음
* ```javaException e = new Exception("고의로 발생시켰음");```
*   키워드 throw를 이용해서 예외를 발생시킨다. 
*  ```throw e;```
*  ```java throw new Exception("고의로 발생시켰음");```

6 에외 클래스의 계층구조
* RuntimeException클래스들 : 프로그래머의 실수로 발생하는 예외 : 예외처리 선택
* Exception클래스들 : 사용자의 실수와 같은 외적인 요인에 의해 발생하는 예외 : 예외처리 필수
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/JavaException.PNG)

7 예외의 발생과 catch블럭
* try블럭에서 예외가 발생하면, 발생한 예외를 처리할 catch블럭을 찾는다.
* 첫번째 catch블럭부터 순서대로 찾아 내려가며, 일치하는 catch블럭이 없으면 예외는 처리 되지 않는다.
* 예외의 최고 조상인 Exception을 처리하는 catch블럭은 모든 종류의 예외를 처리할 수 있다. 그러므로 반드시 마지막 catch블럭에 선언해야 한다.
* 발생한 예외 객체를 catch 블럭의 참조변수로 접근할 수 있다
* printStackTrace() : 예외발생 당시의 호출스택(Call Statck)에 있었던 메섣의 정보와 예외 메시지를 화면에 출력
* getMessage() : 발생한 예외클래스의 인스턴스에 저장된 메시지를 얻을 수 있다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/ExceptionEx8.java)

8 finally블럭
 * 예외의 발생여부와 관계없이 실행되어야 하는 코드를 넣는다.
 * 선택적으로 사용할 수 있으며, try-catch-finall의 순서로 구성
 * 예외 발생시, try-catch-finall의 순서로 실행되고
 * 예외 미발생시, try-finall의 순서로 실행
 * try 또는 catch블럭에서 return문을 만나도 finally블럭은 수행된다
 ```java
 	try{
    	예외가 발생할 가능성이 있는 문장
     } catch(Exception e){
     	예외처리를 위한 문장
     } finally{
     	예외의 발생여부에 관계없이 항상 수행되어야 하는 문장
        finally블럭은 try-catch문의 맨 마지막에 위치해야한다.
     }
 ```
 [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/FinallyTest.java)
 
 
 
 
9 메서드에 예외 선언하기
 * 예외를 처리하는 또 다른 방법
 * 사실은 예외를 처리하는 것이 아니라, 호출한 메서드로 전달해 주는 것
 * 호출한 메서드에서 예외처리를 해야만 할 때 사용
 
 ```java
 	void method() throws Exceptio1, Exception2, ...ExceptionN{
    		메서드 내용
        }
 ```
 
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/ExceptionEx14.java)

10 자동자원반환 try-with-resources
* 자동 close()
* 이 구문은 주로 IO와 관뢴된 클ㄹ래스를 사용할 때 유용
```java
	try{
     	fis = new FileInputStream("score.dat");
        dis = new DataInputStream(fis);
     }catch(IOException ie){
     	ie.printStackTrace();
     }finally{
     	try{
        	if(dis!=null)
            	dis.close();
        }catch(IOException ie){
        	ie.printStackTrace();
        }
 }
```
>  try-with-resources 사용

```java
	try(fis = new FileInputStream("score.dat");
        dis = new DataInputStream(fis))  
        // 괄호()안에 두 문자 이상 넣은 경우 ';'로 구분
        // 괄호()안에 변수도 선언 가능, 선언된 변수는 tryt블럭 내에서만 사용가능
     {
     	 while(true){
         	score = dis.readInt();
            System.out.println(score);
            sum+=score;
         }

     }catch(EOFException ie){
            System.out.println("점수의 총합은 "+sum+"입니다.);
     }catch(IOException ie){
     	ie.printStackTrace();
 }
```
> try-with-resources문에 의 해 자동으로 객체의 close()가 호출될 수 있으려면, 클래스가 AutoCloseable이라는 인터페이스를 구현해야만 한다.

```java
	public interface AutoCloseable{
    	void close() throws Exception;
   }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/TryWithResourceEx.java)


11 예외 되던지기
* 예외를 처리한 후에 다시 예외를 생성해서 호출한 메서드로 전달하는 것
* 예외가 발생한 메서드와 호출한 메서드, 양쪽에서 예외를 처리해야하는 경우에 사용
* [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/Exception_re_throwing.java)
* 메서드에 반환값이 있는 경우 try, catch, finally에도 return문이 있어야하고 최종적으로 finally 블럭 내의 return문이 값이 반환
* return문 대신 예외를 호출한 메서드로 전달 가능.

12 사용자정의 예외 만들기
* 기존의 예외 클래스를 상속받아서 새로운 예외 클래스를 정의할 수 있다.
```java
	class MyException extends Exception{
    	MyExceptin(String msg){  
        	super(msg);   // 조상인 Exception클래스의 생성자를 호출한다.
            }
     }
```
* 에러코드를 저장할 수 있게 ERR_CODE와 getErrCode()를 멤버로 추가
```java
	class MyException extends Exception{
    private final int ERR_CODE;
    
    	MyExceptin(String msg){  
        	super(msg,100);   // 조상인 Exception클래스의 생성자를 호출한다.
            }
        MyExceptin(String msg, int errCode){  
        	super(msg);   // 조상인 Exception클래스의 생성자를 호출한다.
            ERR_CODE = errcode;
            }
         public int getErrCode(){
         	return ERR_CODE;
          }
     }
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/UserDefindeException.java)

13 연결된 예외(chained exception)
* 한 예외가 다른 예외를 발생시킬 수도 있다. 예를 들어 예외 A가 예외 B를 발생시켰다면, A를 B의 '원인 예외'라고 한다. 즉 연결된 것이다.

```java
	try{
    	startInstall();
        copyFiles();
    }catch(SpaceException e)
    	InstallException ie = new InstallException("설치중 예외발생");
        ie.initCause(e); // InstallException의 원인 예외를 SpaceException으로 지정
        throw ie; // InstallException을 발생
    }
```
> [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch8/ChainedException.java)
