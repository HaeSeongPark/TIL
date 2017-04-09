package ch8_Exercise;

public class Ch8_9 {
	public static void main(String[] args) {
		throw new UnsupportedFuctionException("지원하지 않는 기능입니다.",100);
	}
}

class UnsupportedFuctionException extends RuntimeException{
	final private int ERR_CODE;
	
	
	UnsupportedFuctionException(String msg){
		this(msg,100);
	}
	UnsupportedFuctionException(String msg, int errCode){
		super(msg);
		ERR_CODE = errCode;
	}
	
	public int getErrorCode(){
		return ERR_CODE;
	}
	
	public String getMessage(){
		return "[" + getErrorCode() + "]" + super.getMessage();
	}
}