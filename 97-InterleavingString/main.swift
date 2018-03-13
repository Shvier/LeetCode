//
//  main.swift
//  97-InterleavingString
//
//  Created by Shvier on 12/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let characters1 = [Character](s1.characters)
        let characters2 = [Character](s2.characters)
        let characters3 = [Character](s3.characters)
        let s1Length = characters1.count
        let s2Length = characters2.count
        let s3Length = characters3.count
        if s1Length + s2Length != s3Length {
            return false
        }
        var dp = Array(repeatElement(Array(repeatElement(false, count: s2Length+1)), count: s1Length+1))
        for i in 0..<s1Length+1 {
            for j in 0..<s2Length+1 {
                if i == 0 && j == 0 {
                    dp[i][j] = true
                } else if i == 0 {
                    dp[i][j] = dp[i][j-1] && (characters2[j-1] == characters3[i+j-1])
                } else if j == 0 {
                    dp[i][j] = dp[i-1][j] && (characters1[i-1] == characters3[i+j-1])
                } else {
                    dp[i][j] = (dp[i-1][j] && (characters1[i-1] == characters3[i+j-1])) || (dp[i][j-1] && (characters2[j-1] == characters3[i+j-1]))
                }
            }
        }
        return dp[s1Length][s2Length]
    }
    
}
