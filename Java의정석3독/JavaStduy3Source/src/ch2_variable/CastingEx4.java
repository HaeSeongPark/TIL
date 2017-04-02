package ch2_variable;

public class CastingEx4 {
	public static void main(String[] args) {
		int i = 91234567; // 8자리의 10진수
		float f = (float)i; // int를 float로 형변환
		int i2 = (int)f;
		
		double d = (double)i; // int를 double로 형변환  // double d = i;
		int i3 = (int)d;
		
		float f2 = 1.666f;
		int i4 = (int)f2;
		
		System.out.printf("i=%d\n",i);  // i=91234567
		System.out.printf("f=%f i2=%d\n",f,i2);  // =9123 4568.000000 i2=91234568 
		// float는 10진수로 7자리의 정밀도라서 int 8자리 이상은 double로 해야함
		
		System.out.printf("d=%f i3 = %d\n",d,i3);
		System.out.printf("(int)%f=%d\n",f2,i4);
	}
}
