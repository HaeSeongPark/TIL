# 메서드를 사용하는 이유
### 1.높은 재사용성
> 한번 만들어 놓은 메서드는 몇 번이고 호출 할 수 있어야 하며, 다른 프로그램에서도 사용이 가능해야 한다.

### 2. 중복된 코드 제거
> 반복되는 문장들을 묶어서 하나의 메서드로 작성하면 코드의 길이도 짧아지고, 변경사항이 발생했을 때 수정해야할 코드의 양이 줄어들어 오류가 발생할 가능성도 줄어든다.

다음은 예제이다.

```java
main{

for(int i=0; i<10; i++)
 System.out.printf("%d", numArr[i]);
 
...코드 중간 생략

for(int i=0; i<10; i++)
 System.out.printf("%d", numArr[i]);
}

```
> 메서드 생성

```java
void printArr(int[] nuumArr)
{
  for(int i=0; i<10; i++)
    System.out.printf("%d", numArr[i]);
}
main{

  printArr(numArr);
 
...코드 중간 생략

  printArr(numArr);
} 
```
> 비록 예제에서는 2개로 예를 들어서 효과가 미미하지만 중복 코드가 10, 20개 많아 질수록 그 효과가 발휘된다.
