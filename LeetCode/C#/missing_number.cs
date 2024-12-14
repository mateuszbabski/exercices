public class Solution
{
    public int MissingNumber(int[] nums)
    {
        int expected = nums.Length * (nums.Length + 1) / 2;
        for (int i = 0; i < nums.Length; i++)
        {
            expected -= nums[i];
        }
        return expected;
    }
}