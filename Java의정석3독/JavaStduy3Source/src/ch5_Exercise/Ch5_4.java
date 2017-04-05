package ch5_Exercise;

public class Ch5_4 {
	public static void main(String[] args) {
		int[][] arr = {
				{ 5, 5, 5, 5, 5 },
				{ 10, 10, 10, 10, 10 },
				{ 20, 20, 20, 20, 20 },
				{ 30, 30, 30, 30, 30 },
		};
		
		int total = 0;
		float average = 0;
		
		for(int tmpArr[] : arr)
			for(int tmpInt : tmpArr)
				total+=tmpInt;
		
		average = (float)total / (arr.length * arr[0].length);
		
		System.out.println(total);
		System.out.println(average);
	}
}
