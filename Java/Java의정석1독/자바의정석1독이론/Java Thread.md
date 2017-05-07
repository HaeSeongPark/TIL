> 출서 : 자바의 정석

# Java Thread
## 1 프로세스와 쓰레드
* 프로세스
  - 실행 중인 프로그램
  - 데이터, 메모리 등의 자원과 쓰레드로 구성돼 있다.
* 쓰레드
  - 프로세스의 자원을 이용해서 실제로 작업을 수행
  - 모든 프로세스는 최소한 하나 이상의 쓰레드가 존재
  - 둘 이상의 쓰레드를 가진 프로세스를 `멀티 프로스세`라고 한다.

### 1-1 멀티태스킹과 멀티쓰레딩
* 멀티태스킹 : 여러 개의 프로세스가 동시에 실행
* 멀티쓰레딩 : 하나의 프로세스 내에서 여러 쓰레드가 동시에 실행
* 프로세스를 생성하는 것보다 새로운 쓰레드를 생성하는 것이 더 적은 비용이 든다.
* 멀티쓰레딩의 장점
   - CPU의 사용률을 향상
   - 자원을 보다 효율적으로 사용 가능
   - 사용자에 대한 응답성이 향상
   - 작업이 분리돼 코드가 간결
* 멀티쓰레딩의 단점
   - 동기화, 교착상태, 효율적 분배 등 고려해야할 사항이 많다.

## 2 쓰레드의 구현과 실행
* 구현방법1 : Thread클래스를 상속, 쓰레드를 상속받으면 다른 다른 클래스를 상속받을 수 없다.
* 구현방법2 : Runnale인터페이스를 구현, 재사용성, 일관성을 유지할 수 있어 일반적이고 객체지향적인 방법
* 어느 방법이든 run만 구현해주면 된다.
```java
	//1. Thread클래스를 상속
    class MyThread extends Thread{
    	public void run() {/*작업내용*/} //Thread클래스의 run()을 오버라이딩
      }
   //2. Runnable인터페이스를 구현
     class MyThread implements Runnable{
         public void run() {/*작업내용*/} // Runnable인터페이스의 추상메서드 run()을 구현
    }
  /////////
  public interface Runnable{
  	public abstract void run();
   }
```
[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx1.java)
```java
	ThreadEx1_1 t1 = new ThreadEx1_1(); //Thread를 상속받은 클래스의 인스턴스를 생성
    
    Runnable r = new ThreadEx1_2();   // Runnable을 구현한 클래스의 인스턴스를 생성
    Thread t2 = new Thread(r);        // 생성자 Thread(Runnable target)
   //Thread t2 = new Thread(new ThreadEx1_2()); // 위의 2줄을 1줄로
   
```
* Thread클래스를 상속받으면, 자손 클래스에서 조상인 Thread클래스의 메서드를 직접 호출 가능
* Runnable을 구현하면 Thread클래스의 static메서드인 currentThread()호출하여 쓰레드에 대한 참조를 얻어온 후 호출 가능
```java
	static Thread currentThread() - 현재 실행중인 쓰레드의 참조를 반환
    String getName() - 쓰레드의 이름을 반환
    
    class ThreadEx1_1 extends Thread{
    	...
        System.out.println(getName());
        ...
    }
    class ThreadEx1_2 implements Runnable{
    	...
        System.out.println(Thread.currentThread().getName());
		...
     }
    
```
* Thread Name관련 생성자와 메서드
```java
	Thread(Runnable target, String name)
    Thread(String name)
    void setName(String name)
```

* 쓰레드의 실행 : start()
  - start()를 호출해야만 쓰레드가 실행된다.
  - start()를 실행하면 실행대기 상태에 있다가 자신의 차례가 돼야 실행됨.
  - 한 번 실행이 종료된 쓰레드는 다시 실행할 수 없다. start()는 단 한번만
  ```java
  	ThreadEx1_1 t1 = new ThreadEx1_1();    ThreadEx1_1 t1 = new ThreadEx1_1();
    t1.start();                            t1.start();
    t1.start(); // 예외발생                t1 = new ThreadEx1_1(); // 다시 생성
                                           t1.start(); // Ok.
  ```
  
