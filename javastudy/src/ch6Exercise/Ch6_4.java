package ch6Exercise;

//6_3
class Student{
	String name;
	int ban;
	int no;
	int kor;
	int eng;
	int math;
	
	int getTotal(){
		return kor + eng + math;
	}
	float getAverage(){
//	 //반올림
//		float tmp = (float)getTotal() / 3;      //78.666664;
//		// float tmp  = getTotal / 3f
//		tmp *= 10; // 786.6666;
//		tmp += 0.5; // 787.1666;
//		int average = (int)tmp;  //787
//		return (float)average/10;  //78.8
		
		return (float)(int)((float)getTotal() / 3 * 10 + 0.5) /10 ;
	}
}

public class Ch6_4 {
	public static void main(String[] args) {
		Student s = new Student();
		s.name = "홍길동";
		s.ban = 1;
		s.no = 1;
		s.kor =100;
		s.eng = 60;
		s.math = 76;
		
		System.out.println("이름:"+s.name);
		System.out.println("총점:"+s.getTotal());
		System.out.println("이름:"+s.getAverage());
	}
}
