package ch16;

import java.net.*;

public class NetworkEx2 {
	public static void main(String[] args) throws Exception{
		URL url = new URL("http://www.codechobo.com:80/sample/"+"hello.html?referer=javachobo#index1");
		
		System.out.println("url.getAuthority() : " + url.getAuthority());
		System.out.println(url.getContent());
		System.out.println(url.getDefaultPort());
	}
}
