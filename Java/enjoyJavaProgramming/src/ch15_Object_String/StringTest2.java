package ch15_Object_String;

public class StringTest2
{
	public static void main(String [] args)
	{
		/*
		 * String 불변클래스 String의
		 * 어떤 메소드로 기존 값은 변경하지 않고
		 * 새로운 문자열을 반환
		 */
//		String helloWorld = "Hello World!!!";
//		String str = helloWorld.substring(5);
//		System.out.println(helloWorld);
//		System.out.println(str);
//		
//		String str3 = "hello " + "world";
//		// String str3 = new StringBuffer().append("hello ").append("world").toString();
		
		long start1 = System.nanoTime();
		String str2 = "";
		for(int i=0; i<100; i++)
		{
			str2 = str2 + "*";
			// str2 = new StringBuffer().append(str2).append("*").toString();
			// 계속해서 인스턴스 사용 -> 느리고 메모리 낭비
			// 문자열을 for에서 +는 ㄴㄴ StringBuffer()나 Builder Builder는 not thread safe
		}
		long end1 = System.nanoTime();
//		System.out.println(str2);
		System.out.println(end1-start1);  // 106053
		
		long start2 = System.nanoTime();
		StringBuilder str3 = new StringBuilder();
		for(int i=0; i<100; i++)
		{
			str3.append("*");
		}
		long end2 = System.nanoTime();
//		System.out.println(str3.toString());
		System.out.println(end2-start2); // 9836
		
	}
}
