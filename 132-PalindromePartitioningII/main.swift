//
//  main.swift
//  132-PalindromePartitioningII
//
//  Created by Shvier on 2018/6/2.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minCut(_ s: String) -> Int {
        var ans = Int.max
        let characters = [Character](s.characters)
        if characters.isEmpty {
            return 0
        }
        var temp = [String]()
        dfs(characters, &ans, &temp, 0)
        return ans
    }
    
    func dfs(_ characters: [Character], _ ans: inout Int, _ temp: inout [String], _ startIndex: Int) {
        if startIndex == characters.count {
            ans = min(ans, temp.count)
            return
        }
        for offset in startIndex..<characters.count {
            if isPalindrome(characters, startIndex, offset) {
                temp.append(String(characters[startIndex...offset]))
                dfs(characters, &ans, &temp, offset + 1)
                let _ = temp.popLast()
            }
        }
    }
    
    func isPalindromeString(_ characters: [Character], _ startIndex: Int, _ endIndex: Int) -> Bool {
        var start = startIndex
        var end = endIndex
        while start <= end {
            if characters[start] != characters[end] {
                return false
            }
            start = start + 1
            end = end - 1
        }
        return true
    }
    
}
