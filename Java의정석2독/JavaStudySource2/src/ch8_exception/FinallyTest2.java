package ch8_exception;

public class FinallyTest2 {
	public static void main(String[] args) {
		try {
			startInstall();
			copyFiles();
//			deleteTempFiles();
		} catch (Exception e) {
			e.printStackTrace();
//			deleteTempFiles();
		} finally {
			deleteTempFiles();
		}
	}
	static void startInstall(){}
	static void copyFiles(){}
	static void deleteTempFiles(){}
}
