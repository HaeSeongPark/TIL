package tryHelloWorld;

public class PrintTriangle {
	public String printTriangle(int num) {
		String result="";
//		for (int i = 0; i < num; i++) {
//			for(int j=0; j <= i; j++){
//				result+="*";
//			}
//			result +='\n';
//		}
		String stars = "*";
		for(int i=0; i < num; i++){
			result+=stars+"\n";
			stars+="*";
		}
		return result;
	}

	// 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		PrintTriangle pt = new PrintTriangle();
		System.out.println(pt.printTriangle(3));
	}
}