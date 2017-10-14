//
//  main.swift
//  2-AddTwoNumbers
//
//  Created by Shvier on 14/10/2017.
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
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result: ListNode = ListNode.init(0)
        var currentNode = result
        var pNode = l1
        var qNode = l2
        var carryBit: Int = 0
        while pNode != nil || qNode != nil {
            let pVal = (pNode != nil) ? (pNode?.val)! : 0
            let qVal = (qNode != nil) ? (qNode?.val)! : 0
            let sum = pVal + qVal + carryBit
            carryBit = sum/10
            currentNode.next = ListNode.init(sum%10)
            currentNode = currentNode.next!
            pNode = pNode?.next
            qNode = qNode?.next
        }
        if carryBit > 0 {
            currentNode.next = ListNode.init(carryBit)
        }
        return result.next
    }
}

let l11 = ListNode.init(2)
let l12 = ListNode.init(4)
let l13 = ListNode.init(3)
l11.next = l12
l12.next = l13

let l21 = ListNode.init(5)
let l22 = ListNode.init(6)
let l23 = ListNode.init(4)
l21.next = l22
l22.next = l23

let l1 = ListNode.init(5)
let l2 = ListNode.init(5)
var result = Solution.addTwoNumbers(l1, l2)
while result != nil {
    print((result?.val)!)
    result = result?.next
}
