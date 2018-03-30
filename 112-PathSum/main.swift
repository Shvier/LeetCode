//
//  main.swift
//  112-PathSum
//
//  Created by Shvier on 2018/3/30.
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
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root!.val == sum {
            if (root!.left == nil && root!.right == nil) {
                return true
            }
        }
        return hasPathSum(root?.left, sum-root!.val) || hasPathSum(root?.right, sum-root!.val)
    }
    
}
