package ch9;

import java.util.StringJoiner;

public class StringEx5 {
	public static void main(String[] args) throws Exception {
		String str = "가";
		
		byte[] bArr = str.getBytes("UTF-8");//문자열을 UTF-8로 변환
		byte[] bArr2 = str.getBytes("CP949");
		
		System.out.println("UTF-8:"+joinByterArr(bArr));
		System.out.println("CP949:"+joinByterArr(bArr2));
		
		System.out.println("UTF-8:"+new String(bArr, "UTF-8"));
		System.out.println("CP949:"+new String(bArr2, "CP949"));
	}
	static String joinByterArr(byte[] bArr){
		StringJoiner sj = new StringJoiner(":","[","]");
		
		for(byte b : bArr)
			sj.add(String.format("%02X",b));
		return sj.toString();
	}
}
