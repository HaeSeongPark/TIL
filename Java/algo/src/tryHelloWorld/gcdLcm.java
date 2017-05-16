package tryHelloWorld;

import java.util.Arrays;

class gcdLcm {

//	최대공약수 
//  최대공약수는 두 수중 작은 수보다 작거나 같기 때문에, 
//  작은 수를 1씩 감소시키면서 두 수와 나누어 떨어지는 수를 구하면 된다.
    static int gcd(int a, int b){
    	int result = 0;
    	int smaller = b < a ? b : a;
    	for(int i = smaller; i>0; i--){
    		if( (a % i == 0) && (b % i == 0) ){
    			result = i;
    			break;
    		}
    	}
    	return result;
    }
//  최소공배수
//  최소공배수는 두 수중 큰 수보다 크거나 같기 때문에,
//  큰 수를 1씩 증가하면서 두 수로 나누어 떨어지는 수를 구하면 된다.
    static int lcm(int a, int b){
    	int result = 0;
    	int bigger = a > b ? a : b;
    	
    	while(true){
    		if( (bigger % a == 0) && (bigger % b == 0)){
    			result = bigger;
    			break;
    		}
    		bigger++;
    	}
    	return result;
    }

    // 아래는 테스트로 출력해 보기 위한 코드입니다.
    public static void main(String[] args) {
    	System.out.println(gcdLcm.gcd(87, 61));
    	System.out.println(gcdLcm.lcm(87, 61));
    }
}