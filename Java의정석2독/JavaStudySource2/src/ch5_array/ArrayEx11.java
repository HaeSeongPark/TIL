package ch5_array;

public class ArrayEx11 {
	public static void main(String[] args) {
		int[] numArr = new int[10];
		int[] counter = new int[10];
		
		for(int i = 0; i < numArr.length; i++){
			System.out.print(numArr[i] = (int)(Math.random()*10));
		}
		System.out.println();
		
		for(int i=0; i <numArr.length; i++){
			counter[numArr[i]]++;
		}
		
		for(int i=0; i < counter.length; i++){
			System.out.println( i + "ÀÇ °³¼ö : " + counter[i]);
		}
		char abc = '\u0000';
		System.out.println(abc);
	}
}
