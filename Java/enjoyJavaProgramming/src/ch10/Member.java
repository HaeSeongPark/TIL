package ch10;

public class Member
{
	// 이름을 가진다
	// private는 외부에서는 접근 불가, 해당 클래스에만 사용가능
	// name : 속성, 필드, 인스턴스변수
	private String name;

	// name : 그냥 parameter
	// this.name : 해당 인스턴스가 가지는 속성(필드)
	public Member(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}
	
	// public메소드는 어디에서나 호출가능
	public void setName(String name)
	{
		this.name = name;
	}
	
	
	
}
// 컴파일되면 Member.class 파일이 만들어진다.
// jad를 이용하여 디컴일 하였다.
//public class Member
//{
//	public Member()
//	{
//		
//	}
//}
