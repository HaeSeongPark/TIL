package ch9_lang_util;

public class StringBufferEx2 {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("01");
		StringBuffer sb2 = sb.append(23);
		sb.append('4').append(56);
		
		StringBuffer sb3 = sb.append(78);
		sb3.append(9.0);
		
		System.out.println("sb : " + sb);
		System.out.println("sb2 : " + sb2);
		System.out.println("sb3 : " + sb3);
	}
}
