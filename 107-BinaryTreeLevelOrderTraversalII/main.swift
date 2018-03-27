//
//  main.swift
//  107-BinaryTreeLevelOrderTraversalII
//
//  Created by Shvier on 27/03/2018.
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
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        dfs(&ans, root, 0)
        return ans
    }
    
    func dfs(_ ans: inout [[Int]], _ root: TreeNode?, _ depth: Int) {
        if root == nil {
            return
        }
        if ans.count <= depth {
            ans.insert([Int](), at: 0)
        }
        dfs(&ans, root?.left, depth+1)
        dfs(&ans, root?.right, depth+1)
        ans[ans.count-depth-1].append(root!.val)
    }
    
}
