package tryHelloWorld;

public class GetMinMaxString {
    public String getMinMaxString(String str) {
      	String[] result = str.split(" ");
      	int max, min;
      	max = min = Integer.parseInt(result[0]);

      	for(int i=1; i<result.length; i++){
      		int tmp = Integer.parseInt(result[i]);
      		if(max < tmp) max = tmp;
      		else if(min > tmp) min = tmp;
      	}
        return min+" "+max;
    }

    public static void main(String[] args) {
        String str = "-1 -2 -3 -4";
        GetMinMaxString minMax = new GetMinMaxString();
        //아래는 테스트로 출력해 보기 위한 코드입니다.
        System.out.println("최대값과 최소값은? " + minMax.getMinMaxString(str));
    }
}