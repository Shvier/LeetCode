//
//  main.swift
//  105-ConstructBinaryTreefromPreorderandInorderTraversal
//
//  Created by Shvier on 26/03/2018.
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
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildSubTree(preorder, inorder, 0, 0, inorder.count-1)
    }
    
    func buildSubTree(_ preorder: [Int], _ inorder: [Int], _ preStart: Int, _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preorder.count-1 || inStart > inEnd {
            return nil
        }
        let root = TreeNode.init(preorder[preStart])
        let inIndex = inorder.index(of: root.val)!
        root.left = buildSubTree(preorder, inorder, preStart+1, inStart, inIndex-1)
        root.right = buildSubTree(preorder, inorder, preStart+inIndex-inStart+1, inIndex+1, inEnd)
        return root
    }
    
}
