package ch1_1;

import java.util.Arrays;
import java.util.Scanner;

/*
 * 사용자로부터 n개의 정수를 입력받은 후 오름차순으로
 * 정렬(sort)하여 출력하는 코드이다.
 */

public class Code14
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		int input = s.nextInt();
		int [] data = new int [input];

		for ( int i = 0; i < input; i++ )
			data[i] = s.nextInt();

		s.close();
		
		// 버블정렬
		for ( int i = input-1; i>0; i-- )
		{
			boolean isChanged = false;
			for ( int j = 0; j < i; j++ )
			{
				if ( data[j] > data[j + 1] )
				{
					int tmp = data[j];
					data[j] = data[j+1];
					data[j+1] = tmp;
					isChanged = true;
				}
			}
			if(!isChanged)
				break;
		}
		System.out.println("최종"+Arrays.toString(data));
	}
}
