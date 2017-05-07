package 즐거운자바;

public class MyBeanTest {
	public static void main(String[] args) {
//		MyBean mb = new MyBean();에서 아래로 바뀜, MyBean에서 인터페이스 exec메소드포함해서 추출하니까
		BeanInterface mb = new MyBean();
		mb.exec();
	}
}
