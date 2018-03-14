//
//  main.swift
//  98-ValidateBinarySearchTree
//
//  Created by Shvier on 13/03/2018.
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
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return checkTree(root, Int.min, Int.max)
    }
    
    func checkTree(_ root: TreeNode?, _ minValue: Int, _ maxValue: Int) -> Bool {
        guard let newRoot = root else { return true }
        if newRoot.val >= maxValue || newRoot.val <= minValue {
            return false
        }
        return checkTree(newRoot.left, minValue, newRoot.val) && checkTree(newRoot.right, newRoot.val, maxValue)
    }
    
}
