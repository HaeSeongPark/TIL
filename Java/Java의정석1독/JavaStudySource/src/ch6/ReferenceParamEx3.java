package ch6;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;

public class ReferenceParamEx3 {
	static void printArr(int[] arr)
	{
		System.out.println(Arrays.toString(arr));
	}
	static int sumArr(int[] arr)
	{
		int sum = 0;
		for(int i : arr) sum+=i;
		return sum;
//		return Arrays.stream(arr).sum();
		
	}
	static void sortArr(int[] arr)
	{	
		for(int i=0; i<arr.length-1; i++)
		{
			for(int j=0; j<arr.length-1-i;j++)
			{
				if(arr[j] < arr[j+1]){
					int tmp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = tmp;
				}
			}
		}
		
//		Arrays.sort(arr);
	}
	
	public static void main(String[] args) {
		int[] arr = {3,2,1,6,5,4};
		
		printArr(arr);
		sortArr(arr);
		printArr(arr);
		System.out.println("sum="+sumArr(arr));
	}
}
