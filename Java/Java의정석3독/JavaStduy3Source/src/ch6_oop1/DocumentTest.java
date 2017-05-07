package ch6_oop1;

class Document {
	static int count;
	String name;

	Document() {
		this("제목없음" + ++count);
	}

	Document(String name) {
		this.name = name;
		System.out.println("문서 " + this.name + " 가 생성됐습니다.");
	}
}

public class DocumentTest {
	public static void main(String[] args) {
		Document d1 = new Document();
		Document d2 = new Document("java.txt");
		Document d3 = new Document();
		Document d4 = new Document();
	}
}
