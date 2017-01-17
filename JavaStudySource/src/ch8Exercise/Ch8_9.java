package ch8Exercise;

public class Ch8_9 {
	public static void main(String[] args) throws Exception{
		throw new UnsupportedFuntionException("지원하지 않는 기능입니다.",100);
	}
}

class UnsupportedFuntionException extends RuntimeException{
	private final int ERR_CODE;
	
	UnsupportedFuntionException(String msg, int errCode){
		super(msg);
		ERR_CODE = errCode;
	}
	UnsupportedFuntionException(String msg){
		this(msg,100);
	}
	public int getErrCode(){
		return ERR_CODE;
	}
	public String getMessgae(){
		return "["+getErrCode()+"]"+ super.getMessage();
		
	}
}