package ch2_variable;

public class PintEx1 {
	public static void main(String[] args) {
		byte b = 1;
		short s = 2;
		char c = 'A';
		
		int finger = 10;
		long big = 100_000_000_000L;
		long hex = 0xFFFF_FFFF_FFFF_FFFFL; // long hex = 0xFFFFFFFFFFFFFFFFL;
		
		int octNum = 010;  // 8진수로 10, 10진수로 8
		int hexNum = 0x10; // 16진수로 10, 10진수로 16
		int binNum = 0b10; // 2진수  10, 10진수
		
		int d = 5;
		
		System.out.printf("b=%d%n",b);
		System.out.printf("s=%d%n",s);
		System.out.printf("c=%c, %d%n",c,(int)c);
		System.out.printf("finger=[%"+d+"d]%n",finger);
		System.out.printf("finger=[%-5d]%n",finger);
		System.out.printf("finger=[%05d]%n",finger);
		System.out.printf("big=%d%n",big);
		System.out.printf("hex=%#x%n",hex); // '#'은 접두사(16진수 0x, 8진수 0)
		System.out.printf("ocNum=%o, %d%n",octNum,octNum);
		System.out.printf("hexNum=%x, %d%n",hexNum,hexNum);
		System.out.printf("binNum=%s, %d%n",Integer.toBinaryString(binNum),binNum);
	}
}
