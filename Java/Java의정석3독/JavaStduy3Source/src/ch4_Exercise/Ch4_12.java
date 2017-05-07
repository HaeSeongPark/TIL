package ch4_Exercise;

public class Ch4_12 {
	public static void main(String[] args) {
		// for(int i=1; i<=9; i++){
		// for(int j=1; j<=3; j++){
		// int x = j+(i-1)/3*3;
		// int y = i%3==0? 3 : i%3;
		// System.out.printf("%d*%d=%d\t",x,y,x*y);
		// }
		// System.out.println();
		// if(i%3==0)
		// System.out.println();
		// }
//		---------------------------------------
		// for(int i=2; i<=9; i+=3){
		// for(int j=1; j<=3; j++){
		// System.out.printf("%d*%d=%d\t %d*%d=%d\t
		// %d*%d=%d%n",i,j,i*j,i+1,j,(i+1)*j,i+2,j,(i+2)*j);
		// }
		// System.out.println();
		// }
//		------------------------------------------------
		for (int k=2; k<=9; k+=3) {
			for (int i = 1; i <= 3; i++) {
				int min = k, max = k+2;
				if(max==10) max=9;
				for (int j = min ; j <= max; j++) {
					System.out.printf("%d*%d=%d\t", j, i, j * i);
				}
				System.out.println();
			}
			System.out.println();
		}

	}
}
