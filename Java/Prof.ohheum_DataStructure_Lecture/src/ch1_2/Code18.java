package ch1_2;

import java.util.Arrays;
import java.util.Scanner;

public class Code18
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int n = s.nextInt();
		int[] data = new int[n];
		
		for(int i=0; i<n; i++)
			data[i] = s.nextInt();
		
		s.close();
		
		bubbleSort(data, n);
		System.out.println(Arrays.toString(data));
	}
	static void bubbleSort(int[] data , int n)
	{
		for(int i=n-1; i>0; i--)
		{
			boolean isChanged = false;
			for(int j=0; j<i; j++)
			{
				if(data[j] > data[j+1])
				{
					// 함수 쓸라고 좀 억지스럽긴 한데...
					int[] a = { data[j] };
					int[] b = { data[j+1] };
					swap(a, b);
					data[j] = a[0];
					data[j+1] = b[0];
					isChanged = true;
				}
			}
			if(!isChanged)
				break;
		}
	}
	
	static void swap(int[] a , int[] b)
	{
		int tmp = a[0];
		a[0] = b[0];
		b[0] = tmp;
	}
}
