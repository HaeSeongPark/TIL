package ch8_Exercise;

public class Ch8_9 {
	public static void main(String[] args) {
		throw new UnsupportedFunctionException("지원하지 않는 기능",100);
	}
}

class UnsupportedFunctionException extends RuntimeException{
	final private int ERR_CODE;
	
	UnsupportedFunctionException(String message){
		this(message,100);
	}
	
	UnsupportedFunctionException(String message, int err){
		super(message);
		this.ERR_CODE = err;
	}
	
	public int getErrorCode(){
		return ERR_CODE;
	}
	
	public String getMessage(){
		return "["+getErrorCode()+"]"+super.getMessage();
	}
}