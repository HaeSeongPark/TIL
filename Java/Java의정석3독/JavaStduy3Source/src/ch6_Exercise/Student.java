package ch6_Exercise;

public class Student {
	String name;
	int ban, no, kor, eng, math;
	
	int getTotal(){
		return kor + eng + math;
	}
	
	float getAverage(){
		return (int)(getTotal() / 3f * 10 + 0.5) / 10f; 
		// 소수 두째자리에서 반올림
		// getTotal() / 3f // 78.666664
		// getTotal() / 3f * 10  // 786.66664
		// getTotal() / 3f * 10 + 0.5  // 787.16664
		// (int)(getTotal() / 3f * 10 + 0.5) // 787
		// (int)(getTotal() / 3f * 10 + 0.5) / 10f
	}
	
	String info(){
		return name + ","
		     + ban  + ","
		     + no   + ","
		     + kor  + ","
		     + eng  + ","
		     + math + ","
		     + getTotal() + ","
		     + getAverage();
	}
}
