//
//  main.swift
//  113-PathSumII
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
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var ans = [[Int]]()
        var temp = [Int]()
        searchPath(&ans, &temp, root, sum)
        return ans
    }
    
    func searchPath(_ ans: inout [[Int]], _ temp: inout [Int], _ root: TreeNode?, _ sum: Int) {
        if root == nil {
            return
        }
        temp.append(root!.val)
        if sum - root!.val == 0 {
            ans.append(temp)
        }
        searchPath(&ans, &temp, root?.left, sum - root!.val)
        searchPath(&ans, &temp, root?.right, sum - root!.val)
        temp.removeLast()
    }

}
