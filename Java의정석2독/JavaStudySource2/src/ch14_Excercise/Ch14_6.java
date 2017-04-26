package ch14_Excercise;

import java.util.stream.Stream;

public class Ch14_6 {
	public static void main(String[] args) {
		String[] strArr = { "aaa", "bb", "c", "dddd" };
		Stream<String> strStream = Stream.of(strArr);
//		strStream.mapToInt(String::length).max();
		System.out.println(		strStream.mapToInt(String::length).max().getAsInt());
	}
}
