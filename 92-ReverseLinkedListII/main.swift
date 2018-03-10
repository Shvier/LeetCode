//
//  main.swift
//  92-ReverseLinkedListII
//
//  Created by Shvier on 10/03/2018.
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
 
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return head
        }
        var p = head
        var q = head
        var prevP = head
        var nextQ = head
        for i in 0..<n {
            if i < m-1 {
                prevP = prevP?.next
            }
            if i < m {
                p = p?.next
            }
            q = q?.next
            nextQ = nextQ?.next
        }
        nextQ = nextQ?.next != nil ? nextQ?.next : nextQ
        q?.next = p
        prevP?.next = q
        p?.next = nextQ
        return head
    }
 
}
