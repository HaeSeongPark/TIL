package ch8;

public class ChainedException {
	public static void main(String[] args) {
		try {
			install();
		} catch (InstallException e) {
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	static void install() throws InstallException{
		try {
			startInstall();
			copyFiles();
		} catch (SpaceException2 e) {
			InstallException ie = new InstallException("설치 중 예외발생");
			ie.initCause(e);
			throw ie;
		} catch(MemoryException2 e2){
			InstallException ie = new InstallException("설치 중 예외발생");
			ie.initCause(e2);
			throw ie;
		}finally{
			deleteTemppFiles();
		}
	}
	
	static void startInstall() throws SpaceException2, MemoryException2{
		if(!enoughSpace())
			throw new SpaceException2("설치할 공간이 부족합니다.");
		if(!enoughMemory())
			throw new MemoryException2("메모리가 부족합니다.");
		
	}
	
	static void copyFiles(){}
	static void deleteTemppFiles(){}
	
	static boolean enoughSpace(){
		return false;
	}
	static boolean enoughMemory(){
		return false;
	}
}

class InstallException extends Exception{
	InstallException(String msg){
		super(msg);
	}
}

class SpaceException2 extends Exception{
	SpaceException2(String msg){
		super(msg);
	}
}
class MemoryException2 extends Exception{
	MemoryException2(String msg){
		super(msg);
	}
}