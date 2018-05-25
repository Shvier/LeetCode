//
//  main.swift
//  124-BinaryTreeMaximumPathSum
//
//  Created by Shvier on 2018/5/22.
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
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxValue = Int.min
        maxPathDown(root, &maxValue)
        return maxValue
    }
    
    func maxPathDown(_ root: TreeNode?, _ maxValue: inout Int) -> Int {
        if root == nil {
            return 0
        }
        let left = max(0, maxPathDown(root?.left, &maxValue))
        let right = max(0, maxPathDown(root?.right, &maxValue))
        maxValue = max(maxValue, left+right+root!.val)
        return max(left, right) + root!.val
    }
    
}
