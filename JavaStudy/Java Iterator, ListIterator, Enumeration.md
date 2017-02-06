> 출처 : 자바의 정석

# Java Iterator, ListIterator, Enumeration
## Iterator
* 컬렉션 클래스에 저장된 데이터를 접근하는데 사용되는 인터페이스


```java
	public interface Iterator{
    	boolean hasNext();
        Object next();
        void remove();
    }
    public interface Collection{
    	...
        public Iterator iterator();
        ...
    }
```
> 메서드 

메서드 | 설명
------------ | -------------
boolean hasNext() | 읽어 올 쇼소가 남았는지 확인
Object next()|다음요소를 읽어온다.
void remove() | next()로 읽어온 쇼소를 삭제, 반드시 next()뒤에 와야한다.

* 사용 : 컬렉션 클래스의 iterator()를 호출해서 Iterator를 구현한 개게를 얻는다.
```java
	List list = new ArrayList();
    
    Iterator it = list.iterator();
    
    while(it.hasNext()){
    	System.out.println(it.next());
     }
```

```java
	//Map 인터페이스를 구현한 컬렉션 클래스는 키와 값을 쌍으로 저장하고 있기 때문에
    //iterator()를 직접호출 할 수 없고 keySet()이나, enrtySet()과 같은 메서드를 통해서
    // 키와 값을 따로 Set의 형태로 얻오 온 후에 다시 iterator()를 호출해야 한다.
    Map map = new HashMap();
    Iterator it = map.keySet().iterator();
    			= map.entrySet().iterator();
```

[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/IteratorEx1.java)

[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/IteratorEx2.java)

[[간단히 Iterator구현]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/MyVector.java)
[[소스테스트]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/MyVector2.java)

## ListIterator와 Enumeration

* Enumeration은 Iterator의 구버전
> Enumberation인터페이스의 메서드

![Enumberation인터페이스의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20Enumeration.png)

* ListIterator는 Iterator의 기능을 향상시킨 버전(양방향 조회기능추가, List를 구현한 경우만 사용가능)
> ListIterator의 메서드

![ListIterator의 메서드](https://github.com/HaeSeongPark/TIL/blob/master/img/Java/Java%20ListIterator.png)
 
[[ListIterator]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ListIteratorEx1.java)
