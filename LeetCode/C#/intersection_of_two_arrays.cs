public class Solution
{
	public int[] Intersection(int[] nums1, int[] nums2)
	{
		HashSet<int> numSet = new HashSet<int>(nums1);
		HashSet<int> result = new HashSet<int>();

		foreach (int num in nums2)
		{
			if (numSet.Contains(num))
			{
				result.Add(num);
			}
		}

		return result.ToArray();
	}
}