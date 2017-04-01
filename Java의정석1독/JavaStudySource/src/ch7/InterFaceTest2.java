package ch7;

interface Parseable{
	public abstract void parse(String fileName);
}

class XMLParser implements Parseable{
	@Override
	public void parse(String fileName) {
		System.out.println(fileName + "- XML parsing completed.");
	}
}
class HTMLParser implements Parseable{
	@Override
	public void parse(String fileName) {
		System.out.println(fileName + "-HTML parsing completed.");
	}
}

class ParseManager{
	public static Parseable getParser(String type){
		if(type.equals("XML")){
			return new XMLParser();
		}else{
			Parseable p = new HTMLParser();
			return p;
		}
	}
}

public class InterFaceTest2 {
	public static void main(String[] args) {
		Parseable parser = ParseManager.getParser("XML");
		parser.parse("document.xml");
		parser = ParseManager.getParser("HTML");
		parser.parse("documnet2.xml");
	}
}
