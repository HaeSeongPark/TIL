package ch11_Exercise;

import java.util.*;

class Student9 implements Comparable<Student9>{
	String name;
	int ban;
	int no;
	int kor, eng, math;
	int total;
	int schoolRank;
	int classRank; // 반등수
	
	
	public Student9(String name, int ban, int no, int kor, int eng, int math) {
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
		return "Student9 [name=" + name + ", ban=" + ban + ", no=" + no + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + ", getTotal="+ getTotal() + ", getAverage="+ getAverage() +  ", schoolRank="+ schoolRank 
				+ ", classRank " + classRank + "]";
	}

	@Override
	public int compareTo(Student9 o) {
		return o.getTotal() - getTotal() ;
	}
}

class ClassTotalComparator implements Comparator<Student9>{

	@Override
	public int compare(Student9 o1, Student9 o2) {
		return o1.ban == o2.ban ? o1.classRank - o2.classRank : o1.ban - o2.ban;
	}

}

public class Ch11_9 {
	public static void calculateClassRank(List<Student9> list){
		Collections.sort(list, new ClassTotalComparator());
		
		int prevBan = -1;
		int prevRank = -1;
		int prevTotal = -1;
		int length = list.size();
		
		// 1. 반복문을 이용해서 list에 저장된 Student객체를 하나씩 읽는다
		for(int i=0, n=0; i<length; i++,n++){
			Student9 s = (Student9)list.get(i);
			// 1.1 반이 달라지면, (ban과 prevBan이 다르면)
				// 이전 등수(prevRank)와 이전 총점을(prevTotal)을 초기화 한다.
			if(s.ban != prevBan){
				prevRank = -1;
				prevTotal = -1;
				n=0;
			}
			// 1.2 총점(total)이 이전총점(prevTotal)과 같으면
				// 이전 등수(prevRank)를 등수(classRank)로 한다.
			if(s.total == prevTotal){
				s.classRank = prevRank;
			} else{
			// 1.3 총점이 서로 다르면,
			//	등수(classRank)의 값을 알맞게 계산해서 저장한다.(실형결과 참고)
				s.classRank = n+1;
			}
			prevBan = s.ban;
			prevTotal = s.total;
			prevRank = s.classRank;
		}
		
		
		
	}
	
	public static void calculateSchoolRank(List<Student9> list){
		Collections.sort(list);
		
		int prevRank = -1; //이전 전교등수
		int prevTotal = -1; // 이전 총점
		int length = list.size();
		
		for(int i=0; i<length; i++){
			Student9 s = (Student9)list.get(i);
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
		ArrayList<Student9> list = new ArrayList<>();
		list.add(new Student9("이자바",2,1,70,90,70));
		list.add(new Student9("안자바",2,2,60,100,80));
		list.add(new Student9("홍길동",1,3,100,100,100));
		list.add(new Student9("남궁성",1,1,90,70,80));
		list.add(new Student9("김자바",1,2,80,80,90));
		
		calculateSchoolRank(list);
		calculateClassRank(list);
		
		Iterator<Student9> it = list.iterator();
		
		while(it.hasNext())
			System.out.println(it.next());
	}

}
