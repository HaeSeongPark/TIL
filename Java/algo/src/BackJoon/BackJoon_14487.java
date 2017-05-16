package BackJoon;

import java.util.Arrays;
import java.util.Scanner;

public class BackJoon_14487
{
	public static void main(String [] args)
	{
		Scanner s = new Scanner(System.in);
		
		int n = Integer.parseInt(s.nextLine());
		String str = s.nextLine();
		
		String[] arrString = str.split(" ");
		int[] arrInt = Arrays.stream(arrString).mapToInt(Integer::parseInt).toArray();
		
		Arrays.sort(arrInt);
		int sum = 0;
		
		for(int i=0; i<arrInt.length-1; i++)
			sum+=arrInt[i];
		
		System.out.println(sum);
	}
}
