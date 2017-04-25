package ch_14_Lambda_Stream;

import java.util.*;
import java.util.stream.*;

public class StreamEx1 {
	public static void main(String[] args) {
		Stream<Student> studentStream = Stream.of(
				new Student("이지바",3,300),
				new Student("김자바",1,200),
				new Student("안자바",2,100),
				new Student("박자바",2,150),
				new Student("소자바",1,200),
				new Student("나자바",3,290),
				new Student("김자바",3,180)
				);
		studentStream.sorted(Comparator.comparing( Student::getBan)
				.thenComparing(Comparator.naturalOrder()))
				.forEach(System.out::println);
	}
}
class Student implements Comparable<Student>{
	String name;
	int ban;
	int totalScore;
	

	public Student() {
		super();
	}

	public Student(String name, int ban, int totalScore) {
		super();
		this.name = name;
		this.ban = ban;
		this.totalScore = totalScore;
	}
	
	public String toString(){
		return String.format("[%s, %d, %d]", name, ban, totalScore).toString();
	
	}
	
	
	
	public String getName() {
		return name;
	}

	public int getBan() {
		return ban;
	}

	public int getTotalScore() {
		return totalScore;
	}

	@Override
	public int compareTo(Student o) {
		return o.totalScore - this.totalScore;
	}
}