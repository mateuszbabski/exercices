public class Solution
{
	public IList<string> FizzBuzz(int n)
	{
		var result = new string[n];
		for (int i = 1; i <= n; i++)
		{
			if (i % 15 == 0)
			{
				result[i - 1] = "FizzBuzz";
			}
			else if (i % 3 == 0)
			{
				result[i - 1] = "Fizz";
			}
			else if (i % 5 == 0)
			{
				result[i - 1] = "Buzz";
			}
			else
			{
				result[i - 1] = i.ToString();
			}
		}
		return result;
	}
}