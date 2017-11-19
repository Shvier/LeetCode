//
//  main.swift
//  21.-MergeTwoSortedLists
//
//  Created by Shvier on 19/11/2017.
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
    
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var p = l1
        var q = l2
        var res = ListNode.init(0)
        let result = ListNode.init(0)
        result.next = res
        while p?.next != nil || q?.next != nil {
            if p != nil {
                if q?.next != nil {
                    if (p?.val)! > (q?.val)! {
                        let node = ListNode.init((q?.val)!)
                        res.next = node
                        q = q?.next
                    } else {
                        let node = ListNode.init((p?.val)!)
                        res.next = node
                        p = p?.next
                    }
                } else {
                    let node = ListNode.init((p?.val)!)
                    res.next = node
                    p = p?.next
                }
                p = p?.next
            } else {
                if q?.next != nil {
                    let node = ListNode.init((q?.val)!)
                    res.next = node
                    q = q?.next
                } else {
                    break
                }
            }
            res = res.next!
        }
        return result.next?.next
    }
    
}
