//
//  main.swift
//  58-LengthofLastWord
//
//  Created by Shvier on 22/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func lengthOfLastWord(_ s: String) -> Int {
        let strings = s.components(separatedBy: " ")
        if strings.count < 1 {
            return 0
        }
        for string in strings.reversed() {
            if string.lengthOfBytes(using: .utf8) < 1 {
                continue
            } else { 
                return string.lengthOfBytes(using: .utf8)
            }
        }
        return (strings.last?.lengthOfBytes(using: .utf8))!
    }
    
}

let solution = Solution()
print(solution.lengthOfLastWord("a "))
