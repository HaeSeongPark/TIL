package ch9_lang;

public class HashCodeEx1 {
	public static void main(String[] args) {
		String str1 = new String("abc");
		String str2 = new String("abc");
		
		System.out.println(str1.equals(str2));              // true
		System.out.println(str1.hashCode());                // 96354
		System.out.println(str2.hashCode());	            // 96354
		System.out.println(System.identityHashCode(str1));  // 366712642
		System.out.println(System.identityHashCode(str2));  // 1829164700
		
		/*
		 * String클래스는 문자열의 내용이 같으면, 
		 * 동일한 해시코드를  반환하도록 hashCode메서드가 오버라이딩 돼 있다.
		 * 
		 * 반면 System.identityHashCode(Object x)는 Object클래스의 hashCode메서드처럼
		 * 객체의 주소값으로 해시코드를 생성.
		 */
	}
}
