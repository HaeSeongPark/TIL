package ch9_Exercise;

public class ch9_1 {
	public static void main(String[] args) {
		StudatCard c1 = new StudatCard(3, true);
		StudatCard c2 = new StudatCard(3, true);
		
		System.out.println("c1="+c1);
		System.out.println("c2="+c2);
		System.out.println("c1.equals(c2):"+c1.equals(c2));
	}
}

class StudatCard{
	int num;
	boolean isKwang;
	
	StudatCard(){
		this(1, true);
	}
	
	StudatCard(int num, boolean isKwang){
		this.num = num;
		this.isKwang = isKwang;
	}
	
	public boolean equals(Object obj){
		if (obj instanceof StudatCard){
			StudatCard tmpObj = (StudatCard)obj;
			return num== tmpObj.num && isKwang == tmpObj.isKwang;
		}
		return false;

	}
	public String toString(){
		return num + (isKwang ? "K" : "");
	}
}