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
        let characters = [Character](s.characters)
        var result = Array<String>()
        for character in characters {
            let string = String(character)
            if string == "(" {
                result.append(")")
            } else if string == "[" {
                result.append("]")
            } else if string == "{" {
                result.append("}")
            } else {
                if result.isEmpty {
                    return false;
                }
                let last = result.last
                if last != nil {
                    result.removeLast()
                }
                if last != string {
                    return false;
                }
            }
        }
        return result.isEmpty
    }
    
}

print(Solution.isValid("()"))
