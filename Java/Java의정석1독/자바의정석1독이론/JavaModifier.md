# 제어자(modifier)
1 제어자란?
* 클래스, 변수, 메서드의 선언부에 사용돼 부가적인 의미를 부여
* 제어자는 크게 접근제어자와 그 외의 제어자로 나뉜다.
* `접근제어자 : public, protected, default, private`
* `그 외 : static, final, abstract, native, transient, synchronized, volatile, strictfp`

2 static : 클래스의, 공통적인
* static이 사용될 수 있는 곳 : 멤버변수, 메서드 초기화 블럭
- static 멤버변수
  - 모든 인스턴스에 공통적으로 사용되는 클래스변수 
  - 클래스변수는 인스턴스를 생성하지 않고도 사용 가능하다.
  - 클래스가 메모리에 로들될 때 생성된다.
- static 메서드
  - 인스턴스를 생성하지 않고도 호출이 가능한 static 메서드가 된다. 
  - static 메서드 내에서는 인스턴스멤버들을 직접 사용할 수 없다.
```java
	class StaticTest{
    	static int width = 200;
        static int height = 120;
        
        static { //클래스 변수 초기화 블럭
           // static변수의 복잡한 초기화 수행
        }
        static int max(int a, int b){
        	return a > b ? a : b;
        }
  }
```
3 fianl : 마지막의, 변경될 수 없는
* final이 사용될 수 있는 곳 : 클래스, 메서드, 멤버변수, 지역변수
- final 클래스
  - 변경될 수 없는 클래스, 확장될 수 없는 클래스가 된다. 그래서 final로 지정된 클래스는 다른 클래스의 조상이 될 수 없다.
- final 메서드
  - 변경될 수 없는 메서드, final로 지정된 메서드는 오버라이딩을 통해 재정의 될 수 없다.
- final 멤버변수, 지역변수
  - 변수 앞에 final이 붙으면 값을 변경할 수 없는 상수가 된다.
```java
	fianl class Finalest{
    	final int MAX_SIZE = 10; // 멤버변수
        
        final void getMaxSize() {
        	fianl LV = MAX_SIZE;
            return MAX_SIZE;
            }
       }
  }
  class Child extends FinalTest{
  	void getMaxSize(){}  // 오류
  }
```

4 생성자를 이용한 final 멤버변수 초기화
* final이 붙은 변수는 상수이므로 보통은 선언과 초기화를 하지만, 인스턴스변수의 경우 생성자에서 초기화 할 수 있다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/FinalCardTest.java)


5 abstract : 추상의, 미완성의
* abstract가 사용될 수 있는 곳 : 클래스, 메서드
- abstract 클래스
  - 클래스 내에 추상메서드가 선언돼 있음을 의미
- abstract 메서드
  - 선언부만 작성하고 구현부는 작성하지 않은 추상메서드임을 알린다.
```java
	abstract class AbstractTest { // 추상클래스
    	abstract void move(); // 추상메서드
  }
```

6 접근 제어자
* 멤버 또는 클래스에 사용돼, 외부로부터의 접근을 제한한다.
- 접근제어자가 사용될 수 있는 곳 : 클래스, 메서드, 멤버변수, 생성자
  - 클래스 내에 추상메서드가 선언돼 있음을 의미
- private : 같은 클래스 내에서만 접근 가능
- default : 같은 패키지 내에서만 접근 가능
- protected : 같은 패키지 내에서, 그리고 다른 패키지의 자손 클래스에서 접근 가능
- public : 접근 제한이 전혀 없다.
- 접근 제어자를 사용하는 이유
	- 외부로부터 데이터를 보호하기 위함
	- 외부에는 불필요한, 내부적으로만 사용되는 부분을 감추기 위함
	- 
[[관련소스 : Time 클래스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch6/Time.java)

7 생성자의 접근 제어자 (Singleton)
- 일반적으로 생성자의 접근 제어자는 클래스의 접근 제저자와 일치
- 생성자에 접근 제어자를 사용함으로써 인스턴스의 생성을 제한
- [[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch7/SingletonTest.java)

8 제어자의 조합
- 메서드에 static과 abstract를 함께 사용할 수 없다.
   - static메서드는 구현부가 있는 메서드에만 사용할 수 있다.
- 클래스에 abstract와 final을 동시에 사용할 수 없다.
   - 클래스에 사용되는 final은 클래스를 확장할 수 없다는 의미이고, abstract는 상속을 통해서 완성돼야 한다는 의미이므로 서로 모순
- abstract메서드의 접근제어자가 private일 수 없다.
   - abstract메서드는 자손클래스에서 구현해주어야 하는데 접근 제어가자 private이면, 자손클래스에서 접근할 수 없기 때문. 
- 메서드에 private와 final을 같이 사용할 필요는 없다.
   - 접근 제어자가 private인 메서드는 오버라이딩될 수 없기 때문에 이 둘 중 하나만 사용해도 의미가 충분

>  출처 : 자바의정석
