package ch11Exercise;

import java.util.*;

public class Ch11_10 {

	public static void main(String[] args) {
//		Set set = new HashSet();
		Set set = new LinkedHashSet();   // 방법1
		int[][] board =  new int[5][5];
		
		for(int i=0; set.size()<25; i++)
			set.add((int)(Math.random()*50)+1+"");
		/*방법2
		 * ArrayList list = new ArrayList(set);
		 * Collections.shuffle(list);
		 * Iterator it = list.iterator();
		 */
		
		Iterator it = set.iterator();
		
		for(int i=0; i<board.length; i++){
			for(int j=0; j<board[i].length; j++){
				board[i][j] = Integer.parseInt((String)it.next());
				System.out.print((board[i][j] <10 ? "  ": " ")+board[i][j]);
			}
			System.out.println();
		}
	}
	
	/*
	 * HashSet은 저장된 순서를 보장하지 않고 자체적인 저장 방식에 따라 순서가 결정 된다.
	 * 따라서 숫자가 잘 섞이지 않는다.
	 * 이 경우에는 순서를 유지하는 LinkedHashSet이 더 좋은 방법이다
	 */
}
