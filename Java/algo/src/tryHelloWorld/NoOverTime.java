package tryHelloWorld;

import java.util.stream.*;
import java.util.*;

class NoOverTime {
    public int noOvertime(int no, int[] works) {
    	/*				정렬 후 가장 큰 거에서 1씩  제거하면 되는 거였어... 이렇게 간단한걸...
    	 *         int answer = 0 ;
			        for(int i=0;i<no;i++){
			            Arrays.sort(works);
			            works[works.length-1]-=1;
			        }
			
			        for(int i = 0 ; i < works.length ; i++)
			          answer += Math.pow(works[i], 2);
			        return answer;
    	 */
    int length = works.length;
    int tmpLength = length;
    int sum = IntStream.of(works).sum()-no;
        int[] resultArr = new int[length];
    Arrays.sort(works);
    int num = works[0];
    int result = 0;

    System.out.println(Arrays.toString(works));
    System.out.println(" no : " + no);
    System.out.println(" sum : " + sum);

    for(int i=0; i<length-1; i++){
        if( num * tmpLength <= sum){
            for(int j=i; j<length; j++){
            resultArr[j] += num;
          }
            sum-= num * tmpLength;
            if(sum==0)break;
            if(sum<=tmpLength--){
            for(int k=i+1; sum>0; k++){
                resultArr[k]++;
              sum--;
            }
            break;
          } else {
            num = works[i+1]-works[i];
          }
      } else {
            while( num * tmpLength > sum){
            num--;
          }
            i--;
      }
    }
            for(int i=0; i<resultArr.length; i++){
        result += resultArr[i] * resultArr[i];
      }
    System.out.println(Arrays.toString(resultArr));
    return result;
    }
    public static void main(String[] args) {
        NoOverTime c = new NoOverTime();
        int []test = {12, 13, 16, 17, 18};
        System.out.println(c.noOvertime(19,test));
    }
}