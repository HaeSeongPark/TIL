package ch5_Array;

import java.util.Arrays;

public class ArrayEx11 {
	public static void main(String[] args) {
		int[] numArr = new int[10];
		int[] counter = new int[10];
		
		for(int i=0; i<numArr.length; i++){
			numArr[i] = (int)(Math.random()*10);
			System.out.print(numArr[i]);
		}
		System.out.println();
		
		for(int i=0; i<numArr.length; i++){
			counter[numArr[i]]++;
		}
		
		System.out.println(Arrays.toString(counter));
		for(int i=0; i<counter.length; i++){
			System.out.printf("%dÀÇ °³¼ö : %d%n",i, counter[i]);
		}
	}
}
