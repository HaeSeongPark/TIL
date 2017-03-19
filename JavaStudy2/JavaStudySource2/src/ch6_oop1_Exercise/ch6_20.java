package ch6_oop1_Exercise;

public class ch6_20 {
	
	static int[] shuffle(int a[]){
		if(a == null || a.length ==0 )
			return a;
		
		int tmp = 0;
		for(int i=0; i<a.length; i++){
			int tmpIndex = (int)(Math.random() * a.length);
			
			tmp = a[i];
			a[i] = a[tmpIndex];
			a[tmpIndex] = tmp;
		}
		return a;
	}
	
	public static void main(String[] args) {
		int[] original = {1,2,3,4,5,6,7,8,9};
		System.out.println(java.util.Arrays.toString(original));
		
		int[] result = shuffle(original);
		System.out.println(java.util.Arrays.toString(result));
	}
}
