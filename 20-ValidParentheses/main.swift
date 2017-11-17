//
//  main.swift
//  20-ValidParentheses
//
//  Created by Shvier on 16/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func isValid(_ s: String) -> Bool {
        var parentthesesCount: Int = 0
        var bracketCount: Int = 0
        var braceCount: Int = 0
        let characters = [Character](s.characters)
        for character in characters {
            let string = String(character)
            if string == "(" {
                parentthesesCount += 1
            } else if string == ")" {
                parentthesesCount -= 1
            } else if string == "[" {
                bracketCount += 1
            } else if string == "]" {
                bracketCount -= 1
            } else if string == "{" {
                braceCount += 1
            } else if string == "}" {
                braceCount -= 1
            }
        }
        return (parentthesesCount == 0) && (bracketCount == 0) && (braceCount == 0)
    }
    
}
