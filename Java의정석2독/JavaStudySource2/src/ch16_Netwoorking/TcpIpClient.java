package ch16_Netwoorking;

import java.net.*;
import java.io.*;

public class TcpIpClient {
	public static void main(String[] args) {
		
		String serverIp = "172.30.1.60";

		try(Socket socket = new Socket(serverIp, 7777);
			DataInputStream dis = new DataInputStream(socket.getInputStream())) {
			
			System.out.println("서버에 연결중입니다. 서버IP : " + serverIp);
			// 소켓을 생성하여 연결 요청
//			Socket socket = new Socket(serverIp, 7777);
			
			// 소켓의 입력 스트림을 얻는다.
//			InputStream in = socket.getInputStream();
//			DataInputStream dis = new DataInputStream(in);
			
			// 소켓으로 부터 받은 데이터를 출력
			System.out.println("서버로부터 받은 메시지 : " + dis.readUTF());
			System.out.println("연결을 종료합니다.");
			
			// 스트림과 소켓을 닫는다.
//			dis.close();
//			socket.close();
			System.out.println("연결이 종료됐습니다.");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
