package ch6_oop1;

public class StaticBlockTest {
	static int[] arr = new int[10];
	static int length = arr.length;
	
	static{
		for(int i=0; i<length; i++){
			arr[i] = (int)(Math.random()*length)+1;
		}
	}
	public static void main(String[] args) {
		for(int i=0; i<length; i++){
			System.out.printf("arr[%d] : %d%n",i,arr[i]);
		}
	}
}
