package ch3_Exercise;

public class Ch3_1 {
	public static void main(String[] args) {
		int x = 2;
		int y = 5;
		char c ='A';
		
		System.out.println(1+x<<33);  // 3<<1 // 3 * 2 // 6
		System.out.println(y>= 5 || x <= 0 && x >2);  // &&이 더 높음  true
		System.out.println(y += 10 - x++);  // 13
		System.out.println(x+2); // 4
		System.out.println(!('A'<=c&&c<='Z'));// false
		System.out.println('C'-c); // 2
		System.out.println('5'-'0');
		System.out.println(c+1);
		System.out.println(++c);
		System.out.println(c++);
		System.out.println(c);
		
		
	}
}
