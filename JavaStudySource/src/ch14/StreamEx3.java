package ch14;

import java.util.*;
import java.util.stream.*;

public class StreamEx3 {
	public static void main(String[] args) {
		Student3[] stuArr = { new Student3("이지바",3,300),
				  new Student3("김자바",1,200),
				  new Student3("안자바",2,100),
				  new Student3("박자바",2,150),
				  new Student3("소자바",1,200),
				  new Student3("나자바",3,290),
				  new Student3("감자바",3,180)
			};
		Stream<Student3> stuStream = Stream.of(stuArr);
		stuStream.sorted(Comparator.comparing(Student3::getBan)
								   .thenComparing(Comparator.naturalOrder()))
								   .forEach(System.out::println);
		stuStream = Stream.of(stuArr); // 스트림을 다시 생성
		IntStream stuScoreStream = stuStream.mapToInt(Student3::getTotalScore);
		
		IntSummaryStatistics stat = stuScoreStream.summaryStatistics();
		
		System.out.println("count="+stat.getCount());
		System.out.println("sum="+stat.getSum());
		System.out.printf("average=%.2f%n",stat.getAverage());
		System.out.println("min="+stat.getMin());
		System.out.println("max="+stat.getMax());
	}
}
class Student3 implements Comparable<Student3>{
	String name;
	int ban;
	int totalScore;
	Student3(String name, int ban, int totalScore){
		this.name = name;
		this.ban = ban;
		this.totalScore = totalScore;
	}
	public String toString(){
		return String.format("[%s, %d, %d]",name,ban,totalScore).toString();
	}
	
	String getName() { return name;}
	int getBan() { return ban; }
	int getTotalScore() { return totalScore;}
	
	//총점 내림차순을 기본 정렬로 한다.
	@Override
	public int compareTo(Student3 s){
		return s.totalScore - this.totalScore;
	}
	
}