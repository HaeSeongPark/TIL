> 출처 : 자바의 정석

# Java Array

![java Array 자료형의 기본 값.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/java%20Array%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9D%98%20%EA%B8%B0%EB%B3%B8%20%EA%B0%92.png)

## 1. 배열이란?
* 같은 타입의 여러 변수를 하나의 묶음으로 다루는 것
* 많은 양의 값(데이터)을 다룰 때 유용
* 배열의각 요소는 서로 연속적
```java
	int[] score = new int[5] // 5개의 int 값을 저장할 수 있는 배열 생성
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array.png)
## 2. 배열의 선언과 생성
* 타입 또는 변수이름 뒤에 대괄호[]를 붙여서 배열을 선언

선언방법 | 선언 예
------------ | -------------
타입[] 변수이름; | int[] score; / String[]  name;
타입 변수이름[];| int score[]; / String name[];
* 배열을 선언한다고 해서 값을 저장할 공간이 생성되는 것이 아니라 배열을 다루는데 필요한 변수가 생선된다.
```java
	int[] score; // 배열을 선언한다. 생성된 배열을 다루는데 사용될 참조변수 선언
    score = new int[5]; // 배열을 생성한다. 5개의 int값을 저장할 수 있는 공간 생성
   //int[] score = new int[5];
```
![그림](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array.png)
## 3. 배열의 초기화
```java
	int[] score = { 100, 90, 80, 70, 60 };
    int[] score = new int[] { 100, 90, 80, 70, 60 };
    
    int[] score;
    score = { 100, 90, 80, 70, 60 }; // 에러 발생!!!
    
    int[] score;
    score = new int[] { 100, 90, 80, 70, 60 } OK
    
    int add(int[] arr) {...}
    int result = add({ 100, 90, 80, 70, 60});  // 에러 발생!!!
    int result = add ( new int[] { 100, 90, 80, 70, 60 });  // OK
```
## 4. 배열의 활용
* 배열에 값을 저장하고 읽어오기
```java
	score[3] = 100; // 배열 score의 4번째 요소에 100을 저장
    int value = score[3]; // 배열 score의 4번째 요소에 저장된 값을 읽어서 value에 저장
```
* 배열이름.length는 배열의 크기를 알려준다.
[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch5_array/ArrayEx4.java)
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch5_array/ArrayEx7.java)
## 5. 다차원 배열의 선언과 생성
* '[]'의 개수가 차원의 수를 의미한다.

선언방법 | 선언 예
------------ | -------------
타입[][] 변수이름;  | int[][] score;
타입 변수이름[][];| int score[][];
타입[] 변수이름[]; | int[] score[];
```java
	int[][] score = new int[5][3];
```
![Java Array 다차원.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EB%8B%A4%EC%B0%A8%EC%9B%90.png)

## 6. 가변배열
* 다자원 배열에서 마지막 찻의 크기를 지정하지 않고 각각 다르게 지정
```java
	int[][] score = 
     	{
        	{ 100, 100, 100, 100 },
            { 20, 20, 20 },
            { 30, 30 },
            { 40, 40 },
            { 50, 50, 50},
        };
```
![Java Array 가변배열.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EA%B0%80%EB%B3%80%EB%B0%B0%EC%97%B4.png)

## 7. 배열의 복사
* System.arraycopy()를 이용한 배열의 복사
```java
	System.arraycopy(arr1, 0, arr2, 0, arr1.length);
    
    arr1[0]에서 arr2[0]으로 arr1.length개의 데이터를 복사
```
```java
	System.arraycopy(arr1, 1, arr2, 2, 2);
    
    arr1[1]에서 arr2[2]으로 2개의 데이터를 복사
```
![Java Array 복사.png](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EB%B3%B5%EC%82%AC.png)

