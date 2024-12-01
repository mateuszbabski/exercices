public class Solution
{
    public IList<int> GetRow(int rowIndex)
    {
        int[] result = new int[rowIndex + 1];
        result[0] = 1;

        for (int i = 1; i <= rowIndex; i++)
        {
            for (int j = i - 1; j > 0; j--)
            {
                result[j] = result[j] + result[j - 1];
            }

            result[i] = 1;
        }

        return result;
    }
}