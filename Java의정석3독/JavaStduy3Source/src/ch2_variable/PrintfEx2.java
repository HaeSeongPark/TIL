package ch2_variable;

public class PrintfEx2 {
	public static void main(String[] args) {
		String url = "www.codechobo.com";
		
		float f1 = .10f; // 0.10, 1.0-1
		float f2 = 1e1f; // 10.0, 1.0e1, 1.0e+1
		float f3 = 3.14e3f;
		double d = 1.23456789;
//													     실수 소수점 6자리 /  지수형태    /  간략히
		System.out.printf("f1=%f, %e, %g%n",f1,f1,f1); // f1=0.100000, 1.000000e-01, 0.100000
		System.out.printf("f2=%f, %e, %g%n",f2,f2,f2); // f2=10.000000, 1.000000e+01, 10.0000
		System.out.printf("f3=%f, %e, %g%n",f3,f3,f3); // f3=3140.000000, 3.140000e+03, 3140.00
		
		// %f는 기본적으로 소수점 이하 6자리까지만 출력하기 때문에 소수점 이하 7자리에서 반올림
		System.out.printf("d=%f%n",d); 
		
		// 전체 14자리 중 소수점 10자리  소수점(.)도 한자리 차지
		// 빈 공간은 소수점 이하는 0, 정수는 공백으로  채움 
//		                                          12345678901234  
		System.out.printf("d=%14.10f%n",d);  // d=  1.2345678900
		System.out.printf("d=%014.10f%n",d); // d=001.2345678900
		
		System.out.printf("[12345678901234567890]%n");
		System.out.printf("[%s]%n",url);  // 문자열의 길이만큼 출력공간을 확보한다.
		System.out.printf("[%20s]%n",url); // 최소 20글자 출력공간 확보(우측정렬)
		System.out.printf("[%-20s]%n",url); // 최소 20글자 출력공간 확보(좌측정렬)
		System.out.printf("[%.8s]%n",url); // 왼쪽에서 8글자만 출력
		
		// 기본적으로 지정된 숫자보다 길이가 작으면 빈자리는 공백으로 하고 우측정렬
		// '-'를 붙이면 좌측 정렬
		// '.'을 붙이면 문자열의 일부만 출력가능
	}
}
