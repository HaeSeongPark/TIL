package ch11_Collection_Framework;

import java.util.ArrayList;

public class ArrayListEx2 {
	public static void main(String[] args) {
		final int LIMIT = 10;
		String source = "0123456789abcdefghijABCDEFGHIJ!@#$%^&*()ZZZ";
		int sourceLength = source.length();
		
		ArrayList<String> list = new ArrayList<>(sourceLength/LIMIT+10);
		
		for(int i=0; i<sourceLength; i+=LIMIT){
			if(i+LIMIT<sourceLength)
				list.add(source.substring(i, i+LIMIT));
			else
				list.add(source.substring(i));
		}
		
		for(int i=0, length=list.size(); i<length; i++){
			System.out.println(list.get(i));
		}
	}
}
