package ch15_Exercise;

import java.io.*;

public class Ch15_5 {
	public static void main(String[] args) {
		if(args.length != 2){
			System.out.println("USAGE");
			System.exit(0);
		}
		
		String inputFile = args[0];
		String outputFile = args[1];
		
		try(BufferedReader input = new BufferedReader(new FileReader(inputFile));
			HtmlTagFilterWriter output = new HtmlTagFilterWriter(new FileWriter(outputFile)))
		{
			int ch = 0;
			
			while((ch=input.read())!=-1)
				output.write(ch);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

class HtmlTagFilterWriter extends FilterWriter{
	StringWriter tmp = new StringWriter();
	boolean inTag = false;
	 HtmlTagFilterWriter(Writer out) {
		super(out);
	}
	 
	public void write(int c) throws IOException{
		if(c=='<') inTag = true;
		else if(c=='>') {
			inTag = false;
			tmp = new StringWriter();
			return;
		}
		if(inTag){
			tmp.write(c);
		} else {
			out.write(c);
		}
		
	}
	
	public void close() throws IOException{
		// StringWriter에 내용이 남아있을 수 있으므로, 스트림을 닫기 전에 StringWriter의 내용을 스트림에 써주어야 한다.
		out.write(tmp.toString());
		super.close();
	}
	
}
