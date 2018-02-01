//
//  main.swift
//  68-TextJustification
//
//  Created by Shvier on 31/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var ans = [String]()
        var i = 0
        var j = 0
        let count = words.count
        while i < count {
            var width = 0
            j = i
            while j < count && width + words[j].lengthOfBytes(using: .utf8) + j - i <= maxWidth {
                width += words[j].lengthOfBytes(using: .utf8)
                j += 1
            }
            var space = 1
            var extra = 0
            if j - i != 1 && j != count {
                space = (maxWidth-width)/(j-i-1)
                extra = (maxWidth-width)%(j-i-1)
            }
            var line = words[i]
            for k in i+1..<j {
                for _ in 0..<space {
                    line += " "
                }
                if extra > 0 {
                    line += " "
                }
                extra -= 1
                line += words[k]
            }
            let extraBlank = maxWidth-line.lengthOfBytes(using: .utf8)
            for _ in 0..<extraBlank {
                line += " "
            }
            ans.append(line)
            i = j
        }
        return ans
    }
    
}
