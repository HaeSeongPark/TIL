package Ch14Exercise;

import java.util.*;
import java.util.stream.*;

public class Ch14_6 {

	public static void main(String[] args) {
		String[] strArr = {"aaa","bb","c","dddd"};
		Stream<String> strs1Stream = Stream.of(strArr);
		
		strs1Stream.map(String::length).sorted(Comparator.reverseOrder()).limit(1).forEach(System.out::println);
	}

}
