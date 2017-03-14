package ch5_array_Exercise;

public class ch5_3 {
	public static void main(String[] args) {
		int[] arr = { 10, 20, 30, 40, 50 };
		int sum = 0;
		
		for(int i=0; i<arr.length; i++)
			sum+= arr[i];
		
		System.out.println("sum="+sum);
	}
}
