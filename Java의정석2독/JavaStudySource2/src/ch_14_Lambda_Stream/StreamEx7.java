package ch_14_Lambda_Stream;

import java.util.*;
import java.util.function.*;
import java.util.stream.*;
import static java.util.stream.Collectors.*;
import static java.util.Comparator.*;

public class StreamEx7 {
	public static void main(String[] args) {
		Student[] stuArr = { 
				  new Student("이지바",true, 1, 1,300),
				  new Student("김자바",false,1, 1,200),
				  new Student("안자바",true,1,2,100),
				  new Student("박자바",false,1,2,150),
				  new Student("소자바",false,1,2,200),
				  new Student("나자바",false,1,3,290),
				  new Student("감자바",true,1,3,180),
				  
				  new Student("이지바",true, 1, 1,300),
				  new Student("김자바",false,1, 1,200),
				  new Student("안자바",true,1,2,100),
				  new Student("박자바",false,1,2,150),
				  new Student("소자바",false,1,2,200),
				  new Student("나자바",false,1,3,290),
				  new Student("감자바",true,1,3,180)
			};
		
		System.out.println("1. 단순분할 + 셩별로 분할");
		Map<Boolean, List<Student>> stuBySex = Stream.of(stuArr)
													 .collect(partitioningBy(Student::isMale));
		
		List<Student> maleStudent = stuBySex.get(true);
		List<Student> femaleStudent = stuBySex.get(false);
		
		for(Student s : maleStudent) System.out.println(s);
		for(Student s : femaleStudent) System.out.println(s);
		
		System.out.println("%n2. 단순분할 + 통계(성별 학생수)");
		Map<Boolean, Long> stuNumBySex = Stream.of(stuArr)
												.collect(partitioningBy(Student::isMale, counting()));
		
		System.out.println("남학생 수 : " + stuNumBySex.get(true));
		System.out.println("여학생 수 : " + stuNumBySex.get(false));
		
		System.out.println("%n3. 단순분할 : 통계(성별1등)");
		Map<Boolean, Optional<Student>> topScoreBySex = Stream.of(stuArr)
								.collect(partitioningBy(Student::isMale,maxBy(comparingInt(Student::getScore))));
		
		System.out.println("남학생 1등 : " + topScoreBySex.get(true));
		System.out.println("여학생 1등 : " + topScoreBySex.get(false));
		
		Map<Boolean, Student> topScoreBySex2 = Stream.of(stuArr)
				.collect(partitioningBy(Student::isMale,
						collectingAndThen(maxBy(comparingInt(Student::getScore)),Optional::get)));
		
		System.out.println("남학생 1등 :" + topScoreBySex2.get(true));
		System.out.println("여학생 1등 :" + topScoreBySex2.get(false));	
		
		System.out.println("%n4. 다중분할(성별 불합격자, 100점이하)");
		
		Map<Boolean, Map<Boolean, List<Student>>> failedStuBySex =
				Stream.of(stuArr).collect(partitioningBy(Student::isMale,
						partitioningBy(s->s.getScore()<=100)));
		
		List<Student> failedMaleStu = failedStuBySex.get(true).get(true);
		List<Student> failedFemaleStu = failedStuBySex.get(false).get(true);
		
		for(Student s : failedMaleStu) System.out.println(s);
		for(Student s : failedFemaleStu) System.out.println(s);
	}
}
