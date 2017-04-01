package ch11;

import java.util.*;

public class HashSetEx1 {

	public static void main(String[] args) {
		Object[] objArr = {"1",new Integer(1),"2","2","3","3","4","4","4"};
		
		Set set = new HashSet();
		
		for(Object i : objArr)
			set.add(i);
		
		System.out.println(set);
	}

}
