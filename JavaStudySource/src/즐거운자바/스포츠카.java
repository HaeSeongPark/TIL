package 즐거운자바;

public class 스포츠카 extends 자동차 {
	public void 터보(){
		System.out.println("터보!!");
	}
	//메소드이름이 같고, 파라미터의 수, 파라미터의 타입이 모드 같다면
	// 메소드 재정의(오버라이딩)  / 오버로딩은 이름만같은 새로운 메서드 생성
	public void 달리다(){
		System.out.println("후륜구동으로 달리다");
	}
}