## 3 start()와 run()
### start()와 run()의 실행과정
* run()은 단순히 클래스에 선언된 메서드를 호출
* start()는 새로운 쓰레드가 작업을 싱행하는데 필요한 호출스택을 생성한 다음에 run()을 호출해서 생성된 호출스택에 run()이 첫 번째로 올라가게 한다.
* 모든 쓰레드는 독립적인 작업을 수행하기 위해 자신만의 호출스택이 필요

![start run](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Thread%20start()%20%26%20run().png)

[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx2.java)
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx3.java)

## 4 싱글쓰레드와 멀티쓰레드
* 싱글쓰레드 : 두 개의 작업을 하나의 쓰레드로 처리하는 경우
[[싱글쓰레드]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx4.java)
* 멀티쓰레드 : 두 개의 작업을 두 개의 쓰레드로 작업하는 경우
[[멀티쓰레드]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx5.java)

* 멀티쓰레드는 작업전환 등의 추가적인 작업이 필요하다.
* 따라서 싱클 코어에서 단순히 CPU만을 사용하는 계산작업이라면 오히려 멀티쓰레드보다 싱글쓰레드로 프로그래밍하는 것이 효율적이다.
* 두 쓰레드가 서로 다른 자원을 사용하는 작업의 경우에는 멀티쓰레드가 효율적
* 예를 들면, 사용자로부터 데이터를 입력받는 작업, 네트워크로 파일 주고받는 작업 등
![java Thread single multi.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Thread%20single%20multi.png)

[[쓰레드 하나]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx6.java)
[[쓰레드 둘]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx7.java)

## 5 쓰레드의 우선순위
* 작업의 중요도에 따라 쓰레드의 우선순위를 다르게 하여 특정 쓰레드가 더 많ㅇ느 작업시간을 갖도록 할 수 있다.
* 예를 들면, 파일전송기능이 있는 메신저에서 파일다운로드를 처리하는 쓰레드보다 채팅내용을 전송하는 쓰레드의 우선순위가 더 높아야 할 때 사용
* 쓰레드의 우선순위와 관련된 메서드
```java
	void setPriority(int new Priorty) : 쓰레드의 우선순위를 지정한 값으로 변경
    int getPriority() : 쓰레드의 우선순위를 반환
    
    public static final int MAX_PRIORITY = 10 // 최대우선순위
    public static final int MIN_PRIORITY = 1 // 최소우선순위
    public static final int NORM_PRIORITY = 5 // 보통우선순위
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx8.java)

![Java Thread Priority.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Thread%20Priority.png)

## 6 Thread group
* 서로 관련된 쓰레드를 그룹으로 묶어서 다루기 위한 것
* 모든 쓰레드는 반드시 하나의 쓰레드 그룹에 포함돼 있어야 한다
* 쓰레드 그룹을 지정하지 않고 생성한 쓰레드는 'main 쓰레드 그룹'에 속한다.
* 자신을 생성한 쓰레드(조상쓰레드)의 그룹과 우선순위를 상속받는다.
* ThreadGroup의 생성자와 메서드

![java Thread ThreadGroup.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Thread%20ThreadGroup.png)

```java
	Thread(ThreadGroup group, String name)
    Thread(ThreadGroup group, Runnable target)
    Thread(ThreadGroup group, Runnable target, String name)
    Thread(ThreadGroup group, Runnable target, String name, long stackSize)
    
    ThreadGroup getTreadGroup() : 쓰레드 자신이 속한 쓰레드 그룹을 반환
    void uncaughtException(Thread t, Throwable e) : 쓰레드 그룹의 쓰레드가, 처리되지 않은 예외에 의해 실행이 종료됐을 떄, JVM에 의해 이 메서드가 자동적으로 호출
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx9.java)

