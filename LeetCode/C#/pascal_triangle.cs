public class Solution
{
    public IList<IList<int>> Generate(int numRows)
    {
        IList<IList<int>> result = new List<IList<int>>(); ;
        result.Add(new List<int> { 1 });

        for (int i = 1; i < numRows; i++)
        {
            var row = new List<int> { 1 };
            var previousRow = result[i - 1];

            for (int j = 1; j < i; j++)
            {
                row.Add(previousRow[j - 1] + previousRow[j]);
            }

            row.Add(1);
            result.Add(row);
        }

        return result;
    }
}