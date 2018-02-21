//
//  main.swift
//  82-RemoveDuplicatesfromSortedListII
//
//  Created by Shvier on 21/02/2018.
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
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        let ans = ListNode.init(0)
        var p = head
        var q = ans
        var dup = Int.min
        while p != nil {
            if p?.val != p?.next?.val && p?.val != dup {
                let temp = ListNode.init((p?.val)!)
                q.next = temp
                q = q.next!
            } else {
                dup = (p?.val)!
            }
            p = p?.next
        }
        return ans.next
    }
    
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
node1.next = node2
let node3 = ListNode.init(3)
node2.next = node3
let node4 = ListNode.init(3)
node3.next = node4
let node5 = ListNode.init(4)
node4.next = node5
let node6 = ListNode.init(4)
node5.next = node6
let node7 = ListNode.init(5)
node6.next = node7
let solution = Solution()
print(solution.deleteDuplicates(node1))
