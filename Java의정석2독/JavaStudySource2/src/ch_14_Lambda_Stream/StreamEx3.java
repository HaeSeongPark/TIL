package ch_14_Lambda_Stream;

import java.util.*;
import java.util.stream.*;

public class StreamEx3 {
	public static void main(String[] args) {
		Student[] stuArr = { 
				new Student("이지바",3,300),
				  new Student("김자바",1,200),
				  new Student("안자바",2,100),
				  new Student("박자바",2,150),
				  new Student("소자바",1,200),
				  new Student("나자바",3,290),
				  new Student("감자바",3,180)
			};
		
		Stream<Student> stuStream = Stream.of(stuArr);
		stuStream.sorted(Comparator.comparing(Student::getBan)
								   .thenComparing(Comparator.naturalOrder()))
								   .forEach(System.out::println);
		stuStream = Stream.of(stuArr);
		IntStream stuScoreStream = stuStream.mapToInt(Student::getTotalScore);
		
		IntSummaryStatistics stat = stuScoreStream.summaryStatistics();
		
		System.out.println("count="+stat.getCount());
		System.out.println("sum="+stat.getSum());
		System.out.printf("average=%.2f%n",stat.getAverage());
		System.out.println("max="+stat.getMax());
		System.out.println("min="+stat.getMin());
		
	}
}
