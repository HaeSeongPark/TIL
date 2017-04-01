# Java Collecitons
* Arrays가 배열과 관련된 메서드를 제공하는 것처럼, Collections는 컬렉션과 관련도니 메서드를 제공

### 컬랙션의 동기화

* 멀티 쓰레드 프로그래밍에서는 하나의 객체를 여러 쓰레드가 동시에 접근할 수 있기 때문에 데이터의 일관성을 유지하기 위해서는 공유되는 객체에 동기화가 필요
* Vector와 hashtable과 같은 구버전의 클래스든은 자체적으로 동기화 처리가 돼 있다.
* 하지만 멀티쓰레드 프로그래밍이 아닌 경우에는 성능을 떨어뜨린다.
* 그래서 새로 추가된 ArrayList와 HaashMap과 같은 컬렉션은 동기화 처리를 선택적으로 할 수 있음
* Collections클래스에는 동기화 메서드를 제공
```java
	static Collection synchronizedCollection(Collection c)
    static List       synchronizedList(List list)
    static Set        synchronizedSet(Set s)
    static Map        synchronizedMap(Map m)
    static SortedSet  synchronizedSortedset(SortedSet s)
    static SorteMap   synchronizedSortedMap(SortedMap m)
    
    List syncList = Collections.synchronizedList(new ArrayList(...));
```

### 변경불가 컬렉션 만들기
* 컬렉션에 저장된 데이터를 보호하기 위해서 켈력션을 변경할 수 없게 읽기전용으로 만들기
```java
	static Collection   unmodifiableCollection(Collection c)
    static List 	    unmodifiableList(List list)
    static Set		    unmodifiableSetn(Set s)
    static Map	        unmodifiableMap(Map m)
    static NavigableSet unmodifiableNavigableSet(Navigable s)
    static SortedSet	unmodifiableSortedSet(Sorted s)
    static NavigableMap unmodifialbeNavigableMap(NavigableMap m)
    static Sortedmap    unmodifialbeSortedMap(Sortedmap m)
```

### 싱글톤 컬렉션 만들기
* 인스턴스를 new연사자가 아닌 메서드를 통해서만 생성할 수 있게 함으로써 생성할 수 있는 인스턴스의 개수를 제한하는 방법
```java
	static List singletonList(Object o)
    static Set singleton(Object o) // singletoneSet이 아님... 뭐지.,. 이 네이밍은
    static Map singletonMap(Object key, Object value)
    
    //매개변수로 저장할 요소를 지정하면, 해당 요소를 저장하는 컬렉션을 반환
    //반환도니 컬렉션은 변경할 수 없다.
```

### 한 종류의 객체만 저장하는 컬렉션 만들기
```java
	static Collection   checkedCollection(Collection c, Class type)
    static List         checkedList(List list, Class type)
    static Set		    checkedSet(Set s, Class type)
    static Map          checkedMap(Map  m, ClassKeyType, Class valueType)
    static Queue        checkedQueue(Queue queue, Class type)
    static NavigableSet checkedNavigableSet(NavigableSet s, Class type)
    static SortedSet    checkedSortedSet(SortedSet s, Class type)
    static NavigableMap checkedNavigableMap(NavigableMap m, Class keytype, Class valueType)
    static SortedMap    checkedSortedMap(SortedMap m, Class keytype, Class valueType)
    
    List list = new ArrayList();
    List checkedList = checkedList(list, String.class); // String만 저장가능
    checkedList.add("abc");
    checkedList.add(new Integer(3)); // 에러
    
    //'generics'를 이용할 수도 있지만 generics는 java5부터 도입된 기능이므로
    // java5이전에 작성된 코드는 위와같은 메소드를 사용해야한다.
```


[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/CollectionsEx.java)
