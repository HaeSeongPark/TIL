package ch5_array_Exercise;

/*
 * answer배열에 담긴 데이터를 읽고 각 숫자의 개수 만큼 '*'을 찍는 프로그램
 */

public class ch5_8 {
	public static void main(String[] args) {
		int[] answer = { 1,4,4,3,1,4,4,2,1,3,2 };
		int[] counter = new int[4];
		
		for(int i=0; i< answer.length; i++) 
			counter[answer[i]-1]++;             // counter[0] -> 1의개수 / counter[1] -> 2의개수
		
		for(int i=0; i < counter.length; i++)
		{
			System.out.print(counter[i]);
			for(int j=0; j < counter[i]; j++)
				System.out.print("*");
			
			System.out.println();
		}
	}
}
