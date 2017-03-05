package ch15Exercise;

import java.io.*;

public class Ch15_5 {
	public static void main(String[] args) {
		if(args.length != 2){
			System.out.println("USAGE : java Exercise15_5 TAGET_FILE RESULT_FILE");
			System.exit(0);
		}
		
		String inputFile = args[0];
		String outputFile = args[1];
		
		try{
			BufferedReader input = new BufferedReader(new FileReader(inputFile));
			HtmlTagFilterWriter output = new HtmlTagFilterWriter(new FileWriter(outputFile));
			
			int ch = 0;
			
			while((ch=input.read())!=-1){
				output.write(ch);
			}
			
			input.close();
			output.close();
		}catch(Exception e){}
	}
}

class HtmlTagFilterWriter extends FilterWriter{
	StringWriter tmp = new StringWriter();
	boolean inTag = false;
	
	HtmlTagFilterWriter(Writer arg0) {
		super(arg0);
	}
	
	public void write(int c) throws IOException{
		
//		1.출력할 문자(c)가 '<'이면 inTag의 값을 true로 한다.
		if(c=='<') inTag = true;
//		2.출력할 문자(c)가 '>'이면 inag의 값을 false로 한다.
//		 새로운 StringWriter를 생성한다. (기존 StirngWriter의 내용을 버린다.)
		if(c=='>'){
			inTag = false;
			tmp = new StringWriter(); 
		}
//		3. inTag의 값이 true이면, StringWriter에 문자(c)를 출력하고
		if(inTag)
			tmp.write(c);
//		inTag의 값이 false이면, out에 문자(c)를 출력한다.
		else
			out.write(c);

		
	}
	public void close() throws IOException{
		out.write(tmp.toString());
		super.close();
	}
	
}
