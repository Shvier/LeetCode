//
//  main.swift
//  8-StringtoInteger(atoi)
//
//  Created by Shvier on 19/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func myAtoi(_ str: String) -> Int {
        let trimmedString = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedString.lengthOfBytes(using: .utf8) <= 0 {
            return 0
        }
        let characters = [Character](trimmedString.characters)
        var flag: Bool = true
        var result: Int = 0
        var step: Int = 0
        if characters.first == "+" {
            flag = true
            step = 1
        } else if characters.first == "-" {
            flag = false
            step = 1
        }
        let stringLength = trimmedString.lengthOfBytes(using: .utf8)
        let max = Int(INT32_MAX)
        let min = Int(-INT32_MAX)
        while stringLength > step &&
            String(describing: characters[step]) >= "0" &&
            String(describing: characters[step]) <= "9" {
                let character = String(characters[step])
                let asc: Int = Int((character.unicodeScalars.filter{$0.isASCII}.first?.value)!)
                let zero: Int = Int(("0".unicodeScalars.filter{$0.isASCII}.first?.value)!)
                result = result*10 + asc - zero
                step += 1
                if result > max {
                    return max
                }
                if result < min {
                    return min
                }
        }
        if !flag {
            result = -result
        }
        return result
    }
    
}

print(Solution.myAtoi("-2147483648"))
