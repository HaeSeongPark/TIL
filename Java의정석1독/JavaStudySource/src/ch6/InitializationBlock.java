package ch6;

public class InitializationBlock {
	static{
		System.out.println("static{ }");
	}
	{
		System.out.println("instance{ }");
	}
	public InitializationBlock(){
		System.out.println("»ý¼ºÀÚ()");
	}
	public static void main(String[] args) {
		System.out.println("Block bt = new Block();");
		InitializationBlock bt = new InitializationBlock();
		
		System.out.println("Block bt2 = new Block();");
		InitializationBlock bt2 = new InitializationBlock();
	}

}
