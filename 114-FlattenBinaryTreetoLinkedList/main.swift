//
//  main.swift
//  114-FlattenBinaryTreetoLinkedList
//
//  Created by Shvier on 2018/4/2.
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
    
    func flatten(_ root: TreeNode?) {
        var now = root
        while now != nil {
            if now?.left != nil {
                var prev = now?.left
                while prev?.right != nil {
                    prev = prev?.right
                }
                prev?.right = now?.right
                now?.right = now?.left
                now?.left = nil
            }
            now = now?.right
        }
    }

}
