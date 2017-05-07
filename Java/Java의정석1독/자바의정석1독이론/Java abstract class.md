# 추상클래스
1 추상클래스란
* 클래스가 설계도라면 추상클래스는 '미완성 설계도'
* 추상메서드(선언부만 있는 것)를 포함하고 있는 클래스
```java
 abstract class Player{
 	int currentPos;
    
    Player(){ currentPos=0; }  // 추상클래스도 생성자가 있어야 한다.
    
    abstract void play(int pos); // 추상메서드
    abstract void stop(); // 추상메서드
    
    void play(){
    	play(currentPos);;
    }
```
* 일반메서드가 추상메서드를 호출할 수  있다.(호출할 때 필요한 건 선언부)
* 완성된 설계도가 아니므로 인스턴스를 생성할 수 없다.
* 다른 클래스를 작성하는 데 도움을 줄 목적으로 작성된다.

2 추상메서드란(abstract method)란?
 * 선엄부만 있고 구현부(몸통, body)가 없는 메서드
 ```java
 	//주석을 통해 어떤 기능을 수행할 목적으로 작성하였는지 설명
    abstract 리턴타입 메서드이름();
    
    ex)
    //지정된 위치(pos)에서 재생을 시작하는 기능이 수행되도록 작성한다
    abstract void play(int pos);
 ```
 * 꼭 필요하지만 자손마다 다르게 구현될 것으로 예상되는 경우에 사용
 * 추상클래스를 상속받는 자손클래스에서 추상메서드의 구현부를 완성해야 한다.(강제성)
 ```java
 	abstract class Player{
    	abstract void play(int pos);
        abstract void stop();
    }
    class AudioPlayer extends Player{
    	void play(int pos){...}
        void stop(){...}
    }
    abstract class AbstractPlayer extends Player{
    	vooid play(int pos){...}
     }//만일 조상으로부터 상속받은 추상메서드 중 하나라도 구현하지 않는다면,
      // 자손클래스 역시 추상클래스로 지정해 주어야 한다.
 ```
 
3 추상클랫의 작성
* 여러 클래스에 공통적으로 사용될 수 있는 추상클래스를 바로 작성하거나 기존클래스의 공통 부분을 뽑아서 추상클래스를 만든다.
```java
	class Marine {
    	int x, y;
        void move(int x, int y){...}
        void stop() {...}
        void stimPack() {...}
    }
	class Tank{
    	int x, y;
        void move(int x, int y) {...}
        void stop() {...}
        void changeMode() {...}
    }
    class Dropship{
    	int x, y;
        void move(int x, int y) {...}
        void stop() {...}
        void load() {...}
        void unload() {...}
    }
```
> 추상화

```java
	abstract class Unit{
    	int x, y;
        abstract void move(int x, int y);
        void stop(){...}
   }
	class Marine extends Unit {
        void move(int x, int y){...}
        void stimPack() {...}
    }
	class Tank{
        void move(int x, int y) {...}
        void changeMode() {...}
    }
    class Dropship{
        void move(int x, int y) {...}
        void load() {...}
        void unload() {...}
  }
```
* stop 메서드는 선언부과 구현부 모두 공통적이지만, move는 선언부만 갖고 구현부는 각 유닛마다 다르다. 또한 move는 반드시 필요하다. 따라서 추상메서드로 선언.
* 다형성 실습
```java
	Unit[] group = new Unit[4];
    group[0] = new Marine();
    group[1] = new Tank();
    group[2] = new Marine();
    group[3] = new Dropship();
    
    for(int i = 0; i<group.length; i++){
    	troup[i].move(100,200);       // 각 인스턴스의 move가 호출된다.
    }
```
