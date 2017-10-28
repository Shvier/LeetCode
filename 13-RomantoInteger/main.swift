//
//  main.swift
//  13-RomantoInteger
//
//  Created by Shvier on 28/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func romanToInt(_ s: String) -> Int {
        var numbers = Array<Int>()
        let characters = [Character](s.characters)
        for character in characters {
            numbers.append(Solution.numMap(String(character)))
        }
        var result: Int = 0
        for i in 0..<numbers.count {
            if i != numbers.count - 1 {
                if numbers[i] >= numbers[i + 1] {
                    result += numbers[i]
                } else {
                    result -= numbers[i]
                }
            } else {
                result += numbers[i]
            }
        }
        return result
    }
    
    static func numMap(_ s: String) -> Int {
        switch s {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            return 0
        }
    }
    
}

print(Solution.romanToInt("DCXXI"))
