package ch9;

public class StringEx3 {
	public static void main(String[] args) {
		//길이가 0인 char배열을 생성한다.
		char[] cArr = new char[0];
//		char[] cArr = {};
		
		String s = new String(cArr);
//		String s = new String("");
		
		System.out.println("cArr.length="+cArr.length);
		System.out.println("@@@"+s+"@@@");
	}
}
