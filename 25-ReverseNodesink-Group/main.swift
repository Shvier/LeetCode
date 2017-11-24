//
//  main.swift
//  25-ReverseNodesink-Group
//
//  Created by Shvier on 23/11/2017.
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
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var p = head
        var q = head
        var count = 0
        while q != nil && count != k {
            count += 1
            q = q?.next
        }
        if count == k {
            q = reverseKGroup(q, k)
            while count > 0 {
                let tmp = p?.next
                p?.next = q
                q = p
                p = tmp
                count -= 1
            }
            p = q
        }
        return p
    }
    
}

