package ch6Exercise;

public class Ch6_8 {
	int kind;
	int num;
	
	static int widht;
	static int height;
	
	Ch6_8(int k, int n){
		kind = k;
		num = n;
	}
	public static void main(String[] args) {
		Ch6_8 test = new Ch6_8(1,1);
	}

}
// 위 코드에 정의도니 변수들을 종류별로 구분해서 적으시오
// 클래스변수 (static 변수) : widht, height
// 인스턴스변수 kind , num
// 지역변수 args, test, k , n