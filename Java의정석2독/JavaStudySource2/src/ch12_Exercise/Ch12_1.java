package ch12_Exercise;

import java.util.ArrayList;

class Product{}

public class Ch12_1 {
	public static void main(String[] args) {
		
	}
	
	public static <T extends Product>ArrayList<T> merge(
			ArrayList<T> list,
			ArrayList<T> list2)
	{
		ArrayList<T> newList = new ArrayList<>(list);
		newList.addAll(list2);
		return newList;
	}
}
