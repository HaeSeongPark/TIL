package ch14_Excercise;

import java.util.stream.*;

public class Ch14_5 {
	public static void main(String[] args) {
		String[] strArr = { "aaa","bb","c","dddd"};
		Stream<String> strLength = Stream.of(strArr);
		IntStream s = strLength.mapToInt(String::length);
		System.out.println("sum="+s.sum());
	}
}
