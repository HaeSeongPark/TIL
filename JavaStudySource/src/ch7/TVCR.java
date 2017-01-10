package ch7;

class TvTVCR{
	boolean power;
	int channel;
	
	void power() { power = !power;}
	void channelUp() { ++channel;}
	void channelDown() { --channel;}
}
class VCR{
	boolean power;
	int counter = 0;
	void play(){ /*...*/}
	void stop(){ /*...*/}
	void rew(){ /*...*/}
	void ff(){ /*...*/}
}

public class TVCR extends TvTVCR{
	VCR vcr = new VCR();
	int counter = vcr.counter;
	
	void play() { vcr.play();}
	void stop() { vcr.stop();}
	void rew() { vcr.rew();}
	void ff() { vcr.ff();}
	
}
