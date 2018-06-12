//
//  main.swift
//  139-WordBreak
//
//  Created by Shvier on 2018/6/11.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let characters = [Character](s.characters)
        let length = characters.count
        var dp = Array(repeating: false, count: length + 1)
        dp[0] = true
        for i in 1...length {
            for j in 0..<i {
                let temp = String(characters[j..<i])
                if dp[j] && wordDict.contains(temp) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[length]
    }
    
}

let solution = Solution()
print(solution.wordBreak("aaaaaaa", ["aaaa","aaa"]))
