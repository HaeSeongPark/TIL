package ch11_Collection_Framework;

public class AsciiPrint {
	public static void main(String[] args) {
		char ch = ' ';
		for(int i=0; i<95; i++){
			System.out.print(ch++);
		}
	}
}
