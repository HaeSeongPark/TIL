package tryHelloWorld;

import java.util.Arrays;

public class ReverseInt {
	// String res = "";
	// public int reverseInt(int n){
	//   res = "";
	//   Integer.toString(n).chars().sorted().forEach(c -> res = Character.valueOf((char)c) + res);
	//   return Integer.parseInt(res);
	// }
	/*
	 *  String str = Integer.toString(n);
        char[] c = str.toCharArray();
        Arrays.sort(c);
        StringBuilder sb = new StringBuilder(new String(c,0,c.length));  
        return Integer.parseInt(((sb.reverse()).toString()));
	 */
	public int reverseInt(int n) {
//		char[] nChar = String.valueOf(n).toCharArray();
//		// Character
//		for (int i = 0; i < nChar.length - 1; i++) {
//			boolean changed = false;
//			for (int j = 0; j < nChar.length - 1 - i; j++) {
//				if (nChar[j] < nChar[j + 1]) {
//					char temp = nChar[j];
//					nChar[j] = nChar[j + 1];
//					nChar[j + 1] = temp;
//					changed = true;
//				}
//			}
//			if (changed == false) // !changed
//				break;
//		}
//
//		return Integer.valueOf(String.valueOf(nChar));
		
		char[] c = Integer.toString(n).toCharArray();
        Arrays.sort(c);
        StringBuilder sb = new StringBuilder(new String(c));  
        return Integer.parseInt((sb.reverse()).toString());
	}

	public static void main(String[] args) {
		ReverseInt ri = new ReverseInt();
		System.out.println(ri.reverseInt(118372));
	}
}
