//
//  main.swift
//  17-LetterCombinationsofaPhoneNumber
//
//  Created by Shvier on 08/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func letterCombinations(_ digits: String) -> [String] {
        if digits.lengthOfBytes(using: .utf8) < 1 {
            return []
        }
        var result = Array<String>()
        let characters = [Character](digits.characters)
        result = Solution.digitMapping(String(characters[0]))
        for index in 1..<characters.count {
            let letters = Solution.digitMapping(String(characters[index]))
            result = Solution.mixString(str1: result, str2: letters)
        }
        return result
    }
    
    static func mixString(str1: [String], str2: [String]) -> [String] {
        var mixed = Array<String>()
        for i in 0..<str1.count {
            for j in 0..<str2.count {
                let mix = str1[i]+str2[j]
                mixed.append(mix)
            }
        }
        return mixed
    }
    
    static func digitMapping(_ digit: String) -> [String] {
        switch digit {
        case "2":
            return ["a", "b", "c"]
        case "3":
            return ["d", "e", "f"]
        case "4":
            return ["g", "h", "i"]
        case "5":
            return ["j", "k", "l"]
        case "6":
            return ["m", "n", "o"]
        case "7":
            return ["p", "q", "r", "s"]
        case "8":
            return ["t", "u", "v"]
        case "9":
            return ["w", "x", "y", "z"]
        default:
            return []
        }
    }
    
}

print(Solution.letterCombinations("23"))
