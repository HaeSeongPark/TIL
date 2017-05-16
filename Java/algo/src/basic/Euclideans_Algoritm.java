package basic;

/*
 *  최대공약수를 빠르게 찾을 수 있는 알고리즘
 *  두 수를 m, n이라고 할 떄,
 *  1. r = m % n으로 나눈 나머지를 r이라 할 때,
 *  r == 0 ? r이 0이면 최대 공약수가 된다.
 *  r != 0 ? r이 0이 아니라면 m = n, n = r로 해서 1과정 반복
 */
public class Euclideans_Algoritm {
	// static int gcd(int a, int b){
	// // a를 큰 수로
	// if(a<b){
	// int tmp = a;
	// a = b;
	// b = tmp;
	// }
	// int r;
	// while(true){
	// r = a % b;
	// if(r==0) return b;
	// else{
	// a=b;
	// b=r;
	// }
	// }
	// }

	// 재귀호출 비효율적인 듯... a<b연산은 매번해줘야하고...
	// 반복문에 비해 알아보기 쉬운 것도 아니고
	// static int gcd(int a, int b){
	// int result = 0;
	// if(a<b){
	// int tmp = a;
	// a = b;
	// b = tmp;
	// }
	// int r = a % b;
	// if(r==0) result = b;
	// else gcd(b,r);
	//
	// return result;
	// }

	static int gcd(int a, int b) {
		if (b == 0) return a;
		return gcd(b, a % b);
	}

	// a * b == gcd(a,b) * lcm(a,b);
	static int lcm(int a, int b) {
		return a * b / gcd(a, b);
	}

	public static void main(String[] args) {
		System.out.println(Euclideans_Algoritm.gcd(87, 61));
		System.out.println(Euclideans_Algoritm.lcm(87, 61));
	}

}
