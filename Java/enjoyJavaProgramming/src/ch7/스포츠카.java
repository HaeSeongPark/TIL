package ch7;

public class 스포츠카 extends 자동차
{
	public void 터보()
	{
		System.out.println("터보");
	}
	
	// 메소드이름이 같고, 파라미터의 수, 파라미터의 타입이 다 같으면 오버라이딩 : 수정
	// 오버로딩은 새로운 것 만드는 것 println(), println(int i) 등...
	@Override
	public void 달리다()
	{
		System.out.println("후륜구동으로 달리다");
	}
}
