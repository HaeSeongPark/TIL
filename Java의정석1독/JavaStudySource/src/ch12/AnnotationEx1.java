package ch12;

public class AnnotationEx1 {
}

class Parent{
	void parentMethod(){}
}
class Child extends Parent{
	@Override
//	void parentmethod(){}   에러 발생 조상 메서드으 일므을 잘못 적읍
	void parentMethod(){}
}