package ch9_lang;

import java.util.Arrays;

public class CloneEx2 {
	public static void main(String[] args) {
		int[] arr = {1,2,3,4,5};
		
		// 배열 arr을 복제해서 같은 내용의 새로운 배열을 만든다.
		int[] copyArr = arr.clone();
		
		System.arraycopy(arr, 0, copyArr, 0, arr.length);
		
		copyArr[0] = 6;
		
		System.out.println(Arrays.toString(arr));
		System.out.println(Arrays.toString(copyArr));
		
		
	}	
}
