//
//  main.swift
//  65-ValidNumber
//
//  Created by Shvier on 29/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isNumber(_ s: String) -> Bool {
        let trimmedString = s.replacingOccurrences(of: " ", with: "")
        let characters = [Character](trimmedString.characters)
        let length = trimmedString.lengthOfBytes(using: .utf8)
        
        var pointSeen = false
        var eSeen = false
        var numberSeen = false
        var numberAfterE = true
        for i in 0..<length {
            if "0" <= characters[i] && characters[i] <= "9" {
                numberSeen = true
                numberAfterE = true
            } else if characters[i] == "." {
                if eSeen || pointSeen {
                    return false
                }
                pointSeen = true
            } else if characters[i] == "e" {
                if eSeen || !numberSeen {
                    return false
                }
                numberAfterE = false
                eSeen = true
            } else if characters[i] == "-" || characters[i] == "+" {
                if i != 0 && characters[i-1] != "e" {
                    return false
                }
            } else {
                return false
            }
        }
        return numberSeen && numberAfterE
    }
    
}

let solution = Solution()
print(solution.isNumber(""))
