package 즐거운자바;

public class DiceTest {
	public static void main(String[] args) {
		Dice dice = new Dice9();
		int value = dice.get();
		System.out.println(value);
	}
}
