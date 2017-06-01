package ch10;

public class Student
{
	private String name;
	private int kor;
	private int math;
	private int eng;
	
	// getter : 외부에서 필드를 읽을 수 있도록 도와주는 메서드
	// setter : 외부에서 필드의 값을 수정하도록 도와주는 메서드
	
	
	
	public Student(String name, int kor, int math, int eng)
	{
		this.name = name;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
	}
	
	public Student(String name)
	{
		// 중복제거
		this(name,0,0,0); // 15번째생성자호출 (보통 파라미터가 적은 쪽에서 많은쪽 호출)
//		this.name = name;
//		this.kor = 0;
//		this.math = 0;
//		this.eng = 0;
	}

	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	public int getKor()
	{
		return kor;
	}
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	public int getMath()
	{
		return math;
	}
	public void setMath(int math)
	{
		this.math = math;
	}
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
}
