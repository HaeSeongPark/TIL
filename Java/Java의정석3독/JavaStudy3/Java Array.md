# Java Array
## 1.1 배열의 초기화
```java
	int[] score = { 100, 90, 80, 70, 60 };
    int[] socre = new int[] { 100, 90, 80, 70, 60 };
    
    int[] socre;
    score = { 100, 90, 80, 70, 60 }; // 에러 발생!
    
    int[] score;
    score = new int[] { 100, 90, 80, 70, 60 };
    
    int add(int[] arr)
    
    int result = add(new int[] { 100, 90, 80, 70, 60 } );
	int result = add({ 100, 90, 80, 70, 60 }); // error
   
```
## 1.2 다차원 배열이 선언과 생성
* '[]'의 개수가 차원의 수를 의미.
```java
	타입[][] 변수이름;
    int[][] score;
    
    int[][] score = new int[5][3];
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EB%8B%A4%EC%B0%A8%EC%9B%90.png)

## 1.3 가변배열
* 다차원 배열에서 마지막 차수의 크기를 지정하지 않고 각각 다르게  지정.
```java
	int[][] score = {
    	{ 100, 100, 100, 100 },
        { 20, 20, 20 },
        { 30, 30 },
        { 40, 40 },
        { 50, 50, 50 },
     };
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EA%B0%80%EB%B3%80%EB%B0%B0%EC%97%B4.png)

## 1.4 배열의 복사
* System.arraycopy()를 이용한 배열의 복사
```java
	System.arraycopy(arr1, 0, arr2, 0, arr1.length);
    arr1[0]에서 arr2[0]으로 arr1.length만큼의 데이터 복사
    
    System.arraycopy(arr1,1,arr2,2,2);
    arr1[1]에서 arr[2]으로 2개의 데이터를 복사
```
![](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Array%20%EB%B3%B5%EC%82%AC.png)
