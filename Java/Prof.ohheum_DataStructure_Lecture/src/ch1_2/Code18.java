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
					// 메소드 쓸라고 좀 억지스럽긴 한데...지저분하고...
					// 프리미티어(기본)타입으로는 바꿀 수 없으니까
					// 배열로 간단히 아니면 객체만들어서 아래처럼
					// class data { int x; } 해서 data.x 뭐 이런식으로 하면 될 듯

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
