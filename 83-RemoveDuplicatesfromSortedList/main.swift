//
//  main.swift
//  83-RemoveDuplicatesfromSortedList
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
        while p != nil {
            if p?.val != p?.next?.val {
                let temp = ListNode.init((p?.val)!)
                q.next = temp
                q = q.next!
            }
            p = p?.next
        }
        return ans.next
    }
}
