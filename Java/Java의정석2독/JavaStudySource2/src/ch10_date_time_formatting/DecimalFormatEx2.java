package ch10_date_time_formatting;

import java.text.DecimalFormat;
import java.text.ParseException;

public class DecimalFormatEx2 {
	public static void main(String[] args) {
		DecimalFormat df = new DecimalFormat("#,###.##");
		DecimalFormat df2 = new DecimalFormat("#.###E0");
		DecimalFormat df3 = new DecimalFormat("#,###,###.##");

		try {
			Number num = df.parse("1,234,568.98");
			System.out.print(df3.format(num) + " -> ");
			
			double d = num.doubleValue();
			System.out.print(d + " -> ");
			
			System.out.println(df2.format(num));
		} catch (ParseException e) {
		}
	}
}
