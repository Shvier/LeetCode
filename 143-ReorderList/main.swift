//
//  main.swift
//  143-ReorderList
//
//  Created by Shvier on 2018/6/19.
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
    
    func reorderList(_ head: ListNode?) {
        guard head != nil && head?.next != nil else {
            return
        }
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let middle = slow
        let next = middle?.next
        while next?.next != nil {
            let current = next?.next
            next?.next = current?.next
            current?.next = middle?.next
            middle?.next = current
        }
        slow = head
        fast = middle?.next
        while slow !== middle {
            next?.next = fast?.next
            fast?.next = slow?.next
            slow?.next = fast
            slow = fast?.next
            fast = middle?.next
        }
    }
    
}
