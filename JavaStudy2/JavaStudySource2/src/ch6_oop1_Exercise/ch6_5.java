package ch6_oop1_Exercise;

/*
 * Student클래스에 생성자와 infor()를 추가하시오.
 * 
 */

public class ch6_5 {
	public static void main(String[] args) {
		Student s = new Student("홍길동",1,1,100,60,76);
		System.out.println(s.info());
	}
}
