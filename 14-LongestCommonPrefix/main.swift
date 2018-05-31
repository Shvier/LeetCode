//
//  main.swift
//  14-LongestCommonPrefix
//
//  Created by Shvier on 28/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        var commonPrefix = strs[0]
        for i in 1..<strs.count {
            commonPrefix = commonPrefix.commonPrefix(with: strs[i])
            if commonPrefix == strs[i] {
                let length = commonPrefix.lengthOfBytes(using: .utf8)
                if length <= 1 {
                    break
                } else {
                    commonPrefix = commonPrefix.substring(to: commonPrefix.index(commonPrefix.startIndex, offsetBy: commonPrefix.lengthOfBytes(using: .utf8)-1))
                }
            }
        }
        return commonPrefix
    }
    
}

let solution = Solution()
print(solution.longestCommonPrefix(["abc","abcc","abc","abca","abca"]))
