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
        let characters = [Character](s.characters)
        let length = characters.count
        if length < 1 {
            return 0
        }
        var ans = Array(repeating: 0, count: characters.count+1)
        ans[0] = 1
        ans[1] = characters[0] == "0" ? 0 : 1
        if length >= 2 {
            for index in 2...length {
                let current = Int.init(String(characters[index-1]))!
                let lastTwo = Int.init(String(characters[index-2]) + String(characters[index-1]))!
                if current > 0 && current < 10 {
                    ans[index] += ans[index-1]
                }
                if lastTwo >= 10 && lastTwo <= 26 {
                    ans[index] += ans[index-2]
                }
            }
        }
        return ans.last!
    }
    
}

let solution = Solution()
print(solution.numDecodings("0"))
