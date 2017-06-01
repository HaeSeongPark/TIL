package ch10;

public class StudentTest
{
	public static void main(String [] args)
	{
		Student s1 = new Student("ȫ�浿");
//		s1.setName(s1.getName());
		System.out.println(s1.getName());
		System.out.println(s1.getKor());
		System.out.println(s1.getMath());
		System.out.println(s1.getEng());
	}
}
