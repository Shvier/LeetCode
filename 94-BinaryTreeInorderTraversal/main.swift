//
//  main.swift
//  94-BinaryTreeInorderTraversal
//
//  Created by Shvier on 11/03/2018.
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
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        if root == nil {
            return ans
        }
        var newRoot = root
        var stack = [TreeNode]()
        while newRoot != nil || !stack.isEmpty {
            if newRoot != nil {
                stack.append(newRoot!)
                newRoot = newRoot?.left
            } else {
                newRoot = stack.last
                stack.removeLast()
                ans.append(Int.init((newRoot?.val)!))
                newRoot = newRoot?.right
            }
        }
        return ans
    }
    
}
