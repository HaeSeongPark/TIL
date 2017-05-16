package etc;

import java.util.Calendar;

public class GetDayName {
	public String getDayName(int a, int b)
    {	
		final String[] DAY_OF_WEEK = {"","SUN","MON","TUE","WED","THU","FRI","SAT"};
        Calendar date = Calendar.getInstance();
        
        date.set(2016, a-1,b);
        
        return DAY_OF_WEEK[date.get(Calendar.DAY_OF_WEEK)];
        
        /*
         *       Calendar cal = new Calendar.Builder().setCalendarType("iso8601")
                        .setDate(2016, month - 1, day).build();
        return cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, new Locale("ko-KR")).toUpperCase();
         */
    }
    public static void main(String[] args)
    {
    	GetDayName test = new GetDayName();
        int a=5, b=24;
        System.out.println(test.getDayName(a,b));
    }
}
