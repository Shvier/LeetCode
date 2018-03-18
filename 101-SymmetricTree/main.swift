//
//  main.swift
//  101-SymmetricTree
//
//  Created by Shvier on 18/03/2018.
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkSymmetric(root?.left, root?.right)
    }
    
    func checkSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        return checkSymmetric(left?.left, right?.right) && checkSymmetric(left?.right, right?.left)
    }
    
}
