//
//  main.swift
//  44-WildcardMatching
//
//  Created by Shvier on 23/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sLength = s.lengthOfBytes(using: .utf8)
        let pLength = p.lengthOfBytes(using: .utf8)
        if pLength <= 0 {
            if sLength > 0 {
                return false
            } else {
                return true
            }
        }
        if sLength <= 0 && p == "*" {
            return true
        }
        let sCharacters = [Character](s.characters)
        let pCharacters = [Character](p.characters)
        var dp = Array(repeating: Array(repeating: false, count: pLength + 1), count: sLength + 1)
        dp[0][0] = true
        if pLength > 1 {
            for i in 2...pLength {
                if pCharacters[i - 1] == "*" {
                    dp[0][i] = dp[0][i - 2]
                }
            }
        }
        if sLength > 0 {
            for i in 1...sLength {
                for j in 1...pLength {
                    if sCharacters[i - 1] == pCharacters[j - 1] || pCharacters[j - 1] == "?" {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else if pCharacters[j - 1] == "*" {
                        if sCharacters[i - 1] == pCharacters[j - 2] || pCharacters[j - 2] == "?" {
                            dp[i][j] = dp[i][j - 2] || dp[i - 1][j]
                        } else {
                            dp[i][j] = dp[i][j - 2]
                        }
                    } else {
                        dp[i][j] = false
                    }
                }
            }
        }
        return dp[sLength][pLength]
    }
    
}

