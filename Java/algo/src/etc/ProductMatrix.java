package etc;

public class ProductMatrix {
	public int[][] productMatrix(int[][] A, int[][] B) {
		
		//행렬을 곱하기 위해선 좌측 행렬의 열의 개수와 우측 행렬의 행의 개수가 같아야 합니다
		// 좌측 행렬의 열의 개수와 우측 행렬의 행의 개수가 같지 않으면 return null;
		if( A[0].length != B.length)
			return null;
		
		final int ROW = A.length;     // 좌측행렬의 행의 길이
		final int COL = B[0].length;  // 우측행렬의 열의 길이
		final int B_ROW = B.length;   // 우측행렬의 행의 길이

		int[][] answer = new int[ROW][COL];  // 행렬의 곱셈은 좌측행렬의 [행의길이] 우측행렬의 [열의길의]로 새로운 배열이 생성됨

		for (int i = 0; i < ROW; i++) 
			for (int j = 0; j < COL; j++) 
				for (int k = 0; k < B_ROW; k++)
					answer[i][j] += A[i][k] * B[k][j];
		
		// 행력출력
		for(int i=0; i<ROW; i++){
			for(int j=0; j<COL; j++){
				System.out.printf("%3d ",answer[i][j]);
			}
			System.out.println();
		}

		return answer;
	}

	public static void main(String[] args) {
		ProductMatrix c = new ProductMatrix();
		int[][] a = { { 1, 2 }, { 2, 3 }};
		int[][] b = { { 3, 4 }, { 5, 6 } };
		// 아래는 테스트로 출력해 보기 위한 코드입니다.
		System.out.println("행렬의 곱셈 : " + c.productMatrix(a, b));

	}
}