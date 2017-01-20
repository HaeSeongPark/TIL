package ch9;

public class WrapperEx3 {
	public static void main(String[] args) {
		int i = 10;
		
		//기본형을 참조형으로 형변환 (형변환 생략가능)
		Integer intg = (Integer)i; // Integer intg = Integer.valueOf(i);
//		Integer intg = i;
		
		Object obj = (Object)i; // Object obj = (Object)Integer.valueOf(i);
				
		Long lng = 100L; // Long lng = new Long(100L);
		
		int i2 = intg + 10; // 참조형과 기본형간의 연산 가능
		long l = intg + lng; // 참조형 간의 덧셈도 가능
		
		Integer intg2 = new Integer(20);
		int i3 = (int)intg2; // 참조형을 기보형으로 형변환도 가능(형변환 생략가능)
		
		Integer intg3 = intg2 + i3;
		
		System.out.println("i\t="+i);
		System.out.println("intg\t"+intg);
		System.out.println("obj\t"+obj);
		System.out.println("lng\t"+lng);
		System.out.println("intg + 10\t"+i2);
		System.out.println("intg + lng \t"+l);
		System.out.println("intg2\t"+intg2);
		System.out.println("i3\t"+i3);
		System.out.println("intg2+i3\t"+intg3);
	}
}
