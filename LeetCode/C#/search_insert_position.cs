public class Solution
{
    public int SearchInsert(int[] nums, int target)
    {
        int i = 0;
        while (i < nums.Length)
        {
            if (nums[i] > target || nums[i] == target)
            {
                return i;
            }
            i++;
        }

        return nums.Length;
    }
}