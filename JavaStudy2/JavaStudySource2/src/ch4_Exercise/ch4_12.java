package ch4_Exercise;

/*
 * 구구단 출력...
 */

public class ch4_12 {
	public static void main(String[] args) {
		for(int i=1; i<=9; i++){
			for (int j=1;j<=3;j++){
				int x = j+(i-1)/3*3;
				int y= i%3==0? 3: i%3;
				
				if(x>9)
					break;
				
				System.out.printf("%d x %d = %d\t",x,y,x*y);
			}
			System.out.println();
			if(i%3==0)System.out.println();
		}
	}
}
