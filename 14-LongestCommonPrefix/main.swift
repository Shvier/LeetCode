//
//  main.swift
//  14-LongestCommonPrefix
//
//  Created by Shvier on 28/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        if strs.count == 2 {
            return strs[0].commonPrefix(with: strs[1])
        }
        var commonPrefix = strs[0].commonPrefix(with: strs[1])
        if strs.count == 3 {
            return commonPrefix.commonPrefix(with: strs[2])
        }
        for i in 2..<strs.count-1 {
            let common = commonPrefix.commonPrefix(with: strs[i])
            if common.lengthOfBytes(using: .utf8) <= 0 {
                return ""
            } else {
                commonPrefix = common
            }
        }
        return commonPrefix
    }
    
}

print(Solution.longestCommonPrefix(["baab","bacb","b","cbc"]))
