package ch7_oop2;

import static java.lang.Integer.*; // Integer 클래스의 모든 static 메서드
import static java.lang.Math.random; // Math.random()만 , 괄호 안 붙임
import static java.lang.System.out; // System.out을 out만으로 참조가능
import static java.lang.Math.PI;


public class StaticImportEx1 {
	public static void main(String[] args) {
//		System.out.println(Math.random());
		out.println(random());
		
//		System.out.println("Math.PI : " + Math.PI);
		out.println("Math.PI : " + PI);
		

	}
}
