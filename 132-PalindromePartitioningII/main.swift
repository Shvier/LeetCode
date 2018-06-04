//
//  main.swift
//  132-PalindromePartitioningII
//
//  Created by Shvier on 2018/6/2.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minCut(_ s: String) -> Int {
        let characters = [Character](s.characters)
        if characters.isEmpty {
            return 0
        }
        var ans = Array(repeating: 0, count: characters.count+1)
        for index in 0...characters.count {
            ans[index] = index - 1
        }
        var offset = 0
        for index in 0..<characters.count {
            offset = 0
            while index - offset >= 0 && index + offset < characters.count && characters[index - offset] == characters[index + offset] {
                ans[index + offset + 1] = min(ans[index + offset + 1], 1 + ans[index - offset])
                offset = offset + 1
            }
            offset = 1
            while index - offset + 1 >= 0 && index + offset < characters.count && characters[index - offset + 1] == characters[index + offset] {
                ans[index + offset + 1] = min(ans[index + offset + 1], 1 + ans[index - offset + 1])
                offset = offset + 1
            }
        }
        return ans[characters.count]
    }
    
}