## 7 데몬 쓰레드(daemon thread)
* 일반 쓰레드의 작업을 돕는 보조적인 역할
* 일반 쓰레드가 모두 종료되면 자동적으로 종료
* 가비지 컬렉터, 자동저장, 화면자동갱신 등에 사용
* 무한루프와 조건문을 이용해서 실행 수 대기하다가 특정조건이 만족되면 작업을 수행하고 다시 대기하도록 작성
```java
	boolean isDaemon() : 쓰레드가 데본 쓰레드인지 확인한다. 데몬 쓰레드이면 true를 반환
    void setDaemon(boolean on) : 쓰레드를 데몬 쓰레드로 또는 사용자 쓰레드로 변경, 매개변수 on의 값을 true로 지정하면 데몬쓰레드가 된다. / 반드시 start()를 호출하기 전에 실행돼야 함
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx10.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx11.java)


## 8 쓰레드의 실행제어(스케줄링)
* 쓰레드의 스케줄링가 관련된 메서드
 
  ![Java Thread scheduling.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Thread%20scheduling.png)
* resume(),stop(),suspend()는 쓰레드 교착상태를 만들기 쉬어서 deprecated됐다.
* 쓰레드의 상태

  ![Java Thread state.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Thread%20state.png)
    - 1 쓰레드를 생성하고 start() 호출하면 바로 실행되는 것이 아니라 실행대기열에 저장돼 자신의 차례가 될 때까지 기다려야 한다. 실행대기열을 큐와 같은 구조
    - 2 실행대기 상태에 있다가 자신의 차례가 되면 실행상태가 된다.
    -  3 주어진 실행시간이 다되거나 yield()를 만나면 다시 실행대기상태가 되고 다음 차례의 쓰레드가 실행상태가 된다.
    -  4 실행중에 suspend(), sleep(), wait(), join(), I/O block에 의해 일시정지상태가 될 수 있다. I/O block은 입출력작업에서 발생하는 지연상태를 말한다. 사용자의 입력을 기다리는 경우를 예로 들 수 있는데, 이런 경우 일시정지 상태에 있다가 사용자가 입력을 마치면 다시 실해대기상태가 된다.
    -  5 지정된 일시정지시간이 다되거나, notify(), resume(), interrupt()가 호출되면 일시정지  상태를 벗어나 다시 실행대기열에 저장돼 자신의 차례를 기다리게 된다.
    -  6 실행을 모두 마치거나 stop()이 호출되면 쓰레드는 소멸
 
### 8-1 sleep(long millis) : 일정시간동안 쓰레드를 멈추게한다.
```java
	sleep(long millis)
    sleep(long millis, int nanos)
    
    //sleep()에 의해 일시정지 상태가 된 쓰레드는 지정된 시간이 다 되거나 interrupt()가 호출되면, InterruptedException이 발생돼 잠에서 깨어나 실행대기 상태가 된다. 그래서 try-catch문으로 감싸야한다.
    try{
    	Thread.sleep(1, 500000); // 쓰레드를 0.0015초 동안 멈추게 한다.
      } catch(InterruptedException e){}
      
   void delay(long millis){
   	    try{
    	Thread.sleep(millis); // 쓰레드를 0.0015초 동안 멈추게 한다.
      } catch(InterruptedException e){}
   }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx12.java)
* sleep()이 항상 현재 실행 중인 쓰레드에 대해 작동하기 때문에 'th1.sleep(2000)'과 같이 호출했어도 실제로 영향받는 것은 main메서드를 실행하는 main쓰레드이다.
* 그래서 sleep()은 static으로 선언돼 있으며 참조변수를 이용해서 호출하기 보다는 'Thread.sleep(2000);'과 같이 해야 한다.
* yield()가 staitc으로 선언돼 있는 것도 sleep()과 같은 이유

