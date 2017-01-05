package ch6;

class Tv6_1{
	String color;
	boolean power;
	int channel;
	
	void power() {power = !power;}
	void channelUp() {++channel;}
	void channelDown(){--channel;}
}

public class Ch6_1 {
	public static void main(String[] args) {
		Tv6_1 t = new Tv6_1();
		t.channel =7;
		t.channelDown();
		System.out.println("현재 채널은 "+t.channel+"입니다.");
	}
}
