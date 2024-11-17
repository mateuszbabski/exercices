public class Solution
{
    public int[] TwoSum(int[] nums, int target)
    {
        Dictionary<int, int> table = new Dictionary<int, int>();

        for (int i = 0; i < nums.Length; i++)
        {
            int temp = nums[i];

            if (table.ContainsKey(target - temp))
            {
                return new int[] { table[target - temp], i };
            }

            table[temp] = i;
        }

        return new int[0];
    }
}