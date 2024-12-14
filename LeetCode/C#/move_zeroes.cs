public class Solution
{
    public void MoveZeroes(int[] nums)
    {
        int iterator = 0;

        for (int i = 0; i < nums.Length; i++)
        {
            if (nums[i] != 0)
            {
                nums[iterator] = nums[i];
                iterator++;
            }
        }

        for (int i = iterator; i < nums.Length; i++)
        {
            nums[i] = 0;
        }
    }
}