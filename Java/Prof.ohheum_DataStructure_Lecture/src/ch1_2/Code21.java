package ch1_2;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Code21
{
	static int n;
	static int[][] grid;
	
	static void init() throws FileNotFoundException
	{
		Scanner inFile = new Scanner(new File("data.txt"));
		n = inFile.nextInt();
		grid = new int[n][n];
		for(int i=0; i<n; i++)
		{
			for(int j=0; j<n; j++)
			{
				grid[i][j] = inFile.nextInt();
			}
		}
		inFile.close();
	}

	public static void main(String [] args) throws FileNotFoundException
	{
		init();
		
		for ( int x = 0; x < n; x++ )
		{
			for ( int y = 0; y < n; y++ )
			{
				for ( int dir = 0; dir < 8; dir++ )
				{
					for ( int len = 1; len <= n; len++ )
					{
						int value = computeValue(x , y , dir , len);
						if ( value != -1 && isPrime(value) )
							System.out.println(value);
					}
				}
			}
		}
	}

	public static int computeValue(int x, int y, int dir, int len)
	{
		int value = 0;
		for ( int i = 0; i < len; i++ )
		{
			int digit = getDigit(x , y , dir , i);
			if ( digit == -1 )
				return -1;
			value = value * 10 + digit;
		}
		return value;
	}

	public static int getDigit(int x, int y, int dir, int k)
	{
		int [] offsetX = { 0 , 1 , 1 , 1 , 0 , -1 , -1, - 1 };
		int [] offsetY = { -1 , -1 , 0 , 1 , 1 , 1 , 0 , -1 };
		int newX = x+k*offsetX[dir];
		int newY = y+k*offsetY[dir];
		
//		int newX = x;
//		int newY = y;

//		switch ( dir )
//		{
//			case 0 : newY -= k; break;
//			case 1 : newX += k; newY -= k; break;
//			case 2 : newX += k; break;
//			case 3 : newX += k; newY += k; break;
//			case 4 : newX += k; break;
//			case 5 : newX -= k; newY += k; break;
//			case 6 : newX -= k; break;
//			case 7 : newX -= k; newY -= k; break;
//		}
		if ( newX < 0 || newY<0 || newX >= grid.length || newY >= grid.length )
			return -1;
		return grid[newX][newY];
	}
	
	public static boolean isPrime(int n)
	{
		if(n<2) return false;
		for(int i=2; i*i<=n; i++)
		{
			if(n%i==0) return false;
		}
		return true;
	}
/* 중복이 많네...흠...하...히...후...
 * 73은 나올 수 있는 경우가 하나인데도 2번 나오네
 * 흠...어렵다 어려워 너무 어렵다 수업 처음에 초급자를 위한 강의라고
 * 하셨는뎅 ㅜㅜ
*   631
	3
	3
	3
	3
	3
	31
	3
	3
	3
	13
	1543
	2
	2
	2
	2
	2
	2
	2
	2
	853
	83
	5
	5
	3
	5
	5
	5
	5
	5
	5
	5
	5
	53
	61
	67
	601
	5
	5
	5
	5
	53
	5
	5
	5
	503
	5
	4561
	47
	43
	5
	5
	5
	5
	5
	5
	5
	5
	5
	7
	73
	5
	7
	7
	7
	7
	7
	73
	7
	7
	7
	3
	37
	3
	3
	3
	3
	3
	3
	3
*/
}