### 8-2 interrupt()와 interrupted() : 쓰레드의 작업을 취소
```java
	void interrupt() : 쓰레드의 interrupted상태를 false에서 true로 변경
    boolean isInterrupted() 쓰레드의 interrupted상태를 반환
    static boolean interrupted() 현재 쓰레드의 interrupted상태를 알려주고, false로 초기화
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx13.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx14.java)

### 8-3 suspend(), resume(), stop()
* suspend()를 sleep()처럼 쓰레드를 멈추게 한다.
* resume()는 suspend()에 의해 정지된 쓰레드를 실행대기상태로 만든다.
* stop()은 호출되는 즉시 쓰레드가 종료된다.
* suspend()와 stop()은 교착상태를 일으키기 쉽기 때문에 deprecated됐다.
* 
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx15.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx16.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx17.java)

### 8-4 yield()
* 쓰레드 자신에게 주어진 실행시간을 다음 차례의 쓰레드에게 양보한다.
* yield()와 interrput()를 적절히 사용하면, 프로그램의 응답성을 높이고 보다 효율적인 실행이 가능
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx18.java)

### 8-5 join()
* 쓰레드 자신이 하던 작업을 잠시 멈추고 다른 쓰레드가 지정된 시간동안 작업을 수행하도록 한다.
```java
	join()
    join(long millis)
    join(long millis, int nanos)
    
    try{
    	th1.join(); // 현재 실행중인 쓰레드가 쓰레드 th1의 작업이 끝날때까지 기다린다.
      }catch(InterruptedException e) {}
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx19.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx20.java)


## 9 쓰레드의 동기화
* 한 번의 하나의 쓰레드만 개게에 접근할 수 있도록 객체에 락(lock)을 걸어서 데이터의 일관성을 유지하는 것.
### 9-1 synchronized를 이용한 동기화
```java
	1. 메서드 전체를 임계 영역을 지정
	  public synchronized void calcSum(){
      	...
      }
   2. 특정한 영역을 임계 영역을 지정
      synchronized(객체의 참조변수){
      	...
    }
    // 이 블럭영역으로 들어가면 쓰레드는 지정된 객체의 lock을 얻게 되고
    // 영역에서 벋어나면 lock을 반납
    // 획득과 반납이 자종적으로 된다.
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx21.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx22.java)

### 9-2 wait() & notify()
* 동기화의 효율을 높이기 위해 wait(), notify()를 사용
* Object클래스에 정의돼 있으며, 동기화 블록 내에서만 사용할 수 있다.
* wait() : 객체의 lock을 풀고 해당 객체의 쓰레드를 wating pool에 넣는다.
* notify() : wating pool에서 대기중인 쓰레드 중의 하나를 깨운다.
* notifyAll() : wating pool에서 대기중인 모든 쓰레드를 깨운다.
* 
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadWaitEx1.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadWaitEx2.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadWaitEx3.java)

### 9-3 Lock과 Condition을 이용한 동기화
* synchronized외에도 'java.util.concurrent.locks'패키지가 제공하는 lock클래스들을 이용한느 방법이 있다.
```java
	ReentrantLock : 재진입이 가능한 lock. 가장 일반적인 베타 lock
    ReentrantReadWriteLock : 읽기에는 공유적이고, 쓰기에는 베타적인 lock
    StampedLock : ReentrantReadWriteLock에 낙관적인 lock의 기능을 추가
```

#### 9-3-1 ReentrantLock의 생성자
```java
	ReentrantLock()
    ReentrantLcok(boolean fair) // true를 주면, lock이 풀렸을 때 가장 오랜 기다린 쓰레드가 lock을 획득할 수 있게 한다.
    
    void lock() : lock을 잠근다.
    void unlock() lock을 해지한다.
    boolean isLocked() : lock이 잠겼는지 확인
    
    lock.lock();
    //임계영역
    lock.unlock();
    
    임계영역 내에서 예외가 발생하거나 return문으로 빠져나가게 되면 lock이 풀리지 않을수 있으므로
    lock.lock();
    try{
    	//임계영역
    }finally{
    	lock.unlock();
    }
    
    tryLock() : 다른 쓰레드에 의해 lock이 걸려 있으면 lock을 얻으려고 기다리지 않는다.
                또는 지정된 시간만큼만 기다린다.
    boolean tryLock()
    boolean tryLock()(long timeout, TimeUnit unit) throws InterruptedException     
