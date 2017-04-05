package ch5_Exercise;

public class Ch5_3 {
	public static void main(String[] args) {
		int[] arr = { 10, 20, 30, 40, 50 };
		int sum = 0;
		
		for(int tmp : arr)
			sum+=tmp;
		
		System.out.println(sum);
	}
}
