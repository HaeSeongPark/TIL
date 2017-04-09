package ch9_Exercise;

public class Ch9_4 {
	static void printGraph(int[] dataArr, char ch){
		for(int i=0; i<dataArr.length; i++){
			for(int j=0; j<dataArr[i]; j++){
				System.out.print(ch);
			}
			System.out.println(dataArr[i]);
		}
	}
	public static void main(String[] args) {
		printGraph(new int[]{3,7,1,4},'*');
	}
}
