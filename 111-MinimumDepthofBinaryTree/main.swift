//
//  main.swift
//  111-MinimumDepthofBinaryTree
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
    
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = minDepth(root?.left)
        let right = minDepth(root?.right)
        return (left == 0 || right == 0) ? left+right+1 : min(left,right)+1
    }
    
}
