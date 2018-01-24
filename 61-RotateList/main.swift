//
//  main.swift
//  61-RotateList
//
//  Created by Shvier on 24/01/2018.
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
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return head
        }
        var breakNode = head
        var length = 1
        while breakNode?.next != nil {
            breakNode = breakNode?.next
            length += 1
        }
        breakNode?.next = head
        let breakIndex = length - k
        if breakIndex < 0 {
            breakNode?.next = nil
            var p = head
            var q = head?.next
            for _ in 0..<length-1 {
                let temp = q?.next
                q?.next = p
                p = q
                q = temp == nil ? q : temp
            }
            head?.next = nil
            return p
        } else {
            if k % length != 0 && breakIndex > 0 {
                for _ in 0..<breakIndex {
                    breakNode = breakNode?.next
                }
            }
            let newHead = ListNode.init(0)
            newHead.next = breakNode?.next
            breakNode?.next = nil
            return newHead.next
        }
    }
    
}

var node1 = ListNode.init(1)
var node2 = ListNode.init(2)
var node3 = ListNode.init(3)
var node4 = ListNode.init(4)
var node5 = ListNode.init(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = nil
let solution = Solution()
solution.rotateRight(node1, 6)
