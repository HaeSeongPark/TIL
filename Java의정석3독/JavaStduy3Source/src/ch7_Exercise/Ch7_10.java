package ch7_Exercise;

class MyTv2{
	private boolean isPowerOn;
	private int channel;
	private int volume;
	private int prevChannel;
	
	
	final int MAX_VOLUME = 100;
	final int MIN_VOLUME = 0;
	final int MAX_CHANNEL = 100;
	final int MIN_CHANNEL = 1;
	
	public boolean isPowerOn() {
		return isPowerOn;
	}
	public void setPowerOn(boolean isPowerOn) {
		this.isPowerOn = isPowerOn;
	}
	public int getChannel() {
		return channel;
	}
	public void setChannel(int channel) {
		if( channel > MAX_VOLUME || channel < MIN_VOLUME) return;
		prevChannel = this.channel;
		this.channel = channel;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		if( volume > MAX_CHANNEL || volume < MIN_CHANNEL) return;

		this.volume = volume;
	}
	public void gotoPrevChannel(){
		setChannel(prevChannel);
	}
	
	
}

public class Ch7_10 {
	public static void main(String[] args) {
		MyTv2 t = new MyTv2();
		
		t.setChannel(10);
		System.out.println(t.getChannel());
		
//		t.setVolume(20);
//		System.out.println(t.getVolume());
		
		t.setChannel(20);
		System.out.println(t.getChannel());
		
		t.gotoPrevChannel();
		System.out.println(t.getChannel());
		
		t.gotoPrevChannel();
		System.out.println(t.getChannel());
	}
}
