package ch16_Netwoorking;

import java.net.*;
import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;


public class TcpIpServer4 implements Runnable{
	ServerSocket serverSocket;
	Thread[] threadArr;
	
	public TcpIpServer4(int num){
		try {
			serverSocket = new ServerSocket(7777);
			System.out.println(getTime()+"서버가 준비됐습니다.");
			
			threadArr = new Thread[num];
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void start(){
		for(int i=0; i<threadArr.length; i++){
			threadArr[i] = new Thread(this);
			threadArr[i].start();
		}
	}
	
	public void run(){
		while(true){
			try {
				System.out.println(getTime()+"연결요청을 기다립니다.");
				
				// 서버소켓은 클라이언트의 연결요청이 올 때까지 실행을 멈추고 계속 기다린다.
				// 클라이언트의 연결요청이 오면 클라이언트 소켓과 통신할 새롱누 소켓을 생성
				Socket socket = serverSocket.accept();
				System.out.println(getTime()+socket.getInetAddress() + "로 부터 연결요청이 들어왔습니다.");
				
				//소켓의 출력스트림을 얻는다.
				OutputStream out = socket.getOutputStream();
				DataOutputStream dos = new DataOutputStream(out);
				
				// 원격 소켓에 데이터를 보낸다.
				dos.writeUTF("[Notice] Test message1 from Server.");
				System.out.println(getTime()+"데이터를 전송했습니다.");
				
				// 스트림과 소켓을 닫아준다.
				dos.close();
				socket.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		TcpIpServer4 server = new TcpIpServer4(5);
		server.start();
	}
	static String getTime(){
		String name = Thread.currentThread().getName();
		SimpleDateFormat df = new SimpleDateFormat("[hh:mm:ss]");
		return df.format(new Date()) + name;
	}
}
