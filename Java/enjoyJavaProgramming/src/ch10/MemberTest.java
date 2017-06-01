package ch10;

public class MemberTest
{
	public static void main(String [] args)
	{
		// new Member : Member인스턴스가 만들어진다.
		// Member(String) : 생성자가 호출된다.
		Member m1 = new Member("홍길동");
		Member m2 = new Member("둘리");
		
		System.out.println(m1.getName());
		System.out.println(m2.getName());
	}
}
