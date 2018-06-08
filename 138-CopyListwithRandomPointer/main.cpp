//
//  main.cpp
//  138-CopyListwithRandomPointer
//
//  Created by Shvier on 2018/6/8.
//  Copyright © 2018 Shvier. All rights reserved.
//

#include <iostream>

// Definition for singly-linked list with a random pointer.
struct RandomListNode {
    int label;
    RandomListNode *next, *random;
    RandomListNode(int x) : label(x), next(NULL), random(NULL) {}
};

class Solution {
    
public:
    RandomListNode *copyRandomList(RandomListNode *head) {
        RandomListNode *iter = head;
        RandomListNode *next;
        while (iter != NULL) {
            next = iter->next;
            RandomListNode *copy = new RandomListNode(iter->label);
            iter->next = copy;
            copy->next = next;
            iter = next;
        }
        iter = head;
        while (iter != NULL) {
            if (iter->random != NULL) {
                iter->next->random = iter->random->next;
            }
            iter = iter->next->next;
        }
        iter = head;
        RandomListNode *newHead = new RandomListNode(0);
        RandomListNode *copy;
        RandomListNode *copyIter = newHead;
        while (iter != NULL) {
            next = iter->next->next;
            copy = iter->next;
            copyIter->next = copy;
            copyIter = copy;
            iter->next = next;
            iter = next;
        }
        return newHead->next;
    }
    
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
