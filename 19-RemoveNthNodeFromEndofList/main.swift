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
        let o: ListNode = ListNode.init(0)
        if count == n {
            q.next = head?.next
            o.next = head?.next
        } else {
            q.next = head
            o.next = head
        }
        for _ in 0..<count-n {
            q = q.next!
        }
        q.next = q.next?.next
        return o.next
    }
}
