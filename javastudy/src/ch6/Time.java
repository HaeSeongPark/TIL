package ch6;

public class Time {
	private int hour;
	private int minute;
	private float second;
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		if(hour<0 || hour> 23)
			return;
		this.hour = hour;
	}
	public int getMinute() {
		return minute;
	}
	public void setMinute(int minute) {
		if(minute<0  || minute>59)
			return;
		this.minute = minute;
	}
	public float getSecond() {
		return second;
	}
	public void setSecond(float second) {
		if(second<0.0f || second>59.9f)
			return;
		this.second = second;
	}
	/*
	 *  시간의 차를 구하는 메서드와 같이 시간과 관련된 메서드를 추가로
	 * 정의하여 time클래스를 향상시켜 보기
	 */
	
}
