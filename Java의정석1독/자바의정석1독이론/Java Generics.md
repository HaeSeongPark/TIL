# Java Generics
* 다양한 타입의 객체들을 다루는 메서드나 컬렉션 클래스에 컴파일 시의 타입체크를 해주는 기능
* 장점1. 타입 안정성을 제공
* 장점2. 타입체크와 형변환을 생략할 수 있으므로 코드가  간결해 진다.

## 지네릭 클래스의 선언
* 지네릭 타입은 클래스와 메서드에 선언할 수 있다.
* 클래스에 선언
```java
	class Box{
    	Object item;
        
        void setItem(Object item) { this.item = item; }
        Object getItem() { return item; }
      }
      
      // 지네릭 클래스로 변경
      // 클래스 옆에 '<T>'를 붙이고 Object를 모두 T로 바꾼다.
      
   	class Box<T>{
    	T item;
        void setItem(T item) { this.item = item; }
        T getItem() { return item; }
      }
```
* 'T'는 타입변수로, 'Type'의 첫 글자에서 따온 것, 다른 것을 사용해도 된다.
* ArrayLsit<E>의 경우, 타입 변수 'E'는 'Element(요소)'의 첫 글자를 딴 것
* 타입 변수가 여러 개인 경우에는 Map<K, V>와 같이 ,(콤마)를 구분자로 나열 K는 Key, V는 Value를 의미
* 사용
```java
	Box<String> b = new Box<String>(); // 타입 T 대신, 실제 타입을 지정
    b.setItem(new Object());           // 에러. String이외의 타입은 지정불가
    b.setITem("ABC");                  // OK. String타입이므로 가능
    String item = b.getItem();         // (String) b.getItem();, 형반환 필요없음
    ------------------------------------------------------------------------------
    class Box<String>{
        String item;
        void setItem(String item) { this.item = item; }
        String getItem() { return item;}
   }
```
### 지네릭의 용어
`class Box<T>{}`
* Box<T> : 지네릭 클래스. 'T의 Box' 또는 'T Box'라고 읽는다.
* T      : 타입 변수 또는 타입 매개변수. (T는 타입 문자)
* Box    : 원시 타입(raw type)
* 
`Box <String> b = new Box<String>();` 
* Box<String> : 지네릭 타입 호출
* String : 대입된 타입

### 지네릭의 제한
* 모든 객체에 대해 동일하게 동작해야하는 static멤버에 타입 변수 T를 사용할 수 없다.
* T는 인스턴스변수로 간주되기 때문. static멤버는 인스턴스변수를 참조할 수 없다.
```java
	class Box<T> {
    	static T item; // 에러
        static int compare(T t1, T t2) {...} // 에러
        ...
```
* 지네릭 타입의 배열을 생성하는 것도 제한된다. 지네릭 배열 타입의 참조 변수를 선언하는 것은 가능하지만, 'new T[10]'과 같이 배열을 생성하는 것은 안 된다.
```java
	class Box<T>{
    	T[] itemArr;     // OK. T타입의 배열을 위한 참조변수
        T[] toArray() {
        	T[] tmpArr = new T[itemArr.length];  // 에러. 지네릭 배열 생성불가
            return tmpArr;
         }
   }
```
* 지네릭 배열을 생성할 수 없는 것은 new연산자 때문. 이 연산자는 컴파일 시점에 타입 T가 뭔지 정확히 알아야 한다. 그런데 위의 코드에 정의된 Box<T>클래스를 컴파일하는 시점에서는 T가 어떤 타입이 될지 전혀 알 수 없다. instanceof연산자도 같은 이유로 T를 피연산자로 사용할 수 없다.


##  지네릭 클래스의 객체 생성과 사용

```java
	class Box<T>{
    	ArrayList<T> list = new ArrayList<T>();
        
        void add(T item)        { list.add(item); }
        ...
    }
    
    //대입된 타입은 일치해야 한다.
    Box<Apple> appleBox = new Box<Apple>(); // OK
    Box<Apple> appleBox = new Box<Grape>(); // 에러, 대입된 타입이 다르다.
    
    //두 타입이 상속관계에 있어도 마찬가지. Apple이 Fruit의 자손
    Box<Fruit> appleBox = new Box<Apple>(); // 에러, 대입된 타입이 다르다.
    
    //단, 지네릭 클래스의 타입이 상속관계이고, 대입된 타입이 같은 것은 OK.
    Box<Apple> appleBox = new FruitBox<Apple>(); // Ok. 다형성
    
    //타입 생략 가능
    Box<Apple> appleBox = new Box<>();
  //Box<Appple> appleBox = new Box<Apple>();
  
  //대입된 타입과 다른 타입의 객체는 추가할 수 없다.
  Box<Apple> appleBox = new Box<Apple>();
  appleBox.add(new Apple());  //Ok.
  appleBox.add(new Grape());  //에러. Box<Apple>에는 Apple객체만 추가가능
  
  //그러나 대입된 타입의 자손들의 객체는 추가할 수 있다.
  Box<Fruit> fruitBox = new Box<Fruit>();
  fruitBox.add(new Fruit());  // OK
  fruitBox.add(new Apple());  // OK. void add(Fruit item) Apple은 Fruit의 자손
    
```
[[관련소스1]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/FruitBoxEx1.java)

