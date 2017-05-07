package ch7_oop2;
public class TimeTest {
	public static void main(String[] args) {
		Time t = new Time(12,35,30);
		System.out.println(t);
//		t.hour = 13 ;  // error, 변수 hour의 접근 제어자가 private이므로 접근 불가
		t.setHour(t.getHour()+1);
		System.out.println(t);
	}
}
