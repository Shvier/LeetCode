//
//  main.swift
//  106-ConstructBinaryTreefromInorderandPostorderTraversal
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
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return buildSubTree(inorder, postorder, 0, postorder.count-1, 0, inorder.count-1)
    }
    
    func buildSubTree(_ inorder: [Int], _ postorder: [Int], _ postStart: Int, _ postEnd: Int, _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if postStart > postEnd || inStart > inEnd {
            return nil
        }
        let root = TreeNode.init(postorder[postEnd])
        let inIndex = inorder.index(of: root.val)!
        root.left = buildSubTree(inorder, postorder, postStart, postStart+inIndex-inStart-1, inStart, inIndex-1)
        root.right = buildSubTree(inorder, postorder, postEnd-inEnd+inIndex, postEnd-1, inIndex+1, inEnd)
        return root
    }
    
}
