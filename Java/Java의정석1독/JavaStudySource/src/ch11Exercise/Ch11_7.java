package ch11Exercise;

import java.util.*;


class Student3{
	String name;
	int ban;
	int no;
	int kor, eng, math;
	
	
	
	public Student3(String name, int ban, int no, int kor, int eng, int math) {
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
		return (int)((getTotal()/3f)*10+0.5) / 10f;
	}

	@Override
	public String toString() {
		return "Student3 [name=" + name + ", ban=" + ban + ", no=" + no + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + "]"+getTotal()+","+getAverage();
	}
}

class BanNoAscending implements Comparator{
	public int compare(Object o1, Object o2){
		if(o1 instanceof Student3 && o2 instanceof Student3)
		{
			Student3 s1 = (Student3)o1;
			Student3 s2 = (Student3)o2;
			
			return s1.ban == s2.ban ? s1.no - s2.no : s1.ban - s2.ban;
			
//			int result =  s1.ban - s2.ban;
//			
//			if(result==0){
//				return s1.no-s2.no;
//			}
//			return result;
		}
		return -1;
	}
}

public class Ch11_7 {

	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		
		
		list.add(new Student3("ÀÌÁö¹Ù",2,1,70,90,70));
		list.add(new Student3("¾ÈÁö¹Ù",2,2,60,100,80));
		list.add(new Student3("È«±æµ¿",1,3,100,100,100));
		list.add(new Student3("³²±Ã¼º",1,1,90,70,80));
		list.add(new Student3("±èÀÚ¹Ù",1,2,80,80,90));

		Collections.sort(list, new BanNoAscending());
		
		Iterator it = list.iterator();
		
		while(it.hasNext())
			System.out.println(it.next());
	}

}
