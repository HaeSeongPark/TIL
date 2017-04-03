package ch3_operator;

import static ch3_operator.OperatorEx28.*;

public class OperatorEx30 {
	public static void main(String[] args) {
		int dec = 8;
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 0, dec >> 0, toBinaryString(dec>>0));
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 1, dec >> 1, toBinaryString(dec>>1));
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 2, dec >> 2, toBinaryString(dec>>2));
		
		System.out.printf("%d << %d = %4d \t%s%n",dec, 0, dec << 0, toBinaryString(dec<<0));
		System.out.printf("%d << %d = %4d \t%s%n",dec, 1, dec << 1, toBinaryString(dec<<1));
		System.out.printf("%d << %d = %4d \t%s%n",dec, 2, dec << 2, toBinaryString(dec<<2));
		System.out.println();
		
		dec = -8;
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 0, dec >> 0, toBinaryString(dec>>0));
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 1, dec >> 1, toBinaryString(dec>>1));
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 2, dec >> 2, toBinaryString(dec>>2));
		
		System.out.printf("%d << %d = %4d \t%s%n",dec, 0, dec << 0, toBinaryString(dec<<0));
		System.out.printf("%d << %d = %4d \t%s%n",dec, 1, dec << 1, toBinaryString(dec<<1));
		System.out.printf("%d << %d = %4d \t%s%n",dec, 2, dec << 2, toBinaryString(dec<<2));
		System.out.println();
		
		dec = 8;
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 0, dec >> 0, toBinaryString(dec>>0));
		System.out.printf("%d >> %d = %4d \t%s%n",dec, 32, dec >> 32, toBinaryString(dec>>32));
	}
}
