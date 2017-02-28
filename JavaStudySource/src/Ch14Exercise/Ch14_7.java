package Ch14Exercise;
import java.util.*;
import java.util.stream.*;
public class Ch14_7 {
	public static void main(String[] args) {
		IntStream intStream = new Random().ints(6,1,46);    // 6개 1~45까지
		intStream.distinct().sorted().forEach(System.out::println);  // 중복제거   / 정렬 / 출력
		
		
	}
}
