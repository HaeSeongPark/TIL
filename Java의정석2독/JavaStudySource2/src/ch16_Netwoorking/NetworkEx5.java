package ch16_Netwoorking;

import java.net.*;
import java.io.*;

public class NetworkEx5 {
	public static void main(String[] args) {
		URL url = null;
		InputStream in = null;
		FileOutputStream out = null;
		String address = "http://www.codechobo.com/sample/hello.html";
		
		int ch = 0;
		
		try {
			url = new URL("http://www.codechobo.com/sample/hello.html");
			in = url.openStream();
			out = new FileOutputStream("jav.zip");
			
			while((ch=in.read())!=-1){
				out.write(ch);
			}
			
			in.close();
			out.close();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
