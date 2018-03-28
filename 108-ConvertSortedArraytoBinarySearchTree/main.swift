//
//  main.swift
//  108-ConvertSortedArraytoBinarySearchTree
//
//  Created by Shvier on 28/03/2018.
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
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count < 1 {
            return nil
        }
        return buildSubTree(nums, 0, nums.count-1)
    }
    
    func buildSubTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (left+right)/2
        let root = TreeNode.init(nums[mid])
        root.left = buildSubTree(nums, left, mid-1)
        root.right = buildSubTree(nums, mid+1, right)
        return root
    }
    
}
