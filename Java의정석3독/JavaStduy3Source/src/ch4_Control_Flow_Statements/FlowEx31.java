package ch4_Control_Flow_Statements;

public class FlowEx31 {
	public static void main(String[] args) {
		for(int i=0; i <= 10; i++){
			if(i%3==0)
				continue;
			/*
			 * continue문은 반복문 내에서만 사용될 수 있으며, 반복이 진행되는 도충에
			 * continue문을 만나면 반복문의 끝으로 이동하여 다음 반복으로 넘어간다.
			 * for문의 경우 증감식으로 이동하며, while문과 do~while문의 경우 조건식으로 이동
			 * continue문은 반복문 전체를 벗어나지 않는다.
			 */
			System.out.println(i);
		}
	}
}
