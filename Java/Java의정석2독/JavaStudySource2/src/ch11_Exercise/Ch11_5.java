package ch11_Exercise;

import java.util.*;

class Student implements Comparable<Student>{
	String name;
	int ban;
	int no;
	int kor, eng, math;
	public Student(String name, int ban, int no, int kor, int eng, int math) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	int getTotal(){
		return kor+eng+math;
	}
	
	float getAverage(){
		return (int)((getTotal()/3f)*10+0.5)/10f;
	}
	public String toString(){
		return name + "," + ban + "," + no + "," + kor + "," + eng
				+ "," + math + "," + getTotal() + "," + getAverage() + ",";
	}

	@Override
	public int compareTo(Student o) {
		return name.compareTo(o.name);
	}


	
}

public class Ch11_5 {
	public static void main(String[] args) {
		ArrayList<Student> list = new ArrayList<>();
		list.add(new Student("홍길동",1,1,100,100,100));
		list.add(new Student("남궁성",1,2,90,70,80));
		list.add(new Student("김자바",1,3,80,80,90));
		list.add(new Student("이자바",1,4,70,90,70));
		list.add(new Student("안지바",1,5,60,100,80));

		Collections.sort(list);
		Iterator it = list.iterator();
		
		while(it.hasNext())
			System.out.println(it.next());
	}
}
