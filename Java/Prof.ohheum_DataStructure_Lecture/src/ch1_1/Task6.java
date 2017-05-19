package ch1_1;

import java.util.Scanner;

/*
 * 사용자로부터 하나의 양의 정수 n을 입력받는다. n 보다 크거나 같으면서
 * 가장 작은 2의 거듭제곱수를 찾아서 출력하는 프로그램
 * n=12 2의 4승은 16
 */
public class Task6
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		
		int n = s.nextInt();
		int count = 0;
		int squareOfTwo = 1;
		while(n > squareOfTwo)
		{
			squareOfTwo*=2;
			count++;
		}
		
		System.out.printf("2의 %d승은 %d입니다.",count,squareOfTwo);
	}
}
