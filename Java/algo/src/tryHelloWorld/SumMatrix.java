package tryHelloWorld;

public class SumMatrix {
	int[][] sumMatrix(int[][] A, int[][] B) {
		int[][] answer = new int[A.length][A[0].length];
		
		
		for(int i=0; i<answer.length; i++)
			for(int j=0; j<answer[i].length; j++)
				answer[i][j] = A[i][j] + B[i][j];
		

		return answer;
	}
	
	int[][] sumMatrixV(int[][] A, int[][] B){
		
		//가변배열일때, A와 B가 똑같은 행렬이라고 할 때,
		//answerV초기화
		int[][] answerV = new int[A.length][];
		for(int i=0; i<answerV.length; i++)
			answerV[i] = new int[A[i].length];
		
		for(int i=0; i<answerV.length; i++)
			for(int j=0; j<answerV[i].length; j++)
				answerV[i][j] = A[i][j] + B[i][j];
		
		return answerV;
	}

	// 아래는 테스트로 출력해 보기 위한 코드입니다.
	public static void main(String[] args) {
		SumMatrix c = new SumMatrix();
		int[][] A = { { 1, 2 }, { 2, 3 } };
		int[][] B = { { 3, 4 }, { 5, 6 } };
		int[][] answer = c.sumMatrix(A, B);
		if (answer[0][0] == 4 && answer[0][1] == 6 && 
				answer[1][0] == 7 && answer[1][1] == 9) {
			System.out.println("맞았습니다. 제출을 눌러 보세요");
		} else {
			System.out.println("틀렸습니다. 수정하는게 좋겠어요");
		}
		
		int[][] A2 = {{1,2,3},{1,2}};
		int[][] B2 = {{1,2,3},{1,2}};;
		
		int[][] answerV = c.sumMatrixV(A2, B2);
		
		for(int i=0; i < answerV.length; i++)
			for(int j=0; j < answerV[i].length; j++)
				System.out.printf("answerV[%d][%d]=%d%n",i,j,answerV[i][j]);
	}
}