//
//  main.swift
//  140-WordBreakII
//
//  Created by Shvier on 2018/6/13.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var ans = [String]()
        var temp = [String]()
        let characters = [Character](s.characters)
        let length = characters.count
        dfs(&ans, &temp, characters, wordDict, length, 0)
        return ans
    }
    
    func dfs(_ ans: inout [String], _ temp: inout [String], _ characters: [Character], _ wordDict: [String], _ length: Int, _ startIndex: Int) {
        if startIndex > length {
            return
        }
        if startIndex == length {
            let string = temp.joined(separator: " ")
            ans.append(string)
            return
        }
        for j in startIndex...length {
            let tempString = String(characters[startIndex..<j])
            if wordDict.contains(tempString) {
                temp.append(tempString)
                dfs(&ans, &temp, characters, wordDict, length, startIndex + tempString.lengthOfBytes(using: .utf8))
                temp.removeLast()
            }
        }
    }
    
}

let solution = Solution()
print(solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
