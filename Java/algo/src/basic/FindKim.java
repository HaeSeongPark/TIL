package basic;

import java.util.*;
import java.util.ArrayList;

public class FindKim {
	public String findKim(String[] seoul) {
		// x에 김서방의 위치를 저장하세요.
		int x = 0;
		
//		for (int i = 0; i < seoul.length; i++) {
//			if("Kim".equals(seoul[i])){
//				x = i;
//				break;
//			}
//		}

		x = Arrays.asList(seoul).indexOf("Kim");

		return "김서방은 " + x + "에 있다";
	}

	// 실행을 위한 테스트코드입니다.
	public static void main(String[] args) {
		FindKim kim = new FindKim();
		String[] names = { "Queen", "Tod", "Kim" };
		System.out.println(kim.findKim(names));
	}
}
