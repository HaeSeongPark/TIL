> 출처 : 자바의 정석

# Java HashSet
* Set인터페이스를 구현한 대표적인 컬렉션
* 중복 X, 순서유지 X
* 순서유지를 하고 싶다면 LinkedHashSet클래스를 사용하면 된다
* HashSet의 메서드
* HashSet에 객체를 저장할 때 boolean add(Object o)를 사용하며, 기존에 저장된 객체와 중복된 객체를 저장하면 false를 반환

![HashSet의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20HashSet.png)


[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx1.java)

[[Lotto]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetLotto.java)

[[Bingo]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/Bingo.java)

* boolean add(Object o)는 저장할 객체의 equals()와 hashCode()를 호출하므로 저장할 객체의 equals()와 hashCode()가 적절히 오버라디딩돼 있어야 한다. 그렇지 않으면 중복된 객체를 중복된 것으로 간주하지 않을 수 있다

[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx3.java)

[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx4.java)

#### hashCode오버라이딩시, 만족해야할 세가지 조건
1 동일 객체에 대해 hashCode()를 여러번 호출해도 동일한 int값을 반환, 실행시마다 동일한 int값을 반환할 필요는 없다.(단, equals메서드의 구현에 상용된 멤버변수의 값이 바뀌지 않았다고 가정)
```java
	Person p = new Person("Jany",10);
    
    int hashCode1 = p.hashCode();
    int hashCode2 = p.hashCode();
    //hashCode1과 hashCode2는 항상 같아야 한다. 실행시마다 각각의 값이 같을 필요는 없다.
    // ex) 12345,12345  /  456456,456456    
    
    p.age = 20;
    int hashCode3 = p.hashCode();
    //hashCode3은 hashCode1이나 hashCode2와 달라도 된다.
```    

2 equasl()로 비교해서 true를 얻은 두 객체의 hashCode의 값은 일치해야 한다.

```java
	Person p = new Person("Jany",10);
    Person p2 = new Person("Jany",10);
    
    boolean b = p1.equals(p2);
    
    int hashCode1 = p.hashCode();
    int hashCode2 = p2.hashCode();
    
    //b가 true이면 hashCode2과 hashCode2의 값이 같아야 한다.
```
3 equals()로 비교해서 false를 얻은 두 객체의 hashCode()값은 서로 다른 것이 보통이지만, 같아도 괜찮다. 단, hashing을 사용하는 컬렉션의 성능을 향상시키기 위해서는 다른 값을 반환하는 것이 좋다.

[[HashSet 집합]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/HashSetEx5.java)
