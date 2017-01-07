package ch6;

class Document{
	static int count = 0;
	String DocuName;
	
	Document(){
		this("제목없음"+ ++count);
	}
	Document(String DocuName){
		this.DocuName = DocuName;
		System.out.println("문서 "+this.DocuName + "가 생성됐습니다.");
	}
}

public class InitializationBlockTest2 {
	public static void main(String[] args) {
		Document d1 = new Document();
		Document d2 = new Document();
		Document d3 = new Document("자바.txt");
		Document d4 = new Document();
	}
}
