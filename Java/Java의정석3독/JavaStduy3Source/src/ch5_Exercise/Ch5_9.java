package ch5_Exercise;

public class Ch5_9 {
	public static void main(String[] args) {
		char[][] start = {
				{'*','*',' ',' '},
				{'*','*',' ',' '},
				{'*','*','*','*'},
				{'*','*','*','*'}
		};
		
		char[][] result = new char[start[0].length][start.length];
		
		for(int i=0; i<start.length; i++){
			for(int j=0; j<start.length; j++){
				System.out.print(start[i][j]);
			}
			System.out.println();
		}
		
		for(int i=0; i<start.length; i++){
			for(int j=0; j<start[i].length; j++){
				int x = j;
				int y = start.length-1-i;
				result[x][y] = start[i][j];
			}
		}
		
		System.out.println();
		
		for(int i=0; i<result.length; i++){
			for(int j=0; j<result.length; j++){
				System.out.print(result[i][j]);
			}
			System.out.println();
		}
	}
}
