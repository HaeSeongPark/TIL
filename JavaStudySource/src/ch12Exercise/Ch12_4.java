package ch12Exercise;

import java.util.ArrayList;

class Product{}

public class Ch12_4 {
public static void main(String[] args) {
}
public static ArrayList<? extends Product> merge(
		ArrayList<? extends Product>list, ArrayList<? extends Product>list2){
	
	ArrayList<? extends Product> newList = new ArrayList<>(list);
	
//	newList.addAll(list2);
	return newList;
}

public static <T extends Product> ArrayList<T> merge2(ArrayList<T>list, ArrayList<T> list2){
	ArrayList<T> newList = new ArrayList<>(list);
	
	newList.addAll(list2);
	
	return newList;
}

}
