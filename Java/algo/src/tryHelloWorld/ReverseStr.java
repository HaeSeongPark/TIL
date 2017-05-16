package tryHelloWorld;

import java.util.Arrays;

public class ReverseStr {
	public String reverseStr(String str){
		// String을 문자열로 변환
		char[] charStr = str.toCharArray();
		// 버블정렬
		for(int i=0; i<charStr.length; i++){
			boolean changed = false;
			for(int j=0; j<charStr.length-1-i; j++){
				if(charStr[j] < charStr[j+1]){
					char tmp = charStr[j];
					charStr[j] = charStr[j+1];
					charStr[j+1] = tmp;
					changed = true;
				}
			}
			if(!changed) break;
		}
		return new String(charStr);
		
		/*
		 * char[] charStr = str.toCahrArray();
		 * Arrays.sort(sol);  작은 것부터 큰 순으로 정렬
		 * return new StringBuider(new String(sol)).reverse.toString();   
		 * // char[]를 String으로 다시 StringBuider로 
		 * 작은 것부터  큰 순으로 정렬되 있는 것을 반대로(reverse) 후 String으로 리턴
		 */
	}

	// 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		ReverseStr rs = new ReverseStr();
		System.out.println( rs.reverseStr("Zbcdefg") );
	}
}