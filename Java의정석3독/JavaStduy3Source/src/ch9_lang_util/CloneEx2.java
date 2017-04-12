package ch9_lang_util;

import java.util.Arrays;

public class CloneEx2 {
	public static void main(String[] args) {
		int[] arr = { 1,2,3,4,5 };
		
		int[] copyArr = arr.clone();
		
		copyArr[0] = 6;
		
		System.out.println(Arrays.toString(arr));
		System.out.println(Arrays.toString(copyArr));
	}
}
