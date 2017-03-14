package ch5_array_Exercise;
/*
 * 잘못된것과 이유
 * 
 * int[] arr[];
 * int[] arr = {1,2,3,};
 * int[] arr = new int[5];
 * int[] arr = new int[5]{1,2,3,4,5};
 * -> int[] arr = new int[]{1,2,3,4,5}; // 두 번째 대괄호[]에 숫자 넣으면 안 됨.
 * int arr[5]; // 선언할 때 크기 못 정함
 * 
 * int[] arr[] = new int[3][];
 * 
 */
public class ch5_1 {
	public static void main(String[] args) {
		
	}
}
