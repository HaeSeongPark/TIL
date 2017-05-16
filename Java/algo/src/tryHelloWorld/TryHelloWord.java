package tryHelloWorld;

import java.util.Arrays;

public class TryHelloWord {
    public int[] gcdlcm(int a, int b) {
        int[] answer = new int[2];
        answer[0] = gcd(a,b);
        answer[1] = a * b / answer[0];
        return answer;
    }
    
    static int gcd(int p, int q){
    	if(q==0) return p;
    	return gcd(q, p%q);
    }
  
    // 아래는 테스트로 출력해 보기 위한 코드입니다.
    public static void main(String[] args) {
        TryHelloWord c = new TryHelloWord();
        System.out.println(Arrays.toString(c.gcdlcm(87, 61)));
    }
}