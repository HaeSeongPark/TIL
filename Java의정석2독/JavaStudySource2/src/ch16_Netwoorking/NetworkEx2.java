package ch16_Netwoorking;

import java.net.*;

public class NetworkEx2 {
	public static void main(String[] args) throws Exception{
		URL url = new URL("http://www.codechobo.com:80/sample/"+
				"hello.html?referer=javachobo#index1");
		
		System.out.println("url.getAuthority():"+url.getAuthority());
		System.out.println("url.getDefaultPort():"+url.getDefaultPort());
		System.out.println("url.getProt():"+url.getPort());
		System.out.println("url.getFile():"+url.getFile());
		System.out.println("url.getHos(0:"+url.getHost());
		System.out.println("url.getPath():"+url.getPath());
		System.out.println("url.getProtocol():"+url.getProtocol());
		System.out.println("url.getQuery():"+url.getQuery());
		System.out.println("url.getRef():"+url.getRef());
		System.out.println("url.getUserInfo():"+url.getUserInfo());
		System.out.println("url.toExternalFrom():"+url.toExternalForm());
		System.out.println("url.toURI():"+url.toURI());
		System.out.println("url.getConetent():"+url.getContent());
	}

}
