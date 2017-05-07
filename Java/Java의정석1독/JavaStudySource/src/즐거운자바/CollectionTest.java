package 즐거운자바;

import java.util.*;

public class CollectionTest {
	public static void main(String[] args) {
//		Collection<String> coll = new ArrayList<>();
		Collection<String> coll = new HashSet<>();

		
		coll.add("kim");
		coll.add("lee");
		coll.add("kang");
		
		Iterator<String> iter = coll.iterator();
		
		while(iter.hasNext()){
			System.out.println(iter.next());
		}
	}
}
