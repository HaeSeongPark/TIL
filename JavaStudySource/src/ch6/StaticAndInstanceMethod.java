package ch6;

class MyMath
{
		long a,b; 
		
		//인스턴스 변수 a, b만을 이용해서 작업하므로 매개변수가 필요없다
		long add(){return a+b;}  // 인스턴스 변수 a,b
		
		//인스턴스변수와 관계없이 매개변수만으로 작업이 가능
		static long add(long a, long b){return a+b;} //지역변수 a,b
}

public class StaticAndInstanceMethod {
	public static void main(String[] args) {
		//클래스 메서드 호출, 인스턴스 생성없이 호출가능
		System.out.println(MyMath.add(200L, 100L));
		
		MyMath myMath = new MyMath(); // 인스턴스 생성
        myMath.a=200L;
        myMath.b=100L;
        //인스턴스메서드는 객체생성 후에만 호출이 가능함.
        System.out.println(myMath.add());
	}
}
