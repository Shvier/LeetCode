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
        guard let newHead = head else { return  head }
        if head?.next == nil {
            return head
        }
        let ans = ListNode.init(0)
        var p = ListNode.init(0)
        var q = ListNode.init(0)
        let pHead = p
        let qHead = q
        var pEnd = p
        var temp = head
        while temp != nil {
            let t = ListNode.init(temp!.val)
            if temp!.val < x {
                p.next = t
                p = p.next!
                pEnd = p
            } else {
                q.next = t
                q = q.next!
            }
            temp = temp!.next
        }
        pEnd.next = qHead.next
        ans.next = pHead.next
        return ans.next
    }
    
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(1)
node1.next = node2
let solution = Solution()
print(solution.partition(node1, 2))
