//
//  main.cpp
//  141-LinkedListCycle
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
    bool hasCycle(ListNode *head) {
        if (!head || !head->next) {
            return false;
        }
        ListNode *slow = head->next;
        ListNode *fast = head->next->next;
        while (slow != fast) {
            if (!fast || !fast->next || !fast->next->next) {
                return false;
            }
            slow = slow->next;
            fast = fast->next->next;
        }
        return true;
    }

};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
