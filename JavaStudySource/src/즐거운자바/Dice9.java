package 즐거운자바;

public class Dice9 implements Dice {

	@Override
	public int get() {
		int value = (int)(Math.random()*9)+1;
		return value;
	}

}
