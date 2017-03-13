package ch4_Exercise;

/*
 * for문을 while문으로 변경하시오.
 */

public class ch4_5 {
	public static void main(String[] args) {
//		for(int i=0; i<=10; i++){
//			for(int j=0; j<=i; j++)
//				System.out.print("*");
//			System.out.println();
//			
//		}
		
		int i=0, j=0;
		
		while(i<=10){
			j=0;
			while(j<=i){
				System.out.print("*");
				j++;
			}
			System.out.println();
			i++;
		}
	}
}
