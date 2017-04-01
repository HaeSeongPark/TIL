package ch11Exercise;

import java.util.*;


class Student9 implements Comparable{
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
	public int compareTo(Object o) {
		if(o instanceof Student9){
			Student9 tmp = (Student9)o;
//			return name.compareTo(tmp.name);
			return (int)(tmp.getAverage() - getAverage());
		}else
			return -1;
	}
	
	
}

class ClassTotalComparator implements Comparator{
	public int compare(Object o1, Object o2){
		if(o1 instanceof Student9 && o2 instanceof Student9){
			Student9 s1 = (Student9)o1;
			Student9 s2 = (Student9)o2;
			
			/*
			 * int result = s1.ban - s2.ban; // 반(ban) 기준 정렬(오름차순)
			 * 
			 * if(result == 0) // 반이 같으면, 총점을 비교
			 * 		result = s2.total - s1. total; // 총점(total) 기준 정렬 (내림차순)
			 * 
			 * return result;
			 */
			
			return s1.ban == s2.ban ? s2.total-s1.total : s1.ban-s2.ban;
			
		}
			
		return -1;
	}
}

public class Ch11_9 {
	public static void calculateClassRank(List list){
		Collections.sort(list, new ClassTotalComparator());
		
		int prevBan = -1;
		int prevRank = -1;
		int prevTotal = -1;
		int length = list.size();
		
		for(int i=0, n=0; i<length; i++,n++){
			Student9 tmp = (Student9)list.get(i);
			if(tmp.ban != prevBan){
				prevRank = -1;
				prevTotal = -1;
				n=0;
			}
			if(tmp.total == prevTotal){
				tmp.classRank = prevRank;
			}else {
				tmp.classRank= n+1;
			}
			prevBan = tmp.ban;
			prevTotal = tmp.total;
			prevRank = tmp.classRank;
		}
		
		
	}
	
	public static void calculateSchoolRank(List list){
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
		ArrayList list = new ArrayList();
		list.add(new Student9("이자바",2,1,70,90,70));
		list.add(new Student9("안자바",2,2,60,100,80));
		list.add(new Student9("홍길동",1,3,100,100,100));
		list.add(new Student9("남궁성",1,1,90,70,80));
		list.add(new Student9("김자바",1,2,80,80,90));
		
		calculateSchoolRank(list);
		calculateClassRank(list);
		
		Iterator it = list.iterator();
		
		while(it.hasNext())
			System.out.println(it.next());
	}

}
