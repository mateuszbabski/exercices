public class Solution
{
    public int RomanToInt(string s)
    {
        Dictionary<char, int> romanMap = new Dictionary<char, int>
         {
            {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}
        };
        int result = 0;
        for (int i = 0; i < s.Length - 1; i++)
        {
            if (romanMap[s[i]] >= romanMap[s[i + 1]])
            {
                result += romanMap[s[i]];
            }
            else
            {
                result -= romanMap[s[i]];
            }
        }
        result += romanMap[s[s.Length - 1]];
        return result;
    }
}