//
//  main.swift
//  109-ConvertSortedListtoBinarySearchTree
//
//  Created by Shvier on 28/03/2018.
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

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        return buildSubTree(head, nil)
    }
    
    func buildSubTree(_ head: ListNode?, _ end: ListNode?) -> TreeNode? {
        if head == nil || head === end {
            return nil
        }
        if head?.next === end {
            return TreeNode.init(head!.val)
        }
        var right = head
        var mid = head
        while right !== end && right?.next !== end {
            right = right?.next?.next
            mid = mid?.next
        }
        let root = TreeNode.init(mid!.val)
        root.left = buildSubTree(head, mid)
        root.right = buildSubTree(mid?.next, end)
        return root
    }
    
}
