package ch9_Exercise;

public class Ch9_3 {
	public static void main(String[] args) {
		String fullPath = "c:\\jdk1.8\\work\\PathSeparateTest.java";
		String path = "";
		String fileName = "";

		int idx = fullPath.lastIndexOf("\\");

		if (idx != -1) {
			path = fullPath.substring(0, idx);
			fileName = fullPath.substring(idx + 1);
//			fileName = fullPath.substring(idx + 1, fullPath.length());
		}

		System.out.println("fullPath:" + fullPath);
		System.out.println("path: " + path);
		System.out.println("fileName: " + fileName);
	}
}
