package ch14;

import java.util.*;
import java.util.function.*;
import java.util.stream.*;
import static java.util.stream.Collectors.*;
import static java.util.Comparator.*;

public class StreamEx7 {

	public static void main(String[] args) {
				Student7[] stuArr = { 
				  new Student7("이지바",true, 1, 1,300),
				  new Student7("김자바",false,1, 1,200),
				  new Student7("안자바",true,1,2,100),
				  new Student7("박자바",false,1,2,150),
				  new Student7("소자바",false,1,2,200),
				  new Student7("나자바",false,1,3,290),
				  new Student7("감자바",true,1,3,180),
				  
				  new Student7("이지바",true, 1, 1,300),
				  new Student7("김자바",false,1, 1,200),
				  new Student7("안자바",true,1,2,100),
				  new Student7("박자바",false,1,2,150),
				  new Student7("소자바",false,1,2,200),
				  new Student7("나자바",false,1,3,290),
				  new Student7("감자바",true,1,3,180)
			};
			
			System.out.println("1. 단순분할(성별로 분할)");
			Map<Boolean, List<Student7>> stuBySex = Stream.of(stuArr)
														  .collect(partitioningBy(Student7::isMale));
														  
			List<Student7> maleStudent = stuBySex.get(true);
			List<Student7> femaleStudent = stuBySex.get(false);
			
			for(Student7 s : maleStudent) System.out.println(s);
			for(Student7 s : femaleStudent) System.out.println(s);
			
			System.out.println("%n2.단순분할 + 통계(성별 학생수)");
			Map<Boolean, Long> stuNumBySex = Stream.of(stuArr)
													.collect(partitioningBy(Student7::isMale, counting()));
													
			System.out.println("남학생 수 : " + stuNumBySex.get(true));
			System.out.println("여학생 수 : " + stuNumBySex.get(false));
			
			System.out.println("%n3.단순분할 + 통계(성별 1등)");
			Map<Boolean, Optional<Student7>> topScoreBySex = Stream.of(stuArr)
																  .collect(partitioningBy(Student7::isMale, maxBy(comparingInt(Student7::getScore))));
			
			System.out.println("남학생 1등 :" + topScoreBySex.get(true));
			System.out.println("여학생 1등 :" + topScoreBySex.get(false));
			
			Map<Boolean, Student7> topScoreBySex2 = Stream.of(stuArr)
														  .collect(partitioningBy(Student7::isMale, 
														                          collectingAndThen(maxBy(comparingInt(Student7::getScore)),Optional::get)));
														                          
			System.out.println("남학생 1등 :" + topScoreBySex2.get(true));
			System.out.println("여학생 1등 :" + topScoreBySex2.get(false));								                          
			
			System.out.println("%n4. 다중분할(성별 불합격자, 100점이하)");
			
			Map<Boolean, Map<Boolean, List<Student7>>> failedStuBySex =
					Stream.of(stuArr).collect(partitioningBy(Student7::isMale,
					        partitioningBy(s->s.getScore() <=100)));
					        
		   List<Student7> failedMaleStu = failedStuBySex.get(true).get(true);
		   List<Student7> failedFemaleStu = failedStuBySex.get(false).get(true);
		   
		   for(Student7 s : failedMaleStu) System.out.println(s);
		   for(Student7 s : failedFemaleStu) System.out.println(s);
	}

}
class Student7{
	String name;
	boolean isMale; // 성별
	int hak;        // 학년
	int ban;        // 반
	int score;

	public Student7(String name, boolean isMale, int hak, int ban, int score) {
		super();
		this.name = name;
		this.isMale = isMale;
		this.hak = hak;
		this.ban = ban;
		this.score = score;
	}
	
	

	public String toString(){
		return String.format("[%s, %s, %d학년, %d반, %3d점]",name, isMale ? "남":"여", hak, ban, score);
	}
	
	enum Level { HIGH, MID, LOW } // 성적을 상,중,하 세 단계로 분류
	
	String getName() { return name;}
	boolean isMale() { return isMale;}
	int getHak() { return hak; }
	int getBan() { return ban; }
	int getScore() { return score;}
}