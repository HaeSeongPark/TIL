> 출처 : 자바의 정석

# Java Flow

## 1. 조건문(if, switch)
### 1-1 if
```java
	if (조건식){
    	// 조건식이 참(true)일 때 수행될 문장들을 적는다.
       }
    
    if(조건식){
    	// 조건식이 참(0이 아닌 값)일 때 수행될 문장들을 적는다.
    }else{
    	조건식이 거짓(0) 일 때 수행될 문장들을 적는다.
    }
    // if 블럭 안에 문장이 하나면 {}생략 가능
    
    if(score > 60)
    	print("sdfsdjhf");
        
    if(score > 60) print("sdfsdf");
    
```
### 1-2 switch
* switch문의 제약조건
   - switch문의 조건식 결과는 정수 또는 문자열이어야 한다.
   - case문의 값은 정수, 상수, 문자열만 가능하며, 중복되지 않아야 한다.
```java
	int num, result;
    final int ONE = 1;
   	...
    switch(result){
    	case '1':          // OK. 문자 상수(정수 상수 49와 동일)
        case ONE:          // OK. 정수 상수
        case "YES":        // OK. 문자열 상수. JDK1.7부터 허용
        case num:          // 에러. 변수는 불가
        case 1.0:          // 에러. 실수도 불가
        
   //case문 중첩
   case 3: case4: case 5:
    print("sdf");
    break;
  // 중첩 switch문
  switch(gender){
  	case '1':
    	switch(gender){
        	case '1':
            	print("2000년 이전 출생 남자")
                break;
       }
       break; // 까먹지 말기
  }
```

> if문이 주로 사용되며, 경우의 수가 많은 경우 switch문을 사용할 것을 고려
> 모든 switch문은 if문으로 변경이 가능하지만, if문은 switch문으로 변경 할 수 없다.
> if문 보다 switch문이 더 간결하고 효율적

### 1-3 Math.random()
* Math클래스에 정의도니 난수 발생함수
* 0.0과 1.0사이의 double값을 반환 (0.0 <= Math.random() < 1.0)
```java
	// 1~10범위의 임의의 정ㅅ를 얻는 식 만들기
    // 1. 각 변에 10을 곱한다.
    0.0 * 10 <= Math.random * 10 < 1.0 * 10
    0.0 <= Math.random * 10 < 10.0
	
    // 2. 각 변을 int형으로 변환
    (int)0.0 <= (int)(Math.random()*10) < (int)10.0
    0 <= (int)(Math.random()*10) < 10
    
    //3. 각 변에 1을 더한다.
    0 + 1 <= (int)(Math.random() * 10) +1 < 10 + 1
    1 <= (int)(Math.random() * 10) + 1 < 11
    
    int socre = (int)(Math.random() * 10) + 1;
```

## 2. 반복문(for, while, do-while)
### 2-1 for문
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
### 2-2 while문
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

### 2-3 do-while문
```java
	do{
    	// 조건식의 연산결과가 참일 때 수행될 문장들을 적는다.
     }while(조건식);  끝에 ';' 주의
```

### 2-4 break문
* 자신이 포함된 하나의 반복문 또는 switch문을 빠져 나온다.
* 주로 if문과 함께 사용해서 특정 조건을 만족하면 반복문을 벗어나게 한다.

### 2-5 continue문
* 자신이 포함된 반복문의 끝으로 이동한다.(다음 반복으로 넘어간다.)
* continue문 이후의 문장들은 수행되지 않는다.

### 2-6 이름 붙은 반복문과 break, continue
* 반복문 앞에 이름을 붙이고, 그 이름을 break, continue와 같이 사용함으로써
*  둘 이상의 반복몬을 벗어나거나 박봉르 건너뛰는 것이 가능하다.
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudy2/JavaStudySource2/src/ch4_if_switch_for_while/FlowEx34.java)
