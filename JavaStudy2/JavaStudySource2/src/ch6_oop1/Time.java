package ch6_oop1;

public class Time {
	private int hour;
	private int minute;
	private float second;
	
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		if(hour < 0 || hour > 23)
			return;
		this.hour = hour;
	}
	public int getMinute() {
		return minute;
	}
	public void setMinute(int minute) {
		if( minute < 0 || minute > 59)
			return;
		this.minute = minute;
	}
	public float getSecond() {
		return second;
	}
	public void setSecond(float second) {
		if ( second < 0.0f || second > 59.99f)
			return;
		this.second = second;
	}
	
	public StringBuffer diffTime(Time time){
		StringBuffer diffTime = null;
		diffTime.append(this.hour - time.hour + "h")
				.append(this.minute - time.minute +"m")
				.append(this.second - time.second +"s");                                                                                                                 
		return diffTime;
	}
}
