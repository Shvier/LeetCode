//
//  main.swift
//  102-BinaryTreeLevelOrderTraversal
//
//  Created by Shvier on 19/03/2018.
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
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        dfs(root, 0, &ans)
        return ans
    }
    
    func dfs(_ root: TreeNode?, _ depth: Int, _ ans: inout [[Int]]) {
        if root == nil {
            return
        }
        if ans.count <= depth {
            ans.append([Int]())
        }
        ans[depth].append(root!.val)
        dfs(root?.left, depth+1, &ans)
        dfs(root?.right, depth+1, &ans)
    }
    
}
