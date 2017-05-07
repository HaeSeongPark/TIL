package ch9;

import java.util.Arrays;

public class CloneEx2 {
	public static void main(String[] args) {
		int[] arr = {1,2,3,4,5};
		
		int[] arrClone = arr.clone();
		
		int[] arrClone2 = new int[arr.length];
		System.arraycopy(arr, 0, arrClone2, 0, arr.length);
		
		System.out.println(Arrays.toString(arr));
		System.out.println(Arrays.toString(arrClone));
		System.out.println(Arrays.toString(arrClone2));
	}
}
