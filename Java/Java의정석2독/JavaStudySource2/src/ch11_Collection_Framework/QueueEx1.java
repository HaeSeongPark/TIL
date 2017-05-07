package ch11_Collection_Framework;

import java.util.*;

public class QueueEx1 {
	// Queue선언
	static Queue q = new LinkedList();
	
	// Queue에 최대 5개까지만 저장되도록 한다.
	static final int MAX_SIZE = 5; 
	
	public static void main(String[] args) {
		System.out.println("help를 입력하면 도움말을 볼 수 있습니다.");
		
		while(true){
			System.out.print(">>");
			
			try {
				//입력받기

				

				
				// q, Q이면 종료

				// help이면 문구 3개 보여줌

				// history이면
					
					//input save하고

					
					// LinkedList의 내용을 보여준다.

					

			} catch (Exception e) {
				
			}
		} // while
	} // main
	
	public static void save(String input){
		// input이 ""이 아니면 q에 집어넣기

		
		//queue의 최대크기를 넘으면 제일 처음 입력된 것을 삭제한다.

	}
	
	/* p. 612출력화면 보고 만들기~
	 * >>help
	 *  history
		1.cd
		2.mkdir
		3.dir
		4.history
		5.history
		>>q
	 */
}
