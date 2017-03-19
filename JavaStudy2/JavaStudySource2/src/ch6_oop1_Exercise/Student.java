package ch6_oop1_Exercise;

/*
 * 6_3 
 * Student클래스 만들기
 */

public class Student {
	String name;
	int ban, no, kor, eng, math;

	public Student() {
	}
	
	

	public Student(String name, int ban, int no, int kor, int eng, int math) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}



	int getTotal() {
		return kor + eng + math;
	}

	float getAverage() {
		// return getTotal() / 3.0f; // -> 78.666664 소수 두째자리에서 반올림해야 됨.
		// getTotal() / 3.0f * 10 -> 786.66664
		// getTotal() / 3.0f * 10 + 0.5 -> 787.16664
		// (int)(getTotal() / 3.0f * 10 + 0.5) -> 787
		// return (int)(getTotal() / 3.0f * 10 + 0.5) / 10.0f;
		return (int) (getTotal() / 3f * 10 + 0.5f) / 10f;
	}
	
	String info(){
		return name 
			 + "," + ban 
			 + "," + no 
			 + "," + kor 
			 + "," + eng 
			 + "," + math 
			 + "," + getTotal() 
			 + "," + getAverage(); 
	}

}