## 제한된 지네릭 클래스
* 'extends'를 이용하면, 특정 타이의 자손들만 대입할 수 있게 제한 할 수 있다.
```java
	class FruitBox<T extends Fruit> { // Fruit의 자손만 타입으로 지정가능
     	ArrayList<T> list = new ArrayList<T>();
        ...
    }
    
    FruitBox<Apple> appleBox = new FruitBox<Apple>(); //OK
    FruitBox<Toy>   toyBOx   = new FruitBox<Toy>();   //에러. Toy는 Fruit의 자손이 아님
    
    FruitBox<Fruit> fruitBox = new FruitBox<Fruit>();
    fruitBox.add(new Apple());  // OK Apple이 Fruit의 자손
    fruitBox.add(new Grape());  // OK Grape가 Fruit의 자손
    
```
* 클래스가 아니라 인터페이스를 구현해야 한다는 제약이 필요하면 'implements'가 아닌 'extends'를 사용해야한다.
```java
	interface Eatable{}
    class FruitBox<T extends Eatable> {...}
```
* 클래스 Fruit의 자손이면서 Eatable 인터페이스도 구현해야한다면 아래와 같이 '&'기호로 연결
```java
	class FruitBox<T extends Fruit & Eatable> {...}
```
[[관련소스2]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/FruitBoxEx2.java)

## 와일드 카드
* Juicer클래스는 지네릭 클래스가 아닌데다, 지네릭 클래스라고 해도 static메서드에는 타입매개변수 T를 매개변수에 사용할 수 없으므로 아예 지네릭스를 적용하지 않던가, 아래와 같이 타입매개변수대신 특정타입을 지정해야 한다
```java
	class Juicer{
    	static Juice makeJuice(FruitBox<Fruit> box){ // <Fruit>으로 지정
        String tmp = "";
        for(Fruit f : box.getList()) tmp += f + " ";
        return new Juice(tmp);
        }
  }
```

* 이렇게 지네릭 타입을 고정해 놓으면, 아래 코드에서 알 수 있듯이 'FruitBox<Apple>'타입의 객체는 makeJuice()의 매개변수가 될 수 없다.
```java
	FruitBox<fruit> fruitBox = new FruitBox<Fruit>();
    FruitBox<Apple> appleBox = new FruitBox<Apple>();
    
    System.out.println(Juicer.makeJuice(fruitBox)); // ok. FruitBox<Fruit>
    System.out.println(Juicer.makeJuice(appleBox)); // 에러. FureiBox<Apple>
```
* 따라서 여러 가지 타입의 매개변수를 갖는 makeJuice()를 만들 수밖에 없다.
* 그러나 위와 같이 오버로딯아면, 컴파일 에러가 발생, 지네릭 타입이 다른 것만으로는 오버로딩이 성립하지 않는다.
* 따라서 오버로딛이 아니라 메서드 중복정의
```java
	    static Juice makeJuice(FruitBox<Fruit> box){ 
          String tmp = "";
          for(Fruit f : box.getList()) tmp += f + " ";
          return new Juice(tmp);
        }
        
        static Juice makeJuice(FruitBox<Apple> box){ 
          String tmp = "";
          for(Fruit f : box.getList()) tmp += f + " ";
          return new Juice(tmp);
        }
```

* 이럴 때 사용하는 것이 `와일드카드`이다.
* 와일드카드는 기호로 '?'사용
```java
	<? extends T> 와일드 카드의 상한 제한. T와 그 자손들만 가능
    <? super T> 와일드 카드의 하한 제한. T와 그 조상들만 가능
    <?> 제한 없음. 모든 타입이 가능 <? extends Object>와 동일
```
* 지네릭 클래스와 달리 와일드 카드에는 '&'를 사용할 수 없다. <? extends T & E> 는 안됨

```java
	   static Juice makeJuice(FruitBox<? extends Fruuit> box){ 
          String tmp = "";
          for(Fruit f : box.getList()) tmp += f + " ";
          return new Juice(tmp);
        }
        
    FruitBox<fruit> fruitBox = new FruitBox<Fruit>();
    FruitBox<Apple> appleBox = new FruitBox<Apple>();
    
    System.out.println(Juicer.makeJuice(fruitBox)); // ok. FruitBox<Fruit>
    System.out.println(Juicer.makeJuice(appleBox)); // ok. FureiBox<Apple>      
```
[[관련소스3]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/FruitBoxEx3.java)
[[관련소스4]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch12/FruitBoxEx4.java)

