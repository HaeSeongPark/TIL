package ch8_Exception;

public class FinallyTest {
	public static void main(String[] args) {
		try {
			startInstall();
			copyFiles();
//			deleteTempFiles();
		} catch (Exception e) {
//			deleteTempFiles();
		} finally {
			deleteTempFiles();
		}
	}
	
	static void startInstall(){}
	static void copyFiles(){}
	static void deleteTempFiles(){}
}
