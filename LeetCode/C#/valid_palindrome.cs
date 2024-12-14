using System.Text.RegularExpressions;

public class Solution
{
    public bool IsPalindrome(string s)
    {
        string res = Regex.Replace(s, "[^a-zA-Z0-9]", "").ToLower();

        for (int i = 0; i < res.Length / 2; i++)
        {
            if (res[i] != res[res.Length - 1 - i]) return false;
        }

        return true;
    }
}