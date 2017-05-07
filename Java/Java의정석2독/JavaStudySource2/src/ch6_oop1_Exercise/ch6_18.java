package ch6_oop1_Exercise;

class MemberCall{
	int iv = 10;
	static int cv = 20;
	
	int iv2 = cv;
//	static int cv2 = iv;  // static변수는 인스턴스변수 사용 못함
	
	static void staticMethod1(){
		System.out.println(cv);
//		System.out.println(iv); // static메서드 인스턴스 변수 사용 못함
	}
	
	void instanceMethod1(){
		System.out.println(cv);
		System.out.println(iv);
	}
	
	static void staticMethod2(){
		staticMethod1();
//		instanceMethod1(); static메서드 인스턴스 메서드 사용 못함
	}
	
	void instanceMethod2(){
		staticMethod1();
		instanceMethod1(); 
	}
	/*
	 * static변수나 메서드는 인스턴스 변수나 메서드 사용 못함 static이 존재할 때 인스턴스가 존재하지 않을 수 있음.
	 * 꼭 사용하려면 객체를 생성 후 사용.
	 */
}

public class ch6_18 {

}
