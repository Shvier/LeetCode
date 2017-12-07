//
//  main.swift
//  32-LongestValidParentheses
//
//  Created by Shvier on 06/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func longestValidParentheses(_ s: String) -> Int {
        let length = s.lengthOfBytes(using: .utf8)
        if length < 2 {
            return 0
        }
        var count = 0
        var longest = Array(repeatElement(0, count: length))
        let characters = [Character](s.characters)
        for i in 1..<characters.count {
            let string = String(characters[i])
            if string == ")" {
                let lastString = String(characters[i-1])
                if lastString == "(" {
                    longest[i] = (i - 2) >= 0 ? longest[i-2] + 2 : 2
                    count = max(longest[i], count)
                } else {
                    if (i - longest[i-1] - 1) >= 0 && String(characters[i-longest[i-1]-1]) == "("{
                        longest[i] = longest[i-1] + 2 + ((i - longest[i-1] - 2) >= 0 ? longest[i - longest[i-1] - 2] : 0)
                        count = max(longest[i], count)
                    }
                }
            }
        }
        return count
    }
    
}

Solution.longestValidParentheses("(()())")
