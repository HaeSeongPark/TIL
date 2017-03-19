package ch6_oop1_Exercise;

/*
 * Student클래스에 두 개의 메서드 추가
 * 
 * 메서드명 : getTotal
 * 기능 : 국어 영어 수학의 점수를 모두더해서 반환
 * 반환타입 : int
 * 매개변수 없음
 * 
 * 메서드명 : getAverage
 * 기능 : 총점을 과목수로 나눈 평균, 소수점 둘째자리에서 반올림
 * 반환타입 float
 * 매개변서 없음
 */

public class ch6_4 {
	public static void main(String[] args) {
		Student s = new Student();
		s.name = "홍길동";
		s.ban = 1;
		s.no = 1;
		s.kor = 100;
		s.eng = 60;
		s.math = 76;
		
		System.out.println("이름:"+s.name);
		System.out.println("총점:"+s.getTotal());
		System.out.println("평균:"+s.getAverage());
	}
}
