package ch9_Exercise;

public class Ch9_8 {
	public static double round(double d, int n){
		// 3.1415
		// d * Math.pow(10,n) // 31.415
		// Math.round(d * Math.pow(10,n)); // 
		return Math.round(d * Math.pow(10,n)) / Math.pow(10,n);
	}
	public static void main(String[] args) {
		System.out.println(round(3.1415,1));
		System.out.println(round(3.1415,2));
		System.out.println(round(3.1415,3));
		System.out.println(round(3.1415,4));
		System.out.println(round(3.1415,5));
	}
}
