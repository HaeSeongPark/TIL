package ch8_Exception;

public class ChainedExceptionEx {
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
	// SpaceException와 MemoryException를  InstallException로 하나로 묶음(연결된 예외)
	// 상속으로도 할 수 있지만 SpaceException, MemoryException 상속관계를 고려해야 해서 힘듬.
	static void Install() throws InstallException{
		try {
			startInstall();
			copyFiles();
		} catch (SpaceException e) {
			InstallException ie = new InstallException("설치 중 예외 발생");
			ie.initCause(e);
			throw ie;
		} catch (MemoryException e) {
			InstallException ie = new InstallException("설치 중 예외 발생");
			ie.initCause(e);
			throw ie;
		}
	}
	
	static void startInstall() throws SpaceException, MemoryException{
		if(!enoughSpace())
			throw new SpaceException("설치할 공간이 부족합니다.");
		if(!enoughSpace()){
			throw new MemoryException("메모리가 부족합니다.");
//			throw new RuntimeException(new MemoryException("메모리가 부족합니다."));
//		 	checked예외를 unchecked예외로 바꿈
		}
	}
	
	static void copyFiles(){}
	static void deleteTmpFiles(){}
	
	static boolean enoughSpace() { return false; }
	static boolean enoughMemory() { return true; }
}

class InstallException extends Exception{
	InstallException(String msg){
		super(msg);
	}
}
