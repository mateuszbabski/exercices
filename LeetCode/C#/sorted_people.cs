public class Solution
{
    public string[] SortPeople(string[] names, int[] heights)
    {
        var people = new (int height, string name)[names.Length];
        for (int i = 0; i < names.Length; i++)
        {
            people[i] = (heights[i], names[i]);
        }
        Array.Sort(people, (a, b) => b.height.CompareTo(a.height));

        var sortedPeople = new string[names.Length];
        for (int i = 0; i < names.Length; i++)
        {
            sortedPeople[i] = people[i].name;
        }

        return sortedPeople;
    }
}