package ch8_Exception;

public class NewExceptionTest {
	public static void main(String[] args) {
		try {
			startInstall();
			copyFiles();
		} catch (SpaceException e) {
			System.out.println("에러 메시지 : " + e.getMessage());
			e.printStackTrace();
		} catch (MemoryException e) {
			System.out.println("에러 메시지 : " + e.getMessage());
			e.printStackTrace();
			System.gc();
			System.out.println("다시 설치를 시도해주세요");
		}
	}
	
	static void startInstall() throws SpaceException, MemoryException{
		if(!enoughSpace())
			throw new SpaceException("설치할 공간이 부족합니다.");
		if(!enoughSpace()){
			throw new MemoryException("메모리가 부족합니다.");
		}
	}
	
	static void copyFiles(){}
	static void deleteTmpFiles(){}
	
	static boolean enoughSpace() { return false; }
	static boolean enoughMemory() { return true; }
}



class SpaceException extends Exception{
	SpaceException(String msg){
		super(msg);
	}
}

class MemoryException extends Exception{
	MemoryException(String msg){
		super(msg);
	}
}