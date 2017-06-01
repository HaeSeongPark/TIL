package ch10;

public class Dice
{
	// 속성으로 면의 수를 가지고 싶다.
	private int faceCount;
	
	public Dice()
	{
		this.faceCount = 6;
	}
	
	// 생성자 오버로딩
	public Dice(int faceCount) throws IllegalArgumentException
	{
		// 면이 1개 이하이면 의미가 없음
		if(faceCount <=1)
		{
			throw new IllegalArgumentException("면의 수는 2이상이어야 합니다.");
		}
		this.faceCount = faceCount;
	}

	public int getFaceCount()
	{
		return faceCount;
	}
	
	
}
