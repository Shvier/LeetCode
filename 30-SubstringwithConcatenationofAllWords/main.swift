//
//  main.swift
//  30-SubstringwithConcatenationofAllWords
//
//  Created by Shvier on 28/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // Error
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let wordLength = (words.first?.lengthOfBytes(using: .utf8))!
        let length = s.lengthOfBytes(using: .utf8)
        var result = Array<Int>()
        for i in 0..<length {
            if i+wordLength > length {
                break
            }
            let startIndex = s.index(s.startIndex, offsetBy: i)
            let endIndex = s.index(startIndex, offsetBy: wordLength)
            let subString = s.substring(with: startIndex..<endIndex)
            for j in 0..<words.count {
                if subString.contains(words[j]) {
                    if result.count > 0 {
                        if i != result.last!+wordLength {
                            result.append(i)
                        }
                    } else {
                        result.append(i)
                    }
                }
            }
        }
        return result
    }
    
}
