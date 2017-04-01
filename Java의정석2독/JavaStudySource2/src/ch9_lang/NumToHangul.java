package ch9_lang;

public class NumToHangul {
	public static String numToHangul(int intMoney) {
		String stringMoney = String.valueOf(intMoney);
		String[] number = { "", "ÀÏ", "ÀÌ", "»ï", "»ç", "¿À", "À°", "Ä¥", "ÆÈ", "±¸" };
		String[] unit = { "", "½Ê", "¹é", "Ãµ" };
		String[] unitM = { "", "¸¸", "¾ï", "Á¶", "°æ" };

		StringBuffer result = new StringBuffer();

		int len = stringMoney.length();

		for (int i = len - 1; i >= 0; i--) {
			int num = stringMoney.charAt(len - 1 - i) - 48;
			result.append(number[num]);
			if (num > 0)
				result.append(unit[i % 4]);
			if (i % 4 == 0)
				result.append(unitM[i / 4]);
		}
		return result.toString();
	}

	public static void main(String[] args) {
		System.out.println(numToHangul(10000));
	}
}
