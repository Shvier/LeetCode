//
//  main.swift
//  5-LongestPalindromicSubstring
//
//  Created by Shvier on 13/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    static func longestPalindrome(_ s: String) -> String {
        let reverseCharacters = [Character](String(s.reversed()).characters)
        let normalCharacters = [Character](s.characters)
        var matrix = Array(repeating: [Int](repeating: 0, count: reverseCharacters.count), count: reverseCharacters.count)
        var zone: Int = 0
        var result: String = ""
        for i in 0..<normalCharacters.count {
            let normalCharacter = String(normalCharacters[i])
            for j in 0..<reverseCharacters.count {
                let reverseCharacter = String(reverseCharacters[j])
                if normalCharacter == reverseCharacter {
                    if i == 0 || j == 0 {
                        matrix[i][j] = 0
                    } else {
                        matrix[i][j] = matrix[i-1][j-1] + 1
                    }
                    if matrix[i][j] > zone {
                        zone = matrix[i][j]
                        let startIndex = s.index(s.startIndex, offsetBy: i-zone+1)
                        let endIndex = s.index(s.startIndex, offsetBy: i)
                        result = String(s[startIndex...endIndex])
                    }
                } else {
                    matrix[i][j] = 0
                }
            }
        }
        return result
    }
}

print(Solution.longestPalindrome("babad"))
