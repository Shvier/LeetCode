//
//  main.swift
//  91-DecodeWays
//
//  Created by Shvier on 09/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func numDecodings(_ s: String) -> Int {
        let trimmedString = s.replacingOccurrences(of: "0", with: "")
        let characters = [Character](trimmedString.characters)
        let length = characters.count
        if length < 1 {
            return 0
        }
        var ans = Array(repeating: 0, count: characters.count)
        ans[0] = 1
        if length >= 2 {
            let number = Int.init(String(characters[0]) + String(characters[1]))
            if number! <= 26 {
                ans[1] = 2
            } else {
                ans[1] = 1
            }
        }
        if length > 2 {
            for index in 2..<length {
                let prevIndex = trimmedString.index(trimmedString.startIndex, offsetBy: index-1)
                let currentIndex = trimmedString.index(trimmedString.startIndex, offsetBy: index)
                let subset = trimmedString.substring(with: prevIndex..<currentIndex)
                let number = Int.init(subset)
                if number! <= 26 {
                    ans[index] = ans[index-1] + ans[index-2]
                } else {
                    ans[index] = ans[index-1]
                }
            }
        }
        return ans.last!
    }
    
}

let solution = Solution()
print(solution.numDecodings("111"))
