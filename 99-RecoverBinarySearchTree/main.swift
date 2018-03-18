//
//  main.swift
//  99-RecoverBinarySearchTree
//
//  Created by Shvier on 14/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

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
    
    func recoverTree(_ root: TreeNode?) {
        var cur = root
        var prev: TreeNode?
        var temp: TreeNode?
        var p1: TreeNode?
        var p2: TreeNode?
        while cur != nil {
            if cur?.left == nil {
                if temp != nil && temp!.val > cur!.val {
                    if p1 == nil {
                        p1 = temp
                    }
                    p2 = cur
                }
                temp = root
                cur = cur?.right
            } else {
                prev = cur?.left
                while prev?.right != nil && prev?.right !== cur {
                    prev = prev?.right
                }
                if prev?.right == nil {
                    prev?.right = cur
                    cur = cur?.left
                } else {
                    if temp != nil && temp!.val > cur!.val {
                        if p1 == nil {
                            p1 = temp
                        }
                        p2 = cur
                    }
                    temp = root
                    prev?.right = nil
                    cur = cur?.right
                }
            }
        }
        if p1 != nil && p2 != nil {
            let temp = p1!.val
            p1!.val = p2!.val
            p2!.val = temp
        }
    }
    
}
