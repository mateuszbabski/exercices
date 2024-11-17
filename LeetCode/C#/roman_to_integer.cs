public class Solution
{
    public int RomanToInt(string s)
    {
        int result = 0;

        for (int i = 0; i < s.Length - 1; i++)
        {
            int currentValue = GetValue(s[i]);
            int nextValue = GetValue(s[i + 1]);

            if (currentValue >= nextValue)
            {
                result += currentValue;
            }
            else
            {
                result -= currentValue;
            }
        }

        result += GetValue(s[s.Length - 1]);

        return result;
    }

    private int GetValue(char c)
    {
        switch (c)
        {
            case 'I': return 1;
            case 'V': return 5;
            case 'X': return 10;
            case 'L': return 50;
            case 'C': return 100;
            case 'D': return 500;
            case 'M': return 1000;
            default: return 0;
        }
    }
}
