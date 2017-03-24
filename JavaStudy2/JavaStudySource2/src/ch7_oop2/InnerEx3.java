package ch7_oop2;

public class InnerEx3 {
	
	private int outerIv = 0;
	static int outerCv = 0;
	
	class InstanceInner{
		int iiv = outerIv;
		int iiv2 = outerCv;
	}
	
	static class StaticInner{
//		스태틱 클래스는 외부 클래스의 인스턴스멤버에 접근할 수 없다.
//		int siv = outerIv;
		static int scv = outerCv;
	}
	
	void myMethod(){
		int lv = 0;
		final int LV = 0; // JDK1.8부터 fianl 생략 가능
		
		class LocalInner{
			int liv = outerIv;
			int liv2 = outerCv;
//			외부 클래스의 지역변수는 fianl이 붙은 변수(상수)만 접근가능
			
			int liv3 = lv;      // JDK1.8 이전에는 에러
			int liv4 = LV;		// OK.
		}
	}
	public static void main(String[] args) {

	}
}
