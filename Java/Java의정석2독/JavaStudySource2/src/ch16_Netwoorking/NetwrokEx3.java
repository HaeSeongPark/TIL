package ch16_Netwoorking;

import java.net.*;

public class NetwrokEx3 {
	public static void main(String[] args) {
		URL url = null;
		String address = "http://www.codechobo.com/sample/hello.html";
		
		try {
			url = new URL(address);
			URLConnection conn = url.openConnection();
			
			System.out.println("conn.toString():"+conn);
			System.out.println("conn.getAllowUserInteraction()"+conn.getAllowUserInteraction());
			System.out.println("conn.getConnectTimeout()"+conn.getConnectTimeout());
			System.out.println("conn.getContentEncoding()"+conn.getContentEncoding());
			System.out.println("conn.getContentLength()"+conn.getContentLength());
			System.out.println("conn.getDate()"+conn.getDate());
			System.out.println("conn.getDefaultAllowUserInteraction()"+conn.getDefaultAllowUserInteraction());
			System.out.println("conn.getDefaultUseCaches()"+conn.getDefaultUseCaches());
			System.out.println("conn.getDoInput()"+conn.getDoInput());
			System.out.println("conn.getDoOutput()"+conn.getDoOutput());
			System.out.println("conn.getExpiration()"+conn.getExpiration());
			System.out.println("conn.getHeaderFields()"+conn.getHeaderFields());
			System.out.println("conn.getIfModifiedSince()"+conn.getIfModifiedSince());
			System.out.println("conn.getLastModified()"+conn.getLastModified());
			System.out.println("conn.getReadTimeout()"+conn.getReadTimeout());
			System.out.println("conn.getURL()"+conn.getURL());
			System.out.println("conn.getUseCaches()"+conn.getUseCaches());
			System.out.println("conn.getContent()"+conn.getContent());
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
