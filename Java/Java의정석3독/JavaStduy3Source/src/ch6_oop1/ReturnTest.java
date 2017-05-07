package ch6_oop1;

import java.util.Arrays;

public class ReturnTest {
	public static void main(String[] args) {
		int result = add(3,5);
		System.out.println(result);
		
		int[] result2 = {0};
		add(3,5,result2);
		System.out.println(result2[0]);
		
		int[] result3 = setArr();
		System.out.println(Arrays.toString(result3));
	}
	
	static int add(int a, int b){
		return a + b;
	}
	static void add(int a, int b, int[]result){
		result[0] = a + b;
	}
	
	static int[] setArr(){
		return new int[] {1,2,3,4,5};
	}
}
