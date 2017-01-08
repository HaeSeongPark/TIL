package ch6Exercise;

import java.util.Arrays;

public class Ch6_20 {
	
	static int[] shuffle(int[] shuffle)
	{
		for(int i=0; i< shuffle.length ; i++)
		{
			int ranNum = (int)Math.random()*shuffle.length;
			int tmp = shuffle[i];
			shuffle[i] = shuffle[ranNum];
			shuffle[ranNum] = tmp;
			
		}
		return shuffle;
	}
	
	public static void main(String[] args) {
		int[] original = {1,2,3,4,5,6,7,8,9};
		System.out.println(Arrays.toString(original));
		
		int [] result = shuffle(original);
		System.out.println(Arrays.toString(result));
		}
}

