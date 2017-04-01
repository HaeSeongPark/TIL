package ch4_Exercise;

/*
 * 1부터 20까지의 정수 중에서 2 또는 3의 배수가 아닌 수의 총합을 구하시오.
 */
public class ch4_2 {
	public static void main(String[] args) {
		int sum=0;  // 총합
		
//		for(int i=1; i<21; i++)  {  // 1부터 20까지 반복
//			if(i%2==0 || i%3==0)
//				continue;
//			System.out.println(i);
//			sum+=i;
//		}
		for(int i=1; i<21; i++)
		{
			if(i%2!=0 && i%3!=0){
				sum+=i;
				System.out.println(i);
			}
		}
		System.out.println(sum);
		
	}
}
