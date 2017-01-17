package ch8;

public class FinallyTest {
	
	static void startInstall(){}
	static void copyFiles(){}
	static void deleteTempFiles(){}
	
	public static void main(String[] args) {
		try {
			startInstall();
			copyFiles();
//			deleteTempFiles();
		} catch (Exception e) {
			e.printStackTrace();
//			deleteTempFiles();
		}finally{
			deleteTempFiles();
		}
	}
}
