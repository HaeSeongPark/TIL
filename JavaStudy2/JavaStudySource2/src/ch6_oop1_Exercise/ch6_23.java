package ch6_oop1_Exercise;

public class ch6_23 {
	
	static int max(int[] arr){
		if(arr == null || arr.length == 0)
			return -999999;
		int max = arr[0];
		for(int i=1; i < arr.length; i++){
			if(max < arr[i])
				max = arr[i];
		}
		return max;
	}
	
	public static void main(String[] args) {
		int[] data = {3,2,9,4,7};
		System.out.println(java.util.Arrays.toString(data));
		System.out.println("ÃÖ´ë°ª:"+max(data));
		System.out.println("ÃÖ´ë°ª:"+max(null));
		System.out.println("­C´ë°ª:"+max(new int[]{})); 
	}

}
