//
//  main.swift
//  110-BalancedBinaryTree
//
//  Created by Shvier on 29/03/2018.
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

    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        let left = depth(root?.left)
        let right = depth(root?.right);
        return abs(left-right) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    func depth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(depth(root?.left), depth(root?.right)) + 1
    }

}
