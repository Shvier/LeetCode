//
//  main.swift
//  98-ValidateBinarySearchTree
//
//  Created by Shvier on 13/03/2018.
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
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        var ans = true
        return check(&ans, root)
    }
    
    func check(_ ans: inout Bool, _ root: TreeNode?) -> Bool {
        if root?.left == nil && root?.right == nil {
            return true
        } else if root?.left != nil && root?.right == nil {
            if (root?.left?.val)! < (root?.val)! {
                ans = ans && check(&ans, root?.left)
            } else {
                return false
            }
        } else if root?.left != nil && root?.right == nil {
            if (root?.right?.val)! > (root?.val)! {
                ans = ans && check(&ans, root?.right)
            } else {
                return false
            }
        } else if root?.left != nil && root?.right != nil {
            ans = check(&ans, root?.left) && check(&ans, root?.right)
        }
        return ans
    }
    
}
