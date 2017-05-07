package ch10;

import java.text.*;

public class ChoiceFormatEx1 {
	public static void main(String[] args) {
		 double[] limits = {60, 70, 80, 90}; // 반드시 오름차순(->)
		///limits, grades간의 순서와 개수를 맞춰야 한다.
		 String[] grades = {"D","C","B","A"};
		
		int[] scores = {100,95,88,70,52,60,70};
		
		 ChoiceFormat form = new ChoiceFormat(limits,grades);
		 
		 for(int i=0; i<scores.length; i++){
			 System.out.println(scores[i]+":"+form.format(scores[i]));
		 }
	}
}
/*
		 *100:A
		95:A
		88:B
		70:C
		52:D
		60:D
		70:C
 
 */

