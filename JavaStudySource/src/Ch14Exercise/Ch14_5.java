package Ch14Exercise;

import java.util.*;
import java.util.stream.*;

public class Ch14_5 {

	public static void main(String[] args) {
		String[] strArr = {"aaa","bb","c","dddd"};
		
//		Stream<String> strs1Stream = Stream.of(strArr);
//		int sum2 =strs1Stream.mapToInt(s->s.length()).sum();
//		int sum2 =strs1Stream.mapToInt(String::length).sum();
		
		IntStream intStream = Stream.of(strArr).mapToInt(String::length);
		
		int sum= intStream.reduce(0, (a,b) -> a+b);
		
		System.out.println("sum = " + sum);
	}

}
