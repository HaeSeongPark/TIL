package ch15_Object_String;

public class StringTest1
{
	public static void main(String [] args)
	{
		String str1 = "hello";
		String str2 = "hello";
		String str3 = new String("hello");
		String str4 = new String("hello");
		if(str1 == str2)
		{
			System.out.println("str1 == str2");
		}
		if(str1 == str3)
		{
			System.out.println("str1 == str3");
		}
		if(str3 == str4)
			System.out.println("str3==str4");
		
		/*
		 * new가 없으면
		 * str1과 str2는 "hello"를 가리킴. "hello"는 상수라서 상수풀
		 * new를 사용하면 "hello"가 힙메모리에 생김
		 * 
		 * str1 str2 는 "hello"
		 * str3은 "hello"
		 * str4는 "hello"
		 */
		
	}
}
