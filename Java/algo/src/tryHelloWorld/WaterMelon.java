package tryHelloWorld;

public class WaterMelon {
	public String watermelon(int n) {
//		StringBuffer나 StringBuilder사용하기
		String result = "";
		for (int i = 1; i <= n; i++) {
			result += i%2!=0 ? "수" : "박"; 
		}
		return result;
//		return new String(new char [n/2+1]).replace("\0", "수박").substring(0,n);
	}

	// 실행을 위한 테스트코드입니다.
	public static void main(String[] args) {
		WaterMelon wm = new WaterMelon();
		System.out.println("n이 3인 경우: " + wm.watermelon(3));
		System.out.println("n이 4인 경우: " + wm.watermelon(4));
	}
}
/*
    public String watermelon(int n){
        StringBuffer sf = new StringBuffer();
        for (int i=1; i<=n; ++i) {
            sf.append(i%2==1?"수":"박");
        }
        return sf.toString();
}
*/