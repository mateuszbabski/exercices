public class Solution
{
    public int RemoveDuplicates(int[] nums)
    {
        if (nums.Length == 0) return 0;
        if (nums.Length == 1) return 1;
        int j = 0;
        for (int i = 1; i < nums.Length; i++)
        {
            if (nums[i] != nums[i - 1])
            {
                nums[j + 1] = nums[i];
                j++;
            }
        }
        return j + 1;
    }
}