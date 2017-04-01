package 즐거운자바;

public class Test2 {
	public static void main(String[] args) {
		만능상자 box = new 만능상자();
		
		버스 b = new 버스();
		
		box.set(b);
		
		//형변환
		// box에서 나온 것은 버스이지만
		//Object가 가지고 있는 메서드만 사용가능
		
		Object o2 = box.get();
		
		//형변환하여 꺼내기
		//원래 넣었던 것이 버스라서 가능!
		버스 b2 = (버스)box.get();
	}
}
