package ch9;

public class HashCodeEx1 {
	public static void main(String[] args) {
		String str1 = new String("abc");
		String str2 = new String("abc");
		
		System.out.println(str1.equals(str2));
//		String클래스의 equals는 내용을 비교하기 때문에 true
		System.out.println(str1.hashCode());
		System.out.println(str2.hashCode());
//		String클래스의 hashCode는 문자열의 내용이 같으면, 
//		동일한 해시코드르 반환하도록 오버라이딩 됐다.
		
		System.out.println(System.identityHashCode(str1));
		System.out.println(System.identityHashCode(str2));
//		System.indetifyHashCode는 Object클래스의 hashCode메서드처럼 객체의 주소값으로
//		해시코드를 생성하기 때문에 모든 객체애 대해 항상 다른 해시코드값을 반환
		
	}
}
