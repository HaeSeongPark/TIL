package tryHelloWorld;
/*
 * 
 */

public class Collatz {
	public int collatz(int num) {
//		int i;
//		for( i=0; i<500; i++){
//			if(num==1) break;
//			if(num%2==0)  num /= 2;
//			else num = num * 3 + 1;
//		}
//		if(i==500) return -1;
//		return i;
//	------------------------------------------		
		for(int i=0; i<500; i++){
			if(num==1) return i;
			num = (num%2==0) ? num/2 : num*3+1;
		}
		return -1;
	}

	// 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		Collatz c = new Collatz();
		int ex = 6;
		System.out.println(c.collatz(ex));
	}
}
