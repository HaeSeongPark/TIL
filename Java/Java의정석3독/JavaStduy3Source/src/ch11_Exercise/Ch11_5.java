package ch11_Exercise;

import java.util.*;

class Student implements Comparable<Student>
{
	String name;
	int ban;
	int no;
	int kor, eng, math;
	
	int total;
	int schoolRank;
	int classRank;

	public Student(String name, int ban, int no, int kor, int eng, int math)
	{
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		
		total = kor+eng+math;
	}

	int getTotal()
	{
		return total;
	}

	float getAverage()
	{
		return ( int ) ((getTotal() / 3f) * 10 + 0.5) / 10f;
	}

	public String toString()
	{
		return name 
				+ "," + ban 
				+ "," + no 
				+ "," + kor 
				+ "," + eng 
				+ "," + math 
				+ "," + getTotal() 
				+ "," + getAverage() 
				+ "," + schoolRank
				+ "," + classRank;
	}

	@Override
	public int compareTo(Student o)
	{
		return o.total - total;
	}
}

public class Ch11_5
{
	static int getGroupCount(TreeSet<Student> tset, int from, int to)
	{
		return tset.subSet(new Student("" , 0 , 0 , from , from , from) , 
				new Student("" , 0 , 0 , to , to , to)).size();
	}

	public static void main(String [] args)
	{
		TreeSet<Student> set = new TreeSet<>(new Comparator<Student>()
		{
			@Override
			public int compare(Student o1, Student o2)
			{
				float o1A = o1.getAverage();
				float o2A = o2.getAverage();

				return (o1A < o2A) ? -1 : (o1A == o2A) ? 0 : 1;
			}
		});
		set.add(new Student("È«±æµ¿" , 1 , 1 , 100 , 100 , 100));  // 300
		set.add(new Student("³²±Ã¼º" , 1 , 2 , 90 , 70 , 80));  // 240
		set.add(new Student("±èÀÚ¹Ù" , 1 , 3 , 80 , 80 , 90)); // 250
		set.add(new Student("ÀÌÀÚ¹Ù" , 1 , 4 , 70 , 90 , 70)); // 230
		set.add(new Student("¾ÈÀÚ¹Ù" , 1 , 5 , 60 , 100 , 81)); // 240

		Iterator<Student> it = set.iterator();
		while ( it.hasNext() )
			System.out.println(it.next());
		
		System.out.println("[60~69] : " + getGroupCount(set , 60 , 70));
		System.out.println("[70~79] : " + getGroupCount(set , 70 , 80));
		System.out.println("[80~89] : " + getGroupCount(set , 80 , 90));
		System.out.println("[90~100] : " + getGroupCount(set , 90, 101));
	}
}
