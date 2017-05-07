package ch5_Exercise;

public class Ch5_11 {
	public static void main(String[] args) {
		int[][] score= {
				{ 100, 100, 100 },
				{ 20, 20, 20 },
				{ 30, 30, 30 },
				{ 40, 40, 40 },
				{ 50, 50, 50 },
		};
		
		int[][] result = new int[score.length+1][score[0].length+1];
		
		final int SCOREROW = score.length;
		final int SCORECUL = score[0].length;
		
		for(int i=0; i < SCOREROW; i++){
			for(int j=0; j < SCORECUL; j++){
				result[i][j] = score[i][j];
				result[i][SCORECUL] += result[i][j];
				result[SCOREROW ][j] += result[i][j];
			    result[SCOREROW ][SCORECUL] += result[i][j];
				
			}
		}
		
		for(int i=0, lengthROW=result.length; i < lengthROW; i++){
			for(int j=0, lengthCOL=result[i].length; j < lengthCOL; j++){
				System.out.printf("%4d",result[i][j]);
			}
			System.out.println();
		}
	}
}
