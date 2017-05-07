package ch11_Collection_Framework;

import java.util.*;

public class Bingo
{

	public static void main(String [] args)
	{
		int [] [] board = new int [5] [5];
		// Set<Integer> set = new HashSet<>();
		Set<String> set = new HashSet<>();

		for ( int i = 0; set.size() < 25; i++ )
		{
			set.add(( int ) (Math.random() * 50) + 1 + "");
		}

		Iterator<String> it = set.iterator();

		for ( int i = 0; i < board.length; i++ )
		{
			for ( int j = 0; j < board[i].length; j++ )
			{
				board[i][j] = Integer.parseInt(( String ) it.next());
				System.out.print((board[i][j] < 10 ? "  " : " ") + board[i][j]);
			}
			System.out.println();
		}

	}

}
