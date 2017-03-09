package ch3_operator_Excercise;

// 다음 연산의 결과를 적으시오

public class ch3_1 {
	public static void main(String[] args) {
		int x = 2;
		int y = 5;
		char c = 'A'; // 'A'의 문자코드 65
		
		System.out.println(1 + x << 33);
		// 우선순위 '+' > '<<'
		// 1. 1+x -> 3
		// 2. 3 << 33 -> 3 << 1      // 32면 그래도이므로 결과적으로 <<1한 결과...
		// 3. 0....11
		// 4. 0...110
		// 5. 6
		
		System.out.println(y >= 5 || x < 0 && x >2);
		// 우선순위  '&&'가 '||'보다 높음
		// 1. (x<0 && x>2)  -> 'x<0'부터 false이니까 'x>2'는 건너띰 -> false
		// 2. x >= 5 || false
		// 3. true 
		
		System.out.println( y+= 10 - x++);
		// 우선순위 단항 x++ 인데 후위니까 10 -x 먼저하고 x는 3이됨
		// y+= 8  -> y = y + 8;
		// 13
		
		System.out.println(x+=2);
		// x는 3이 된 상태에서 x = x + 2 이므로 
		// 5
		
		System.out.println(!('A' <= c && c <= 'Z'));
		// 가로 안부터 c가 A 이므로 true
		// !true
		// false
		
		System.out.println('C'-c);
		// 'C' - 'A'  char형의 연산이므로 int - int 로 변환됨
		// 아스키코드가 기억 안나지만 순서대로이므로, 세번째 - 첫번째이므로 2
		// A 65, B 66 C 67
		
		System.out.println('5'-'0');
		// char형 간의 연산 int형으로
		// 5 (int)
		// System.out.printf("%d",(int)'5'); // 53
		
		System.out.println(c+1);
		// char + int -> int + int
		// 65 + 1
		// 66(int)
		
		System.out.println(++c);
		// 증가(감)연산자는 형변환 없음
		// c 가 'A' 이므로 1증가하면 'B'
		
		System.out.println(c++);
		// System.out.println(c);
		// c++;
		// 이므로
		// B가출력되고 c는 'C'가 됨
		System.out.println(c); //B
	}
}
