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
        var map = [String : [String]]()
        return dfs2(s, wordDict, &map)
//        var ans = [String]()
//        var temp = [String]()
//        let characters = [Character](s.characters)
//        let length = characters.count
//        
//        var dp = Array(repeating: false, count: length + 1)
//        dp[0] = true
//        for i in 1...length {
//            for j in 0..<i {
//                let temp = String(characters[j..<i])
//                if dp[j] && wordDict.contains(temp) {
//                    dp[i] = true
//                    break
//                }
//            }
//        }
//        if dp[length] {
//            dfs(&ans, &temp, characters, wordDict, length, 0)
//        }
//        return ans
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
        for index in startIndex...length {
            let tempString = String(characters[startIndex..<index])
            if wordDict.contains(tempString) {
                temp.append(tempString)
                dfs(&ans, &temp, characters, wordDict, length, startIndex + tempString.lengthOfBytes(using: .utf8))
                temp.removeLast()
            }
        }
    }
    
    func wordBreak2(_ s: String, _ wordDict: [String]) -> [String] {
        var ans = [String]()
        var temp = [String]()
        let characters = [Character](s.characters)
        let length = characters.count
        
        var dp = Array(repeating: false, count: length + 1)
        dp[0] = true
        for i in 1...length {
            for j in 0..<i {
                let temp = String(characters[j..<i])
                if dp[j] && wordDict.contains(temp) {
                    dp[i] = true
                    break
                }
            }
        }
        if dp[length] {
            dfs(&ans, &temp, characters, wordDict, length, 0)
        }
        return ans
    }
    
    func dfs2(_ string: String, _ wordDict: [String], _ map: inout [String: [String]]) -> [String] {
        if map.keys.contains(string) {
            return map[string]!
        }
        var res = [String]()
        if string.lengthOfBytes(using: .utf8) == 0 {
            res.append("")
            return res
        }
        for word in wordDict {
            if string.hasPrefix(word) {
                let subList = dfs2(string.substring(from: string.index(string.startIndex, offsetBy: word.lengthOfBytes(using: .utf8))), wordDict, &map)
                for sub in subList {
                    res.append("\(word)\(sub.isEmpty ? "" : " ")\(sub)")
                }
            }
        }
        map.updateValue(res, forKey: string)
        return res
    }
    
}

let solution = Solution()
print(solution.wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]))
