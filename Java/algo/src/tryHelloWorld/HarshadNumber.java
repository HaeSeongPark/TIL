package tryHelloWorld;

public class HarshadNumber {
	public boolean isHarshad(int num) {
		if (num <= 0)
			return false;
		else {
			String isHarshad = String.valueOf(num);
			int sum = 0;
			for (int i = 0; i < isHarshad.length(); i++)
				sum += isHarshad.charAt(i) - '0';   // sum = sum + ( isHarshad.charAt(i) - '0' );
//			if (num % sum == 0)
//				return true;
//			else
//				return false;
			return num % sum == 0;
		}
	}

	// 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		HarshadNumber sn = new HarshadNumber();
		System.out.println(sn.isHarshad(18));
	}
}