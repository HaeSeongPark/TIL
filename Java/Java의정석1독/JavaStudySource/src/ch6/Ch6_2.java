package ch6;

class Tv6_2{
	String color;
	boolean power;
	int channel;
	
	void power() {power = !power;}
	void channelUp() {++channel;}
	void channelDown() {--channel;}
}

public class Ch6_2 {
	public static void main(String[] args) {
		Tv6_2 t1 = new Tv6_2();
		Tv6_2 t2 = new Tv6_2();
		
		System.out.println("t1의 채널값은 "+t1.channel+"입니다.");
		System.out.println("t2의 채널값은 "+t2.channel+"입니다.");
		
		t1.channel = 7;
		System.out.println("t1의 채널값을 "+t1.channel+"로 변경");
		
		System.out.println("t1의 채널값은 "+t1.channel+"입니다. ");
		System.out.println("t2의 채널값은 "+t2.channel+"입니다.");
	}
}
