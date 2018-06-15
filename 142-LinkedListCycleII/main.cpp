//
//  main.cpp
//  142-LinkedListCycleII
//
//  Created by Shvier on 2018/6/15.
//  Copyright © 2018 Shvier. All rights reserved.
//

#include <iostream>

// Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
    
public:
    ListNode *detectCycle(ListNode *head) {
        if (!head || !head->next) {
            return NULL;
        }
        ListNode *slow = head;
        ListNode *fast = head;
        bool hasCycle = false;
        while (fast && fast->next && fast->next->next) {
            slow = slow->next;
            fast = fast->next->next;
            if (slow == fast) {
                hasCycle = true;
                break;
            }
        }
        if (!hasCycle) {
            return NULL;
        }
        slow = head;
        while (slow != fast) {
            slow = slow->next;
            fast = fast->next;
        }
        return slow;
    }
    
};

int main(int argc, const char * argv[]) {
    // insert code here...
    ListNode *node = new ListNode(1);
    node->next = node;
    Solution *solution = new Solution();
    std::cout << solution->detectCycle(node);
    return 0;
}