```

#### 9-3-2 ReentrantLock과 Condition
* Condition : 쓰레드를 구분해서 통지
```java
	//Contidion은 이미 생성된 lock으로부터 newCondition()을 호출해서 생성
    private ReentrantLcok lock = new ReentrantLcok(); // lock을 생성
    private Condition forCook = lock.newCondition(); // lock으로 condition을 생성
    private Condition forCust = lock.newCondition();
```

Object | Condition
------------ | -------------
void wait() | void await(), void awaitUninterruptibly()
void wait(long timeout) | boolean await(long time, TimeUnit unit),long awaitNanos(long nanosTimeout), boolean awaitUntil(Date deadline)
void notify() | void signal()
void notifyAll | void signalAll()

* forCook.await(), forCust.await()을 사용함으로써 대기와 통지의 대상이 명확히 구분

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadWaitEx4.java)



### 9-4 volatile
* 멀티 코어 프로세서에서는 코어마다 별도의 캐시를 가지고 있다.
* 코어는 메모리에서 읽어온 값을 캐시에 저장하고 캐시에서 값을 읽어서 작업한다.
* volatileㅇ르 붙이면, 코어가 변수의 값을 읽어올 때 캐시가 아닌 메모리에서 읽어오기 때문에 캐시와 메모리간의 값의 불일치가 해결됨.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ThreadEx16.java)
* volatile로 long과 double을 원자화
   - 변수의 값을 읽는 과정에 다른 쓰레드가 끼어들지 못하게 막는다.(원자화)
   ```java
   	volatile long sharedVal; // long타입의 변수(8 byte)를 원자화
    volatile double sharedVal; // double타입의 변수(8 byte)를 원자화
   ```
  - volatile은 원자화만 하고 동기화 하려면 synchronized를 이용
  ```java
  	volatile long balance;
    
    synchronized int getBalance(){
    	return balance;
     }
     
  ```
  
### 9-5 fork 와 join 프레임웍
  * 하나의 작업을 작은 단위로 나눠서 여러 쓰레드가 동시에 처리하는 것을 쉽게 만들어 준다.
  ```java
  	RecursiveAction : 반환값이 없는 작업을 구현할 때 사용
    RecursiveTask : 반환값이 있는 작업을 구현할 때 사용
    
    public abstract class RecursiveAction extends FrokJoinTask<Void>{
    	...
        protected abstract void compute();
        ...
    }
    
    public abstract class RecursiveTask<V> extends FrokJoinTask<V>{
    	...
        V result;
        protected abstract V compute();
        ...
    }
  ```
  ```java
  	FrokJoinPool pool = new FrokJoinPool(); // 쓰레드 풀을 생성
    SumTask task = new SumTask(from,to); // 수행할 작업을 생성
    Long result = pool.invok(task);
  ```
  * ForkJoinPool은 fork&join프레임웍에서 제공하는 쓰레드풀로 지정된 수의 쓰레드를 생성해서 미리 만들어 놓고 반복해서 재사용할 수 있게 한다. 쓰레드를 반복해서 생성하지 않아도 되고 많은 쓰레드가 생성돼 성능이 저하되는 것을 막아준다.

* Compute의 구현
   - 수행할 작업 외에도 작업을 어떻게 나눌 것인가에 대해서도 알려야 한다.
   ```java
   public Long compute(){
   	long size = to - from + 1; // from <= i <= to
    
    if(size <= 5)
    	return sum();
        
        long half = (from+to)/2;
        
        SumTask leftSum = new SumTask(from,half);
        SUmTask rightSum = new SumTask(half+1, to);
        
        leftSum.fork(); // 작업을 작업 큐에 넣는다.
        
        return rightSum.compute() + leftSum.join();
   ```
    - fork()와 join()
        - compute()로 나누고 fork()로 작업큐에 넣는 작업이 반복적으로 이뤄지고
        - 작업결과는 join()을 호출해서 얻을 수 있다.
        - fork()는 해당 작업을 쓰레드풀의 작업 큐에 넣는다. 비동기메서드
        - join() 해당 작업의 수행이 끝날 때까지 기다렸다가, 수행이 끝나면 그 결과를 반환. 동기메서드

[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch13/ForkJoinEx1.java)
