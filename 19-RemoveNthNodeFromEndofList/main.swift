//
//  main.swift
//  19-RemoveNthNodeFromEndofList
//
//  Created by Shvier on 14/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
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
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count: Int = 0
        var p = head
        while ((p?.next) != nil || p != nil) {
            count += 1
            p = p?.next
        }
        var q: ListNode = ListNode.init(0)
        q.next = head
        p?.next = head
        for _ in 0..<count-n {
            q = q.next!
        }
        q.next = q.next?.next
        return p?.next
    }
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
node1.next = node2
print(Solution.removeNthFromEnd(node1, 1))
