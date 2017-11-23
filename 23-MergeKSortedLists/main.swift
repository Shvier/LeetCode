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
        var result = lists
        while result.count > 1 {
            result.append(Solution.mergeTwoLists(result[0], result[1]))
            result.remove(at: 0)
            result.remove(at: 0)
        }
        return result.first!
    }
    
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if (l1?.val)! <= (l2?.val)! {
            l1?.next = Solution.mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = Solution.mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
}

let listNode1 = ListNode.init(2)
let listNode3 = ListNode.init(-1)
Solution.mergeKLists([listNode1, nil, listNode3])
