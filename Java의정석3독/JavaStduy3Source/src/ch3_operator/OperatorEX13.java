package ch3_operator;

public class OperatorEX13 {
	public static void main(String[] args) {
		char c1 = 'a';
		
//		char c2= c1+1;       변수가 있어 컴파일러가 미리 계산할 수 없음. 변수는 바뀔 수 있기 때문
		char c2 = 'a' + 1;
		/*
		 * c2 = (char)('a'+1);하지 않아도 되는 이유
		 * 위는 'a'+1이 리터럴 간의 연산이기 때문이다.
		 * 상수 또는 리터러 간의 연산은 실행과정동안 변하는 값이 아니기 때문에,
		 * 컴파일 시에 컴파일러가 계산해서 그 결과로 대체함으로써 코드를 보다 효율적으로 만든다.
		 * 
		 *  컴파일 전의 코드              컴파일 후의 코드
		 * char c2 = 'a'+1         char c2 = 'b';
		 * int sec = 60 * 60 *24;  int sec = 86400;
		 * 위 같은 경우 컴파일러가 미리 계산해주기 때문에 성능차이는 없다.
		 * 단지, 가독성을 위한 코드
		 */
	}
}
