package ch8_exception;

public class ChainedExceptionEx {
	public static void main(String[] args) {
		try{
			Install();
		} catch(InstallException e){
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	static void Install() throws InstallException{
		try {
			startInstall();
			copyFiles();
		} catch (SpaceException e) {
			InstallException ie = new InstallException("설치 중 예외발생");
			ie.initCause(e);
			throw ie;
		} catch (MemoryException e2) {
			InstallException ie = new InstallException("설치 중 예외발생");
			ie.initCause(e2);
			throw ie;
		} finally{
			deleteTempFiles();
		}
	}
	
	static void startInstall() throws SpaceException, MemoryException{
		if(!enoughSpace()){
			throw new SpaceException("설치할 공간이 부족합니다.");
		}
		if(!enoughMemory()){
			throw new MemoryException("메모리가 부족합니다.");
//			throw newRuntimeException(new MemoryException("메모리가 부족합니다."));
		}
	}
	
	static void copyFiles(){}
	static void deleteTempFiles(){}
	
	static boolean enoughSpace() { return false; }
	static boolean enoughMemory() { return true; }
}

class InstallException extends Exception{
	InstallException(String msg){
		super(msg);
	}
}