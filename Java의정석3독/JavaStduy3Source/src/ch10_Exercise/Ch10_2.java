package ch10_Exercise;

import java.text.*;
import java.util.*;

public class Ch10_2 {
	static int paycheckCount(Calendar from, Calendar to){
		if(from==null || to==null) return 0;
		if(from.equals(to) || from.get(Calendar.DAY_OF_MONTH)==21) return 1;
		
		int fromMonthNum = (from.get(Calendar.YEAR)-1) * 12 + from.get(Calendar.MONTH);
		int toMonthNum = (to.get(Calendar.YEAR)-1) * 12 + to.get(Calendar.MONTH);
		
		int monDiff = toMonthNum - fromMonthNum;
		if(monDiff < 0)
			return 0;
		else if((from.get(Calendar.DAY_OF_MONTH)<=21)
				&& (to.get(Calendar.DAY_OF_MONTH) >= 21))
		{
			monDiff++;
		} else if((from.get(Calendar.DAY_OF_MONTH)>21)
				&& (to.get(Calendar.DAY_OF_MONTH) > 21))
		{
			monDiff--;
		}
		
		
		return monDiff;
	}

	static void printResult(Calendar from, Calendar to) {
		Date fromDate = from.getTime();
		Date toDate = to.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		System.out.print(sdf.format(fromDate) + " ~ " + sdf.format(toDate) + ":");
		System.out.println(paycheckCount(from, to));
	}

	public static void main(String[] args) {
		Calendar fromCal = Calendar.getInstance();
		Calendar toCal = Calendar.getInstance();

		fromCal.set(2010, 0, 1);
		toCal.set(2010, 0, 1);
		printResult(fromCal, toCal);

		fromCal.set(2010, 0, 21);
		toCal.set(2010, 0, 21);
		printResult(fromCal, toCal);

		fromCal.set(2010, 0, 1);
		toCal.set(2010, 2, 1);
		printResult(fromCal, toCal);

		fromCal.set(2010, 0, 1);
		toCal.set(2010, 2, 23);
		printResult(fromCal, toCal);

		fromCal.set(2010, 0, 23);
		toCal.set(2010, 2, 21);
		printResult(fromCal, toCal);

		fromCal.set(2011, 0, 22);
		toCal.set(2010, 2, 21);
		printResult(fromCal, toCal);

	}
}
