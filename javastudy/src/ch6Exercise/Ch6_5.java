package ch6Exercise;

//6_3
class Student123{
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
	
	//생성자 겟터 셋터 해시 등 자동생성 alt shift s
	public Student123(String name, int ban, int no, int kor, int eng, int math) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	String info(){
		return name + "," +
				ban + "," +
				no + "," +
				kor + "," +
				eng + "," +
				math + "," +
				getTotal() + ","+
				getAverage();
	}
	
}

public class Ch6_5 {
	public static void main(String[] args) {
		Student123 s = new Student123("홍길동",1,1,100,60,76);
		System.out.println(s.info());

	}
}
