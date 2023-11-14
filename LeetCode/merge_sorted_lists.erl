%%  Leet code exercise
%%  21. Merge Two Sorted Lists
%%
%%
%%You are given the heads of two sorted linked lists list1 and list2.
%%
%%Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
%%
%%Return the head of the merged linked list.
%%
%%Input: list1 = [1,2,4], list2 = [1,3,4]
%%Output: [1,1,2,3,4,4]
%%Example 2:
%%
%%Input: list1 = [], list2 = []
%%Output: []
%%Example 3:
%%
%%Input: list1 = [], list2 = [0]
%%Output: [0]
%% 
%%Constraints:
%%
%%The number of nodes in both lists is in the range [0, 50].
%%-100 <= Node.val <= 100
%%Both list1 and list2 are sorted in non-decreasing order.

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) -> #list_node{} | null.
merge_two_lists(List1, List2) when List1 == null, List2 == null -> null;
merge_two_lists(List1, List2) when List1 == null -> List2;
merge_two_lists(List1, List2) when List2 == null -> List1;
merge_two_lists(List1, List2) -> 
    V1 = List1#list_node.val,
    V2 = List2#list_node.val,
    case V1 =< V2 of
        true ->  #list_node{val = V1, next = merge_two_lists(List1#list_node.next, List2)};
        false -> #list_node{val = V2, next = merge_two_lists(List1, List2#list_node.next)}
    end.
