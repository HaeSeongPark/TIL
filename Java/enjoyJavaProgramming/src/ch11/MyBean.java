package ch11;

// MyBean은 ch11 패키지에 속해 있다.
// package안에 클래스르 만든다면 반드시 첫 번째 줄에
// package 해당 클래스가 속해있는 패키지명이 있어야 한다.
// package가  있는 소스는 컴파일할 때 -d 옵션을 줘야한다
// javac -d 패키지가생성될경로 소스명
// javac -d c:/tmp 소스명.java
// tmp아래에 ch11이 생기고 클래스 파일이 생긴다

// JVM은 CLASSPATH에 잡혀있는 클래스들을 사용할 수 있다.
// CLASSPATH는 ch11폴더가 있는 경로가 설정돼 있어야 JVM에서 사용할 수 있다.
public class MyBean
{
	protected int protectedInt; // 필드, 인스턴스 변수
	public int publicInt;
	private int privateInt;
	int defaultInt;
	public MyBean()
	{
		this.privateInt = 100;
		// 중복된 이름이 없다면
//		privateInt = 100;
	}
	
	/*
	 * public : 어디서든 접근 가능
	 * protected : 같은 package, 다른 package지만 상속받은 자식
	 * default : 같은 패키지
	 * private : 해당 클래스 안에서만
	 * 필드나 메소드 등에 붙일 수 있다.
	 */
	
	
}
