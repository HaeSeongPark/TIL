package ch11Exercise;

import java.util.*;


class Student8 implements Comparable{
	String name;
	int ban;
	int no;
	int kor, eng, math;
	int total;
	int schoolRank;
	
	
	public Student8(String name, int ban, int no, int kor, int eng, int math) {
		super();
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		
		total = kor + eng + math;
	}

	int getTotal(){
		return kor+eng+math;
	}
	float getAverage(){
		return (int)((getTotal()/3f)*10+0.5) / 10f;
	}

	@Override
	public String toString() {
		return "Student8 [name=" + name + ", ban=" + ban + ", no=" + no + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + ", getTotal="+ getTotal() + ", getAverage="+ getAverage() +  ", schoolRank="+ schoolRank + "]";
	}

	@Override
	public int compareTo(Object o) {
		if(o instanceof Student8){
			Student8 tmp = (Student8)o;
//			return name.compareTo(tmp.name);
			return (int)(tmp.getAverage() - getAverage());
		}else
			return -1;
	}
	
	
}
/*
 * 총점을  기준으로 각 학생의 전교등수를 계산하고 전교등수를 기준으로 오름차순 정렬
 */
public class Ch11_8 {
	public static void calculateSchoolRank(List list){
		Collections.sort(list);
		
		int prevRank = -1; //이전 전교등수
		int prevTotal = -1; // 이전 총점
		int length = list.size();
		
		for(int i=0; i<length; i++){
			Student8 s = (Student8)list.get(i);
			if(s.total == prevTotal){
				s.schoolRank = prevRank;
			}else{
				s.schoolRank = i+1;
			}
			prevRank = s.schoolRank;
			prevTotal = s.total;
		}
	}

	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		list.add(new Student8("이자바",2,1,70,90,70));
		list.add(new Student8("안자바",2,2,60,100,80));
		list.add(new Student8("홍길동",1,3,100,100,100));
		list.add(new Student8("남궁성",1,1,90,70,80));
		list.add(new Student8("김자바",1,2,80,80,90));
		
		calculateSchoolRank(list);
		
		Iterator it = list.iterator();
		
		while(it.hasNext())
			System.out.println(it.next());
	}

}
