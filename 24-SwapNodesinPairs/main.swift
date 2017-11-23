//
//  main.swift
//  24-SwapNodesinPairs
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
    
    static func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var result = head
        while result != nil {
            guard let nextNode = result?.next else { break }
            let nextVal = nextNode.val
            result?.next?.val = (result?.val)!
            result?.val = nextVal
            result = result?.next?.next
        }
        return head
    }
    
}
