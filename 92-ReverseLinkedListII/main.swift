//
//  main.swift
//  92-ReverseLinkedListII
//
//  Created by Shvier on 10/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

 class Solution {
 
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return head
        }
        let newHead = ListNode.init(0)
        newHead.next = head
        var prev = newHead
        for _ in 0..<m-1 {
            if prev.next != nil {
                prev = prev.next!
            }
        }
        let start = prev.next
        var then = start?.next
        for _ in 0..<n-m {
            start?.next = then?.next
            then?.next = prev.next
            prev.next = then
            then = start?.next
        }
        return newHead.next
    }
 
}

let node1 = ListNode.init(3)
let node2 = ListNode.init(5)
node1.next = node2
let solution = Solution()
print(solution.reverseBetween(node1, 1, 2))
