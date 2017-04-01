package ch10;

import java.text.*;

public class ChoiceFormatEx2 {
	public static void main(String[] args) {
		String pattern = "60#D|70#C|80<B|90#A";
		int[] scores = {91,90,80,88,70,52,60};
		
		ChoiceFormat form = new ChoiceFormat(pattern);
		
		for(int i=0; i<scores.length;i++)
			 System.out.println(scores[i]+":"+form.format(scores[i]));
	}
	/*
	 * 91:A
		90:A
		80:C
		88:B
		70:C
		52:D
		60:D
	 */
}
