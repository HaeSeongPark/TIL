# Java Control_Flow_statements
## 1. 조건문(if, switch)
### 1.1 if
```java
	if(조건식){
    	// 조선식의 결과가 true일 때 수행될 문장들
    } else if(조건식2) {
    	// 조건식2의 결과가 true일 때 수행될 문장들
    } else if(조건식3) {
    	// 조건식3의 결과가 true일 때 수행될 문장들
    } else {
		// 모든 조건식의 결고가 false일 때 수행될 문장들
    }
    
```
### 1.2 중첩 if
```java
	if(조건식1){
    	// 조건식1의 연산결과가 true일 때 수행될 문장들을 적는다.
        if (조건식2) {
        	// 조건식1과 조건식2가 모두 true일 때 수행될 문장들
        } else {
        	// 조건식 1이 true이고, 조건식2가 false일 때 수행되는 문장들
        }
    } else {
    	조건식이 false일 때 수행되는 문장들
    }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx5.java)

### 1.3 switch
* switch문의 제약조건
    - switch문의 조건식 결과는 정수 또는 문자열이어야만 한다.
    - case문의 값은 정수, 상수, 문자열만 가능하며 중복되지 안않아야 한다.
```java
	int num, result;
    final int ONE = 1;
    ...
    switch(result){
    	case '1': // OK. 문자상수(정수 상수 49와 동일)
        case ONE: // Ok. 정수 상수
        case "YES": // OK. 문자열 상수. JDK1.7부터 허용
        case num: // 에러. 변수는 불가
        case 1.0; // 에러. 실수 불가
        
      // case문 중첩
      case 3: case 4: case 5:
      print("abc");
      break;
      
      // 중첩 switch문
      switch(gender){
      	case '1':
        switch(gender){
        	case'1':
            print("abc");
            break;
        }
        break;
    }
```
> if문이 주로 사용되며, 경우의 수가 많은 경우 switch문을 사용하는 것을 고려. 모든 switch문은 if문으로 변경이 가능하지만, if문은 swithc문으로 변경할 수 없다. if문 보다 switch문이 더 간결하고 효율적

### 1.4 Math.random()
* 난수발생함수
* 0.0과 1.0사이의 double값을 반환 (0.0 <= Math.random() < 1.0)
* 사용
```java
	// 1~10의 범위의 임의의 정수를 얻는 식
    // 1.각 변에 10을 곱한다.
    0.0 * 10 <= Math.radom()*10 <= 1.0 *10
    0.0 <= Math.random()*10 <= 10.0

    // 2. 각 변을 int형으로 변환
    (int)0.0 <= (int)(Math.random()*10) < (int)10.0
    0 <= (int)(Math.random()*10) < 10
    
    //3. 각 변에 1을 더한다.
    0 + 1 <= (int)(Math.random() * 10) +1 < 10 + 1
    1 <= (int)(Math.random() * 10) + 1 < 11
    
    int socre = (int)(Math.random() * 10) + 1;
```

## 2. 반복문(for, while, do-while)
### 2.1 for
```java
	for(초기화;조건식;증감식){
    	// 조건식이 참일 때 수행될 문장들을 적는다.
     }
     
     for(int i=1, j=10; i<=10; i++, j--){...}
     // i는 1부터 10까지 1씩 증가하고
     // j는 1-부터 1까지 1씩 감소한다.
     
     for(;;){...} // 초기화, 조건식, 증감식 모두 생략. 조선식은 참이 된다.
     
     // 향상된 for문
     // JDK1.5부터 배열과 컬렉션에 저장된 요소에 접근할 때 기존보다 편리한 방법으로 처리할 수 있도록 
     // for문의 새로운 문법이 추가됐다.
     // for( 타입 변수명 : 배열 또는 컬렉션){
     	// 반복할 문장
     }	
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx14.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx15.java)

### 2.2 while
```java
	while(조건식){
    	// 조건식의 연산결과가 참(true)인 동안, 반복될 문장들을 적는다.
        // 초기화 조건식 증감식
    for(int i=1; i<=10; i++)
    	print(i);
   -------------------------
   int i=1; // 초기화
   while(i<=10){ // 조건식
   	print(i);
    i++;  // 증감식
  }
  
  // while문의 조건식은 생략불가
  while() { // 에러. 조건식이 없음.
  ...
  }

  for(;;){..} - while(ture){..} 조건식이 항상 참
```

### 2.3 do-while
```java
	do{
    	// 조건식의 연산결과가 참일 때 수행될 문장들을 적는다.
     }while(조건식);  끝에 ';' 주의
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx27.java)

### 2.4 break
* 자신이 포함된 하나의 반복문 또는 swithc문을 빠져나온다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx30.java)

### 2.5 continue
* 자신이 포함된 반복문의 끝으로 이동한다.(다음 반복문으로 넘어간다)
* coninue문 이후의 문장들은 수행되지 않는다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx31.java)

### 2.6 이름 붙은 반복문
* 반복문 앞에 이름을 붙이고, 그 이름을 break, continue와 같이 사용함으로써
* 둘 이상의 반복문을 벗어나거나 반복을 건너뛰는 것이 가능
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx33.java)
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/Java%EC%9D%98%EC%A0%95%EC%84%9D3%EB%8F%85/JavaStduy3Source/src/ch4_Control_Flow_Statements/FlowEx34.java)
