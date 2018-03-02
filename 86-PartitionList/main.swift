//
//  main.swift
//  86-PartitionList
//
//  Created by Shvier on 25/02/2018.
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
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var newHead = head
        let pHead = ListNode.init(0)
        let qHead = ListNode.init(0)
        var p = pHead
        var q = qHead
        while newHead != nil {
            if newHead!.val < x {
                p.next = newHead
                p = p.next!
            } else {
                q.next = newHead
                q = q.next!
            }
            newHead = newHead?.next
        }
        q.next = nil
        p.next = qHead.next
        return pHead.next
    }
    
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(1)
node1.next = node2
let solution = Solution()
print(solution.partition(node1, 2))
