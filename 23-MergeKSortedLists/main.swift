//
//  main.swift
//  23-MergeKSortedLists
//
//  Created by Shvier on 22/11/2017.
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
    
    static func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        if lists.count == 1 {
            return lists.first!
        }
        var firstNode = lists.first!
        var listNodes = lists
        listNodes.remove(at: 0)
        return Solution.mergeLists(&firstNode, &listNodes)
    }
    
    static func mergeLists(_ list: inout ListNode?, _ lists: inout [ListNode?]) -> ListNode? {
        if lists.count < 1 {
            return list
        }
        if lists.count == 1 {
            return Solution.mergeTwoLists(list, lists.first!)
        } else {
            var firstNode = lists.first!
            lists.remove(at: 0)
            return Solution.mergeLists(&firstNode, &lists)
        }
    }
    
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
        while p != nil || q != nil {
            if p != nil {
                if q != nil {
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
            } else {
                if q != nil {
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

let listNode1 = ListNode.init(2)
let listNode3 = ListNode.init(-1)
Solution.mergeKLists([listNode1, nil, listNode3])
