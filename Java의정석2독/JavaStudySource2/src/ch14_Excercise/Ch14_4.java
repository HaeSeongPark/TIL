package ch14_Excercise;

import java.util.Arrays;
import java.util.stream.*;

public class Ch14_4 {
	public static void main(String[] args) {
		Stream<Integer> die = IntStream.rangeClosed(1, 6).boxed();
//		IntStream die = IntStream.rangeClosed(1, 6);
		die.flatMap(i->Stream.of(1,2,3,4,5,6).map(i2->new int[]{i,i2}))
			.filter(Arr -> Arr[0]+Arr[1]==6)
			.forEach(Arr -> System.out.println(Arrays.toString(Arr)));
	}
}
