package ch9Exercise;

class SutdaCard{
	int num;
	boolean isKwang;
	
	SutdaCard(){
		this(1,true);
	}
	SutdaCard(int num, boolean isKwang){
		this.num = num;
		this.isKwang = isKwang;
	}
	public boolean equals(Object obj){
		if(obj instanceof SutdaCard){
			SutdaCard param = (SutdaCard)obj; 
		    return this.num == param.num && this.isKwang == param.isKwang;
		}
		
		return false;
	}
	public String toString(){
		return num + (isKwang ? "K":"");
	}
}

public class Ch9_1 {
	public static void main(String[] args) {
		SutdaCard c1 = new SutdaCard(3,true);
		SutdaCard c2 = new SutdaCard(3,true);
		System.out.println("c1="+c1);
		System.out.println("c2="+c2);
		System.out.println("c1.equals(c2):="+c1.equals(c2));
	}
}
