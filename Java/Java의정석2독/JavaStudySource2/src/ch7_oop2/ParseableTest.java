package ch7_oop2;

interface Parseable{
	public abstract void parse(String fileName);
}

class ParserManager{
	public static Parseable getParser(String type){
		if(type.equals("XML")) return new XMLParser();
		else{
			Parseable p = new HTMLParser();
			return p;
		}
	}
}

class XMLParser implements Parseable{
	@Override
	public void parse(String fileName) {
		System.out.println(fileName + "- XML parsing completed");
	}
}

class HTMLParser implements Parseable{
	@Override
	public void parse(String fileName) {
		System.out.println(fileName + "-HTML parsing completed.");
	}
}

public class ParseableTest {
	public static void main(String[] args) {
		Parseable parser = ParserManager.getParser("XML");
		parser.parse("documnet.xml");
		parser = ParserManager.getParser("HTML");
		parser.parse("documnet2.xml");
	}
}
