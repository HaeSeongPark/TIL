package ch14;

import java.util.*;
import java.util.stream.*;
import static java.util.stream.Collectors.*;

public class StreamEx6 {
	public static void main(String[] args) {
		Student[] stuArr = { 
				  new Student("������",3,300),
				  new Student("���ڹ�",1,200),
				  new Student("���ڹ�",2,100),
				  new Student("���ڹ�",2,150),
				  new Student("���ڹ�",1,200),
				  new Student("���ڹ�",3,290),
				  new Student("���ڹ�",3,180)
			};
		// �л� �̸��� �̾Ƽ� List<String>�� ����
		List<String> names = Stream.of(stuArr).map(Student::getName)
											  .collect(Collectors.toList());
		System.out.println(names);
		
		//��Ʈ���� �迭�� ��ȯ
		Student[] stuArr2 = Stream.of(stuArr).toArray(Student[]::new);
		
		for(Student s : stuArr2)
			System.out.println(s);
		
		//��Ʈ���� Map<String, Student>�� ��ȯ. �л� �̸��� key
		Map<String, Student> stuMap = Stream.of(stuArr)
											.collect(Collectors.toMap(s->s.getName(),p->p));
		for(String name : stuMap.keySet())
			System.out.println(name+"-"+stuMap.get(name));
		
		long count = Stream.of(stuArr).collect(Collectors.counting());
		long totalScore = Stream.of(stuArr)
								.collect(Collectors.summingInt(Student::getTotalScore));
		System.out.println("count="+count);
		System.out.println("totalScore="+totalScore);
		
		totalScore = Stream.of(stuArr)
						   .collect(reducing(0,Student::getTotalScore,Integer::sum));
		System.out.println("totalScore"+totalScore);
		
		Optional<Student> topStudent = Stream.of(stuArr)
											 .collect(Collectors.maxBy(Comparator.comparingInt(Student::getTotalScore)));
		System.out.println("topStudent="+topStudent.get());
		
		IntSummaryStatistics stat = Stream.of(stuArr)
										  .collect(summarizingInt(Student::getTotalScore));
		System.out.println(stat);
		
		String stuNames = Stream.of(stuArr)
								.map(Student::getName)
								.collect(joining(",","{","}"));
		System.out.println(stuNames);
								
	}
}