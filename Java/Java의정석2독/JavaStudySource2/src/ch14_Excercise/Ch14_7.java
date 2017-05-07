package ch14_Excercise;

import java.util.Random;
import java.util.stream.IntStream;

public class Ch14_7 {
	public static void main(String[] args) {
		
		new Random().ints(1,46)
		.distinct()
		.limit(6)
		.sorted()
		.forEach(System.out::println);
	}
}
