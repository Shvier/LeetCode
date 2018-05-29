//
//  main.swift
//  129-SumRoottoLeafNumbers
//
//  Created by Shvier on 2018/5/29.
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
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        var ans = 0
        var temp = [Int]()
        dfs(root, &ans, &temp)
        return ans
    }
    
    func dfs(_ root: TreeNode?, _ ans: inout Int, _ temp: inout [Int]) {
        if root == nil {
            return
        }
        if root?.left == nil && root?.right == nil {
            temp.append(root!.val)
            let count = temp.count
            for index in 0..<count {
                ans = ans + (temp[index] == 0 ? 0 : temp[index]*Int(pow(10, Double(count-index-1))))
            }
            temp.removeLast()
            return
        }
        temp.append(root!.val)
        dfs(root?.left, &ans, &temp)
        dfs(root?.right, &ans, &temp)
        temp.removeLast()
    }
    
}

//let node1 = TreeNode.init(4)
//let node2 = TreeNode.init(9)
//let node3 = TreeNode.init(0)
//let node4 = TreeNode.init(5)
//let node5 = TreeNode.init(1)
//node1.left = node2
//node1.right = node3
//node2.left = node4
//node2.right = node5

let node1 = TreeNode.init(0)
let node2 = TreeNode.init(1)
node1.left = node2
let solution = Solution()
print(solution.sumNumbers(node1))
