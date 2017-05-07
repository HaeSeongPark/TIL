package ch14_Excercise;

import static java.util.stream.Collectors.*;

import java.util.Map;
import java.util.stream.Stream;

public class Ch14_9 {
	public static void main(String[] args) {
		Student[] stuArr = {
				new Student("나자바", true, 1, 1, 300),
				new Student("김지미",false, 1, 1, 250),
				new Student("이지미",true,1,1,200),
				new Student("남자바",true, 1,2,100),
				new Student("안지미",false, 1, 2, 50),
				new Student("황지미",false, 1, 3 ,100),
				new Student("강지미",false,1,3,150),
				new Student("이자마",true, 1, 3, 200),
				
				new Student("나자바", true, 2, 1, 300),
				new Student("김지미",false, 2, 1, 250),
				new Student("이지미",true,2,1,200),
				new Student("남자바",true, 2,2,100),
				new Student("안지미",false, 2, 2, 50),
				new Student("황지미",false, 2, 3 ,100),
				new Student("강지미",false,2,3,150),
				new Student("이자마",true, 2, 3, 200)
			};
		
		Map<Integer,Map<Integer,Long>> totalScoreByHakAndBan =
				Stream.of(stuArr).collect(groupingBy(Student::gethak,
						groupingBy(Student::getBan,summingLong(Student::getScore))
						));
		
		for(Object e : totalScoreByHakAndBan.entrySet()){
			System.out.println(e);
		}
	}
}
