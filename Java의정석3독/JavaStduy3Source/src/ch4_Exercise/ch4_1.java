package ch4_Exercise;

public class ch4_1 {
	public static void main(String[] args) {
		// in형 변수 x가 10보다 크고 20보다 작을 때 true인 조건식
		/* 10 < x && x < 20
		 * 
		 * char형 변수 ch가 공백이나 탭이 아닐 때 true인 조건식
		 * !(ch==' ' || ch=='\t')   ch!=' ' && ch!='\t'
		 * 
		 * char형 변수 ch가 'x'또는 'X'일 때 true인 조건식
		 *  ch == 'x' && ch=='X'
		 *  
		 * char형 변수 ch가 숫자('0'~'9')일 때 true
		 * '0' <= ch && ch <= '9;
		 * 
		 * char형 변수 ch가 영문자(대소) 일때 true인 조건식
		 * ('a'<= ch && ch <= 'z') || ('A'<= ch && ch <= 'Z')
		 * 
		 * int형 변수 year가 400으로 나눠떨어지거나 4로 나눠떨어지고 100으로 나눠떨어지지 않을 때 true
		 * ( year % 400 == 0 ) || ( year % 4 == 0 && year % 100 !=0)
		 * 
		 * boolean형 변수 powerOn가 false일때 true인 조건식
		 * !powerOn
		 *
		 * 문자열 참조변수 str이 "yes"일  때 true인 조건식
		 *  str.equlas("yes")
		 */
	}
}
