package ch10_data_time_formatting;

import java.text.*;

public class ChoiceFormatEx1 {
	public static void main(String[] args) {
		// 낮은 값부터 순서대로 적어야 한다.
		double[] limits = { 60, 70, 80, 90 };
		// limits, grades간의 순서와 개수를 맞추어야 한다.
		String[] grades = { "D", "C", "B", "A"};
		
		int[] scores = { 100, 95, 70, 52, 60, 70 };
		
		ChoiceFormat form = new ChoiceFormat(limits,grades);
		for(int i=0; i<scores.length; i++){
			System.out.println(scores[i]+":"+form.format(scores[i]));
		}
	}
}
