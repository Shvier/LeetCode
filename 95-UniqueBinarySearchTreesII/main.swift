//
//  main.swift
//  95-UniqueBinarySearchTreesII
//
//  Created by Shvier on 12/03/2018.
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
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n <= 0 {
            return [TreeNode]()
        }
        return generateTreesDFS(1, n)
    }
    
    func generateTreesDFS(_ start: Int, _ end: Int) -> [TreeNode?] {
        var subTree = [TreeNode?]()
        if start > end {
            subTree.append(nil)
        } else {
            for i in start...end {
                var leftSubTree = generateTreesDFS(start, i-1)
                var rightSubTree = generateTreesDFS(i+1, end)
                for j in 0..<leftSubTree.count {
                    for k in 0..<rightSubTree.count {
                        let node = TreeNode.init(i)
                        node.left = leftSubTree[j]
                        node.right = rightSubTree[k]
                        subTree.append(node)
                    }
                }
            }
        }
        return subTree
    }
    
}
