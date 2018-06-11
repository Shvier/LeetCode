//
//  main.swift
//  139-WordBreak
//
//  Created by Shvier on 2018/6/11.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let characters = [Character](s.characters)
        var visited = Array(repeating: 1, count: characters.count)
        for word in wordDict {
            if s.contains(word) {
                var temp = s as NSString
                while temp.contains(word) {
                    let range = temp.range(of: word)
                    for index in range.location..<range.location + range.length {
                        visited[index] = 0
                    }
                    temp = temp.replacingCharacters(in: range, with: "") as NSString
                }
            }
        }
        for value in visited {
            if value == 1 {
                return false
            }
        }
        return true
    }
    
}

let solution = Solution()
print(solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
