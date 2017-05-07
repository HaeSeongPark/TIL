package ch6_Exercise;

public class Ch6_21 {
	boolean isPowerOn;
	int channel;
	int volume;
	
	final int MAX_VOLUME = 100;
	final int MIN_VOLUME = 0;
	final int MAX_CHANNEL = 100;
	final int MIN_CHANNEL = 1;
	
	void turnOnOff(){
		isPowerOn = !isPowerOn;
	}
	
	void volumeUp(){
		if(volume < MAX_VOLUME)
			volume++;
	}
	
	void volumeDown(){
		if(volume > MIN_VOLUME)
			volume--;
	}
	
	void channelUp(){
		channel = (channel == MAX_CHANNEL) ? MIN_CHANNEL : ++channel;
	}
	
	void channelDown(){
		channel = (channel == MIN_CHANNEL) ? MAX_CHANNEL : --channel;

	}
	public static void main(String[] args) {
		Ch6_21 tv = new Ch6_21();
		tv.channel = 100;
		tv.volume = 0;
		System.out.println("CH:"+tv.channel + ", VOL:" + tv.volume);
		
		tv.channelDown();
		tv.volumeDown();
		System.out.println("CH:"+tv.channel + ", VOL:" + tv.volume);
		
		tv.volume = 100;
		tv.channelUp();
		tv.volumeUp();
		System.out.println("CH:"+tv.channel + ", VOL:" + tv.volume);
		
	}

}
