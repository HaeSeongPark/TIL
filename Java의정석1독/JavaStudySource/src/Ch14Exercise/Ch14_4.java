package Ch14Exercise;

import java.util.Arrays;
import java.util.*;
import java.util.stream.*;


public class Ch14_4 {
	public static void main(String[] args) {
		// 두 개의 주사위를 굴려서 나온 눈의 합이 6인 경우를 모두 출력하시오.
		// Hint 배열을 사용하시요.
		// [1,5]
		// [2.4]
		// [3.3]
		// [4,2]
		// [5,1]
		
		// 주사위 준비?
		// 합이 6인경우
		// 이중포문? for 1~5   하면 주사위 굴리는게 아니...
		// 배열은 저장용인가?
		
//		int[] diceSet = new int[10];
//		int index = 0;
//		
//		while(true)
//		{
//			int dice1 = (int)(Math.random()*5)+1; // 주사위1 준비
//			int dice2 = (int)(Math.random()*5)+1; // 주사위2 준비
//			int diceSum = dice1+dice2;
//			
//			if(diceSum ==6){
//				diceSet[index] = dice1;
//				diceSet[index+1] = dice2;
//				index += 2;
//				if(index==10)
//					break;
//			}
//		}
//		System.out.println(Arrays.toString(diceSet));
		
//		[1, 5, 4, 2, 4, 2, 4, 2, 2, 4]  중복된 거 제거해야 되네...
// 중복 된거 제거하고 배열에 다 쌓이면 끝네면 되는데... 람다나 스트림은 사용안하는건가? 근데 어떻게 사용하지...ㅋㅋ
// 경우의 수를 이미 알고있으니까... 아 답 볼까? 아...
		
//		for(int dice1=1; dice1<6; dice1++){
//			for(int dice2=1; dice2<6; dice2++)
//			{
//				int diceSum = dice1+dice2;
//				if(diceSum == 6){
//					System.out.println("["+dice1+","+dice2+"]");
//				}
//			}
//		}
		
//		저건 쫌... 람다 스트림 배열...
//      int배열을 가지고 스트림 생성하고 람다가지고 체크?
//		IntStream intStream = IntStream.rangeClosed(1, 5);   // 1,2,3,4,5  / 주사위 던지는데 차례대로 나오는 건 말이 안되고...
//		IntStream diceStream = IntStream.
		
//		IntStream intStream = new Random().ints(5);
//		intStream.forEach(System.out::Println);
		
//		IntStream diceStream = new Random().ints(1,6).distinct().limit(5); // 1~5까지 난수 발생, 중복 제거... 하 적응하기 쉽지 않군.
//		diceStream.forEach(System.out::print);
		
		//주사위 준비
//		IntStream dice1Stream = new Random().ints(1,6).distinct().limit(5);
//		IntStream dice2Stream = new Random().ints(1,6).distinct().limit(5); 
		//   new Random().ints(1,6).distinct().limit(5); 중복도 맘에 안드네...  람다와 배열은 또 어떻게 쓰남...?
		// 합이 6인걸 어떻게 찾지...? dice1과 dice2에 요소 6개를 짝지어 36쌍의 int 배열로 만들고 합치기?  36개... map? flatMap? g
		
		
//		dice1Stream.map(i-> new int[]{i,i});
		
		
		//		Stream<Integer[]> diceSumStream;
		/*
		 * 예제 참고... Stream<String[]> strArrStrm = Stream.of( new String[]{"abc","dfe","ghi"});
		 * 이거를 Stream<String>바꾸려고 할 때 flatMap...
		 */
		
		//주사위 다시 준비...하 ㅋㅋㅋ
		
//		Stream<Integer> dice1Stream = diceReady();  
//		Stream<Integer> dice2Stream = diceReady();
////		int[] adf = dice2Stream.toArray();
////		System.out.println(Arrays.toString(adf));
//		
//		//  저장은 둘째치고... 1과 2의요소를 짝지어야 하는데... 모르겠어서 스트림을 배열로 했다가 다시 스트림으로...로...
////		IntStream<int[]> diceSum; 하...IntStream은 지네릭이 안되는구나 아 당연하네... 하... 그럼 IntStream 대신에 Stream<Integer>
//		
////		Stream<int[]> diceSetStream; 
//		// 아 어떻게 짝지어서 만들지?
////		Integer[] dice2Array = dice2Stream.toArray(Integer[]::new);
//		Integer[] dice2Array = dice2Stream.toArray(size->new Integer[size]);
//		
////		Stream<int[]> diceSetStream = dice1Stream.flatMap(i1-> dice2Stream.map(i2-> new int[]{i1,i2}));
//		Stream<int[]> diceSetStream = dice1Stream.flatMap(i1-> Stream.of(dice2Array).map(i2-> new int[]{i1,i2}));
//		
//		
////		diceSetStream.forEach(System.out::println); 배열주소가 나오네...
//		diceSetStream.forEach(i->System.out.println(Arrays.toString(i))); 
		//쌍은 잘 이뤄지는 거 같은데  출력하다가 첫 번째 6개만 하고 스트림닫히는거 같은데...
		//dice1Stream.flatMap(i1-> dice2Stream.map(i2-> new int[]{i1,i2})).forEach(...) 인데 첫 번째 돌면 dice2Stream다 소모하니까  에러나는군 훗...
		// 그럼 메번 생성해줘야는데... 아후... 생성은 Stream.of(인트배열) 그럼 dice2Stream을 인트배열로 만들고 진행하면 되겠군요?
		// IntStream은 toArray()하면 되는데
		// Straem<T>는 toArray(IntFunction<A[]> generator) 이건뭐지...
		// 그냥
//		Integer[] dice2Array = dice2Stream.toArray(Integer[]::new);
		
//		dice1Stream.flatMap(i1-> Stream.of(dice2Array).map(i2->new int[]{i1,i2})).filter(iArry->iArry[0]+iArry[1] == 6).forEach(iArry->System.out.println(Arrays.toString(iArry)));
	
//		Stream<int[]> diceSumStream = dice1Stream.flatMap(i->Stream.of(1,2,3,4,5,6).map(i2->new int[]{i,i2}));
		
//		Stream<String> str1 = Stream.of(new String[]{"123","456","789"});
//		Stream<String> str2 = Stream.of(new String[]{"abc","def","ghi"});
//		Stream<String> str3 = Stream.concat(str1, str2);
//		str3.forEach(System.out::println);
		
//		주사위 준비
		Stream<Integer> dice1Stream = diceReady();  
		Stream<Integer> dice2Stream = diceReady();
		
//		주사위 짝을 만들기 위해 dice2Stream을 Integer[]로 변환 스트림을 계속 소모하기 때문에 계속 생성해야 한다.
//		Integer[] dice2Array = dice2Stream.toArray(Integer[]::new);
		Integer[] dice2Array = dice2Stream.toArray(size->new Integer[size]);
		
		dice1Stream.flatMap( // 아래  map을 하면 ->  Stream<int[]>  거기에 또 map을 하면 Stream<Stream<int[]>> 되니까
							 // map 말고 flatMap해서 Stream<int[]>로 해주고
							 // Stream.of(dice2Array)해서 계속 생성해주고
				i1-> Stream.of(dice2Array).map(i2->new int[]{i1,i2}))
		.filter(i->i[0]+i[1] == 6)		//[2, 4] 요런형태쌍이스트림에 있으므로 두 개의 합이 6인거 걸러내는(찾아내는 필터)
		.forEach(i->System.out.println(Arrays.toString(i)));  // 필터로 걸러진 것(합이6인것)출력 'int[]'이므로 출력할때 Arrays.toString()사용
		// 배열 스트림 람다 다씀
		
/*
 *    	Stream<Integer> dice1Stream = diceReady();  
		Stream<Integer> dice2Stream = diceReady();
		
		Integer[] dice2Array = dice2Stream.toArray(Integer[]::new);
		
		dice1Stream.flatMap(i1-> Stream.of(dice2Array).map(i2->new int[]{i1,i2}))
				   .filter(i->i[0]+i[1] == 6)	
				   .forEach(i->System.out.println(Arrays.toString(i)));
 */
		
		
	}
	static Stream<Integer> diceReady(){
		return new Random().ints(1,7).distinct().limit(6).boxed();   // 1~6 랜덤으로
	}
}
