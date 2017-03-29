package ch9_lang;

public class StringBufferEx1 {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("abc");
		StringBuffer sb2 = new StringBuffer("abc");
		
		System.out.println("sb == sb2 ? " + (sb == sb2));
		System.out.println("sb.equals(sb2) ? " + sb.equals(sb2));
		
		// StringBuffer의 내용을 String으로 변환
		
		String s = sb.toString();
		String s2 =sb2.toString();
		
		System.out.println("s.equlas(s2) ? " + s.equals(s2));
	}
}
