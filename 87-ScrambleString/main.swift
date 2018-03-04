//
//  main.swift
//  87-ScrambleString
//
//  Created by Shvier on 02/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let s1Length = s1.lengthOfBytes(using: .utf8)
        let s2Length = s2.lengthOfBytes(using: .utf8)
        if s1Length != s2Length {
            return false
        }
        if s1 == s2 {
            return true
        }
        let characters1 = [Character](s1.characters)
        let characters2 = [Character](s2.characters)
        var map = [Character: Int]()
        for character in characters1 {
            if map[character] == nil {
                map[character] = 0
            }
            map[character]! += 1
        }
        for character in characters2 {
            if map[character] == nil {
                map[character] = 0
            }
            map[character]! -= 1
        }
        for (_, count) in map {
            if count != 0 {
                return false
            }
        }
        for index in 1..<s1Length {
            let s1LeftIndex = s1.index(s1.startIndex, offsetBy: index)
            let s1RightIndex = s1.index(s1.endIndex, offsetBy: -(s1Length-index))
            let s1LeftSubString = s1.substring(to: s1LeftIndex)
            let s1RightSubString = s1.substring(from: s1RightIndex)
            let s2LeftIndex = s2.index(s2.startIndex, offsetBy: index)
            let s2RightIndex = s2.index(s2.endIndex, offsetBy: -(s2Length-index))
            let s2LeftSubString = s2.substring(to: s2LeftIndex)
            let s2RightSubString = s2.substring(from: s2RightIndex)
            if isScramble(s1LeftSubString, s2LeftSubString) && isScramble(s1RightSubString, s2RightSubString) ||
                isScramble(s1LeftSubString, s2RightSubString) && isScramble(s1RightSubString, s2LeftSubString) {
                return true
            }
        }
        return false
    }
    
}

let solution = Solution()
print(solution.isScramble("abb", "bba"))