## 지네릭메서드
* 메서드 선언부에 지네릭 타입이 선안된 메서드
* 지네릭 타입의 선언 위치는 반환타입 바로 앞이다
```java
	static <T> void sort(List<T> list, comparator<? super T> c)
```
* 지네릭 클래스에 정의도니 타입 매개변수와 지네릭 메서드에 정의된 타입 매개변수는 전혀 별개의 것
* 같은 타입 문자 T를 사용한다 해도 같은 것이 아니다.
* 지네릭 메서드는 지네릭 클래스가 이닌 클래스에도 정의될 수 있다.
```java
	class FruitBox<T>{
    	...
        static <T> void sort(List<T> list, Comparator<? super T> c){
     // static멤버에는 타입 매개변수를 사용할 수 없지만,
     // 메서드에 지네릭 타입을 선언하고 사용하는 것은 가능
         	...
            }
   }
```
* 메서드에 선언된 지네릭 타입은 지역 변수를 선언한 것과 같다
* 이 타입 매개변수는 메서드 내에서만 지역적으로 사용될 것이므로 메서드가 static이건 아니건 상관없다.

```java
	static Juice makeJuice(FruitBox<? extends Fruit> box){
    	String tmp = "";
        for(Fruit f : box.getList()) tmp += f + " ";
        return new Juice(tmp);
    }
    
    //지네릭메서드적용
    
    	static <T extends Fruit> Juice makeJuice(FruitBox<T> box){
    	String tmp = "";
        for(Fruit f : box.getList()) tmp += f + " ";
        return new Juice(tmp);
    }
    
    //지네릭메서드호출
    FruitBox<Fruit> fruitBox = new FruitBox<Fruit>();
    FruitBox<Apple> appleBox = new FruitBox<Apple>();
    ...
    System.out.println(Juicer.<Fruit>makeJuice(fruitBox));
    System.out.println(Juicer.<Apple>makeJuice(appleBox));
    
    //타입변수 생략가능
    System.out.println(Juicer.makeJuice(fruitBox));
    System.out.println(Juicer.makeJuice(appleBox));
```

* 메개변수의 타입이 복잡할 때도 유용
```java
	public static void printAll(ArraayList<? extends Product> list, 
    							ArrayList<? extends Product> list2){
                          ...
          }
   	public static <T extends Product> void printAll(ArraayList<T> list, 
    							ArrayList<T> list2){
                          ...
          }
```

## 지네릭 타입의 형변환
* 지네릭과 넌지네릭타입간의 형변환은 가능. 단 , 경고 발생
```java
	Box         box    = null;
    Box<Object> objBox = null;
    
    box    = (Box)objBox;
    objBox = (Box<Object>_box;
```
* 대입된 타입이 다른 지네릭 타입간에는 형변환 불가능
```java
	Box<Object> objBox = null;
    Box<String> strBox = null;
    
    objObx = (Box<Object>)strBox;
    strBox = (Box<String>)objBox;
```
* 와일드 카드를 사용한 지넥리타입과 그냥 지네릭타입일 때 가능
```java
	Box<? extends Object> wBox = new Box<String>();
    
    // 반대도 성립되지만 경고 발생
    // <? extends Object>에 대입될 수 있는 타입이 많고,
    // Box<String>를 제외한 다른 타입은 Box<String>로 형변환될 수 없다.
```
* 와일드 카드를 사용한 지네릭타입간의 형변환. 형변환 가능하지만 경고! : 와일드 카드는 확정된 타입이 아니므로 컴파일러는 미리 확정된 타입으로 형변환하는 것이라고 경고
```java
	FruitBox<? extends Object> objBox = null;
    FuritBox<? extends String> strBox = null;
    
    strBox = (FruitBox<? extendsd String>)objBox; //OK. 미확정 타입을 형변환 경고
    objBox = (FruitBox<? extends Object>)strBox;  //OK. 미확정 타입을 형변환 경고
```

## 지네릭 타입의 제거
* 컴파일러는 지네릭 타입을 이용해서 소스파일을 체크하고, 필요한 곳에 형변환을 넣어준 후 지네릭 제거
* 컴파일된 파일(*.class)에는 지네릭 타입에 대한 정보가 없다.
* 제거 과정
   * 지네릭 타입의 경계(bound)를 제거
       - 지네릭 타입이 <T extends Fruit\>라면 T는 Fruit로 치환 <T>인 경우는 Object로 지환
       - 그리고 클래스옆의 선언은 제거
    ```java
    	class Box<Textnds Fruit>{           class Box{
        	void add(T t) {						void add(Fruit t){
               ...                                    ...
               }                                       }
        }                                        }
    ```

	* 지네릭 타입을 제거한 수에 타입이 일치하지 않으면, 형변환을 추가
	List get()은 Object타입을 반환하므로 형변환이 필요
    ```java
    T get(int i){                      Fruit get(int i){
    	return list.get(i);			        return (Fruit)list.get(i);
     }									}
    ```
    
 * 와일드 카드가 포함돼 있는 경우
 ```java
 	static Juice makeJuice(FruitBox<? extends Fruit> box){
    	String tmp = "";
        for(Fruit f : box.getList()) tmp+=f+" ";
        return new Juice(tmp);
     }
     
     static Juice makeJuice(FruitBox box){
     	String tmp = "";
        Iterator it = box.getList().iterator();
        while(it.hasNext()){
        	tmp += (Fruit)it.next()+ " ";
         }
         return new Juice(tmp);
  }
 ```
