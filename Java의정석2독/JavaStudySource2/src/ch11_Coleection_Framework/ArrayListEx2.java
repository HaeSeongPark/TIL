package ch11_Coleection_Framework;

import java.util.ArrayList;
import java.util.List;

public class ArrayListEx2 {
	public static void main(String[] args) {
		final int LIMIT = 10;
		String source = "0123456789abcdefghijABCDEFGHIJ!@#$%^&*()ZZZ";
		int length = source.length();
		
		//크기를 여유있게
		List list = new ArrayList(length/LIMIT + 10);
		
		// source에서 LIMIT만큼 잘라서 list에 추가
		for(int i=0; i<length; i+=LIMIT){
			if(i+LIMIT<length){
				list.add(source.substring(i, i+LIMIT));
			} else{
				list.add(source.substring(i));
			}
		}
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i));
		}
	}
}
