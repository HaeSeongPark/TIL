package ch4_Exercise;
/*
 * 1+(1+2)+(1+2+3)+(1+2+3+4)+...+(1+2+3+...+10)
 */
public class ch4_3 {

	public static void main(String[] args) {
		int sum=0;
		
		long startTime = System.currentTimeMillis();
		for(int i=1; i<11; i++){
			for(int j=1; j<=i; j++)
				sum+=j;
		}
		System.out.println(sum);
		System.out.println(System.currentTimeMillis()-startTime);
		
		
		sum = 0;
		int totalSum = 0;
		
		for(int i=1; i<=10; i++){
			sum +=i;
			totalSum += sum;
		}
		System.out.println(totalSum);
	}

}
