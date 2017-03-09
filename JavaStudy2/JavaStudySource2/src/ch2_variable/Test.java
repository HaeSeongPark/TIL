package ch2_variable;

public class Test {
	public static void main(String[] args) {
		int i = 91234567; // 8자리의 10진수
		float f = (float)i;  // int를 float로 형변환
		int i2 = (int)f; // float를 다시 int로 형변환
		
		double d = (double)i; // int를 double로 형변환
		int i3 = (int)d;  // double을 다시 in로 형변환
		
		float f2 = 1.666f;
		int i4 = (int)f2;
		
		System.out.printf("i=%d\n",i);
		System.out.printf("f=%f i2=%d\n",f,i2);
		System.out.printf("d=%f i3=%d\n",d,i3);
		System.out.printf("(int)%f=%d\n",f2,i4);
		/*
		 *  i=91234567
			f=91234568.000000 i2=91234568
			d=91234567.000000 i3=91234567
			(int)1.666000=1
		 */
		
		// 주민번호 13자리를 숫자로 하려면
		// 123456 1234567 long
		
		long regNo = 1234561234567L; // L을 꼭붙여 줘야함 안 붙이면 int로 인식
		
		// 리터럴 : 100, 100L, 3.14f
		// 변수 : i, l
		// 키워드 : int long fianl float
		// 상수 : PI
		
//		a,d,e,g
// 		참조형변수와 같은 크기의 기본형 : 4byte인 것 : int float
	}
}
