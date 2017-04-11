> 출처 : 자바의 정석

# Java.util.RandomClass
* 난수를 얻을 수 있는 클래스
* Math.random과 같다.
* 사실 Math.random()은 내부적으로 Random클래스를 사용
```java
	double randNum = Math.random();
    double radNum \ new Random().nextDouble;
    
    int num = (int)(Math.random()*6)+1;
    int num = new Random().nextInt(6)+1;
```
* Random()은 종자값(seed)를 설정할 수 있다.
* 종자값이 같은 Random의 인스턴스들은 항상 같은 난수를 같은 순서대로 반환
```java
	public Random(){
    	this(System.urrenTimeMillis()); // Random(long seed)를 호출
    }
    // 종자값을 현재시간을 천분의 1초단위로 하기 때문에 실행할 때마다 난수가 달라진다.
```

메서드 | 설명
------------ | -------------
 Random()    | System.현재시간을 종자값으로 이용하는 Random인스턴스를 생성
 Random(long seed) | 매개변수 seed를 종자값으로 이용해 Random인스턴스를 생성
boolean nextBoolean() | boolean타입의 난수 반환
void nextBytes(bytep[] bytes) | bytes배열에 byte타입의 난수를 채워서 반환한다.
double nextDouble() | double타입의 난수를 반환한다.(0.0 <= x < 1.0)
double nextGaussian() | 평균은 0.0이고 표준편차는 1.0인 가우시안분포에 따른 double형의 난수를 반환
int nextInt() | int타입의 난수를 반환한다. (int의 범위_
int nextInt(int n) | 0~n의 범위에 있는 int값을 반환한다.(n은 범위에 포함되지 않음)
long nextLong() | long타입의 난수를 반환한다.(long의 범위)
void setSeed(long seed) | 종자값을 주어진 값으로 변경
