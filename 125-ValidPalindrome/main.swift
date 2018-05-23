//
//  main.swift
//  125-ValidPalindrome
//
//  Created by Shvier on 2018/5/23.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isPalindrome(_ s: String) -> Bool {
        let characters = [Character](s.characters)
        if characters.count < 2 {
            return true
        }
        var l = 0
        var r = characters.count-1
        let regularExpression = try? NSRegularExpression(pattern: "[A-Za-z]", options: .caseInsensitive)
        while l != r && l <= r {
            let lMatchCount = regularExpression!.numberOfMatches(in: String(characters[l]), options: .reportProgress, range: NSMakeRange(0, 1))
            if lMatchCount < 1 {
                if l + 1 == r {
                    break
                }
                l = l + 1
                continue
            }
            let rMatchCount = regularExpression!.numberOfMatches(in: String(characters[r]), options: .reportProgress, range: NSMakeRange(0, 1))
            if rMatchCount < 1 {
                if r - 1 == l {
                    break
                }
                r = r - 1
                continue
            }
            print("\(characters[l]) - \(characters[r])")
            let compareResult = String(characters[l]).caseInsensitiveCompare(String(characters[r]))
            if compareResult != .orderedSame {
                return false
            }
            l = l + 1
            r = r - 1
        }
        let compareResult = String(characters[l]).caseInsensitiveCompare(String(characters[r]))
        return compareResult == .orderedSame
    }
    
}

let solution = Solution()
print(solution.isPalindrome("0P"))
