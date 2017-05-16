package tryHelloWorld;

class Solution
{
	public int solution(int n, int a, int b)
	{
		int answer = 1;
		
        if(Math.abs(a-b)==1)
            return answer;
        
		a = (a % 2 == 0) ? a : a + 1;
		b = (b % 2 == 0) ? b : b + 1;

		while ( Math.abs(a - b) != 1 && n != 2 )
		{
			a = a >> 1;
			b = b >> 1;
			n = n >> 1;
			answer++;
		}

		return answer;
	}

	public static void main(String [] args)
	{
		Solution solution = new Solution();

		System.out.println(solution.solution(8 , 3 , 5));
	}
}