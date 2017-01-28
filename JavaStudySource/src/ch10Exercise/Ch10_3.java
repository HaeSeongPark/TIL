package ch10Exercise;

import java.text.DecimalFormat;
import java.text.ParseException;

public class Ch10_3 {
	public static void main(String[] args) {
		String data = "123,456,789.5";
		DecimalFormat df = new DecimalFormat("#,###.##");
		DecimalFormat df2 = new DecimalFormat("#,####");
		
		try {
			Number num = df.parse(data);
			double d = num.doubleValue();
	
			System.out.println("data : " + data);
			System.out.println("반올림 : " + Math.round(d));
			System.out.println("만단위:"+df2.format(d));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
