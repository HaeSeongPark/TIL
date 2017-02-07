> 출처 : 자바의 정석

# Java Comparator & Comparable
* 객체를 정렬하는데 필요한 메서드를 정의한 인터페이스
* Comparable : 기본 정렬기준을 구현하는데 사용
* Comparator : 기본 정렬기준 외에 다른 기준으로 정렬하고자할 때 사용
```java
	public interface Comparator{          //java.util
    	int compare(Object o1, Object o2);  // o1, o2 두 객체를 비교
        boolean equals(Object obj);        // equals를 오버라이딩해야 함
   }
   public interface Comparable{            //java.lang
   	public int compareTo(Object o);        // 주어진 객체(o)를 자신과 비교
   }
```
* compare()와 compareTo()는 이름과 매개변수의 수만 다를 뿐
* 비교해서 같으면 0, 작으면 음수, 양수를 반환
* 이 반환값을 통해 두 객체의 정렬순서가 결정
* equals메서드는 모든 클래스가 가지고 있지만, Comparator를 구현하는 클래스는 equals메서드의 오버라이딩이 필요할 수도 있다는 것을 알리기 위해 정의한 것일 뿐, 대부분의 경우 compare(Object o1, Object o2)만 구현하면 된다.

```java
	public final class Integer extends Number implements Comparable{
    	...
        public int compareTo(Object o){
        	return compareTo((Integer)o);
         }
         public int compareTo(Integer anotherInteger){
         	int thisVal = this.value;
            int anotherVal = anotherInteger.value;
            
            //비교하는 값이 크면 -1, 같으면 0, 작으면 1을 반
            return (thisVal<anotherVal ? -1 : (thisVal==anotherVal ? 0 : 1) );
```


```java
	public static void main(String[] args){
    	TreeSet set1 = new TreeSet(); // 기본정렬(Comparable)사용
        TreeSet set2 = new TreeSet(new Descending()); // TreeSet(Comparaotr c)
        
        int[] score = {30, 50, 10, 20, 40);
        
        for(int i=0; i<score.length; i++){
        	set1.add(new Integer(score[i]));          // set1 : [10,20,30,40,50] 
            set2.add(new Integer(score[i]));		  // set2 : [50,40,30,20,10]
            }
     }
     class Descending implements Comparator{
     	public int compare(Object o1, Object o2){
        	if( o1 instanceof Comparable && o2 instanceof Comparable){
            	Comparable c1 = (Comparable)o1;  //형변환필수
                Comparable c2 = (Comparable)o2;  //형변환필수
                return c1.compareTo(c2) * -1 ; // 기본 정렬방식의 반대로 변경
              //return c2.compareTo(c1);
               }
               return -1;
             }
         }
```
[[관련소스]](https://github.com/HaeSeongPark/TIL/blob/master/JavaStudySource/src/ch11/ComparatorEx.java)
